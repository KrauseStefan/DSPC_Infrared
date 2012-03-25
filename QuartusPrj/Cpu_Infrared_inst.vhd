  --Example instantiation for system 'Cpu_Infrared'
  Cpu_Infrared_inst : Cpu_Infrared
    port map(
      LCD_E_from_the_lcd_0 => LCD_E_from_the_lcd_0,
      LCD_RS_from_the_lcd_0 => LCD_RS_from_the_lcd_0,
      LCD_RW_from_the_lcd_0 => LCD_RW_from_the_lcd_0,
      LCD_data_to_and_from_the_lcd_0 => LCD_data_to_and_from_the_lcd_0,
      SRAM_ADDR_from_the_sram_0 => SRAM_ADDR_from_the_sram_0,
      SRAM_CE_N_from_the_sram_0 => SRAM_CE_N_from_the_sram_0,
      SRAM_DQ_to_and_from_the_sram_0 => SRAM_DQ_to_and_from_the_sram_0,
      SRAM_LB_N_from_the_sram_0 => SRAM_LB_N_from_the_sram_0,
      SRAM_OE_N_from_the_sram_0 => SRAM_OE_N_from_the_sram_0,
      SRAM_UB_N_from_the_sram_0 => SRAM_UB_N_from_the_sram_0,
      SRAM_WE_N_from_the_sram_0 => SRAM_WE_N_from_the_sram_0,
      clocks_0_sys_clk_out => clocks_0_sys_clk_out,
      out_port_from_the_pio_output => out_port_from_the_pio_output,
      IR_RX_to_the_Infrared_Compomnent_0 => IR_RX_to_the_Infrared_Compomnent_0,
      clk_0 => clk_0,
      in_port_to_the_pio_input => in_port_to_the_pio_input,
      reset_n => reset_n
    );


