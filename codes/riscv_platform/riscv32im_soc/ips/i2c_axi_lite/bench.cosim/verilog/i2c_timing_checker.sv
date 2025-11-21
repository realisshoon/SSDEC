//----------------------------------------------------------------------------
// I2C Timing Checker Module
//   I2C 프로토콜의 타이밍 규격을 검증하는 모듈
//   - START 조건: SCL=HIGH일 때 SDA가 HIGH→LOW로 전환
//   - STOP 조건: SCL=HIGH일 때 SDA가 LOW→HIGH로 전환
//   - Repeated START: START와 동일한 조건
//   - 데이터 샘플링: SCL의 rising edge에서
//   - 데이터 변경: SCL이 LOW일 때만 허용
//----------------------------------------------------------------------------
`timescale 1ns/1ps

module i2c_timing_checker(
    input wire scl,
    input wire sda
);

    // I2C 타이밍 파라미터 (100kHz 기준, 단위: ns)
    // 실제 스펙에 맞게 조정 필요
    localparam real tHD_STA = 4000.0;  // START 조건 후 SCL HIGH 유지 시간
    localparam real tSU_STA = 4700.0;  // START 조건 전 SCL HIGH 유지 시간
    localparam real tSU_STO = 4000.0;  // STOP 조건 전 SCL HIGH 유지 시간
    localparam real tHD_DAT = 0.0;     // 데이터 유지 시간 (SCL LOW)
    localparam real tSU_DAT = 250.0;   // 데이터 설정 시간 (SCL rising edge 전)
    localparam real tLOW    = 4700.0;  // SCL LOW 시간
    localparam real tHIGH   = 4000.0;  // SCL HIGH 시간

    // 신호 변화 감지를 위한 플립플롭
    reg scl_prev, sda_prev;
    reg scl_prev2, sda_prev2;
    
    // 타이밍 측정용 변수
    real scl_rise_time, scl_fall_time;
    real sda_change_time;
    real last_scl_high_time, last_scl_low_time;
    real last_scl_fall_time;
    real prev_scl_rise_time;
    
    // 상태 추적
    reg start_detected = 1'b0;
    reg stop_detected = 1'b0;
    reg repeated_start_detected = 1'b0;
    
    initial begin
        scl_prev = 1'b1;
        sda_prev = 1'b1;
        scl_prev2 = 1'b1;
        sda_prev2 = 1'b1;
        last_scl_fall_time = 0.0;
        prev_scl_rise_time = 0.0;
    end

    always @(scl or sda) begin
        scl_prev2 <= scl_prev;
        sda_prev2 <= sda_prev;
        scl_prev <= scl;
        sda_prev <= sda;
    end

    // START 조건 검증
    always @(posedge scl) begin
        if (scl_prev == 1'b1 && sda_prev == 1'b1 && sda == 1'b0) begin
            // START 조건: SCL이 HIGH에서 HIGH로 유지되면서 SDA가 HIGH→LOW
            repeated_start_detected <= start_detected; // 이전에 START가 있었다면 Repeated START
            start_detected <= 1'b1;
            $display("[TIMING] START condition detected at time %0t ns", $realtime);
            if (repeated_start_detected) begin
                $display("[TIMING] Repeated START condition detected");
            end
            
            // START 조건 전 SCL HIGH 유지 시간 검증
            if (last_scl_high_time > 0 && ($realtime - last_scl_high_time < tSU_STA)) begin
                $warning("[TIMING VIOLATION] tSU_STA violation: %0t ns (required: %0t ns)", 
                         $realtime - last_scl_high_time, tSU_STA);
            end
        end
    end

    // STOP 조건 검증
    always @(posedge scl) begin
        if (scl_prev == 1'b1 && sda_prev == 1'b0 && sda == 1'b1) begin
            // STOP 조건: SCL이 HIGH에서 HIGH로 유지되면서 SDA가 LOW→HIGH
            stop_detected <= 1'b1;
            start_detected <= 1'b0;
            repeated_start_detected <= 1'b0;
            $display("[TIMING] STOP condition detected at time %0t ns", $realtime);
            
            // STOP 조건 전 SCL HIGH 유지 시간 검증
            if (last_scl_high_time > 0 && ($realtime - last_scl_high_time < tSU_STO)) begin
                $warning("[TIMING VIOLATION] tSU_STO violation: %0t ns (required: %0t ns)", 
                         $realtime - last_scl_high_time, tSU_STO);
            end
        end
    end

    // SCL rising edge에서 데이터 샘플링 검증
    always @(posedge scl) begin
        last_scl_high_time = $realtime;
        scl_rise_time = $realtime;
        
        // 데이터는 SCL rising edge에서 샘플링되어야 함
        // (실제 샘플링은 마스터/슬레이브에서 수행)
        $display("[TIMING] SCL rising edge at %0t ns, SDA=%b", $realtime, sda);
    end

    // SCL falling edge 추적
    always @(negedge scl) begin
        automatic real current_time = $realtime;
        last_scl_low_time = current_time;
        scl_fall_time = current_time;
        
        // SCL HIGH 시간 검증 (이전 falling edge부터 현재까지)
        if (last_scl_fall_time > 0) begin
            automatic real high_time = current_time - last_scl_fall_time;
            if (high_time < tHIGH) begin
                $warning("[TIMING VIOLATION] tHIGH violation: %0t ns (required: %0t ns)", 
                         high_time, tHIGH);
            end
        end
        last_scl_fall_time = current_time;
        
        $display("[TIMING] SCL falling edge at %0t ns, SDA=%b", $realtime, sda);
    end

    // SDA 변화 추적 (데이터 변경은 SCL LOW일 때만 허용)
    always @(sda) begin
        sda_change_time = $realtime;
        
        // SCL이 HIGH일 때 SDA가 변경되면 경고 (START/STOP 제외)
        if (scl == 1'b1 && !start_detected && !stop_detected) begin
            $warning("[TIMING VIOLATION] SDA changed while SCL is HIGH at %0t ns", $realtime);
            $warning("  SDA should only change when SCL is LOW (except START/STOP conditions)");
        end
        
        // START/STOP 조건이 아닐 때 SDA 변화 로깅
        if (scl == 1'b0) begin
            $display("[TIMING] SDA changed to %b at %0t ns (SCL is LOW - OK)", sda, $realtime);
        end
    end

    // SCL 주기 검증
    always @(posedge scl) begin
        automatic real current_time = $realtime;
        if (prev_scl_rise_time > 0) begin
            automatic real period = current_time - prev_scl_rise_time;
            automatic real freq = 1_000_000_000.0 / period;
            
            if (period < (tHIGH + tLOW)) begin
                $warning("[TIMING VIOLATION] SCL period too short: %0t ns (min: %0t ns)", 
                         period, tHIGH + tLOW);
            end
            
            if (freq > 400_000) begin  // 400kHz 제한
                $warning("[TIMING VIOLATION] SCL frequency too high: %0.0f Hz (max: 400kHz)", freq);
            end
        end
        prev_scl_rise_time = current_time;
    end

endmodule

//----------------------------------------------------------------------------
// Revision history
// 2025.11.17: Created for I2C timing verification
//----------------------------------------------------------------------------

