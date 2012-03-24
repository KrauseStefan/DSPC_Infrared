----------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 0.0.0 (Built: TIMESTAMP_ADDED_DURING_BUILD)
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: � 2011 Altera Corporation.  All rights reserved. Your use of 
-- Altera  Corporation's design tools, logic functions and other software and 
-- tools, and its AMPP  partner logic functions, and  any output files any of 
-- the  foregoing device programming or simulation files), and any associated 
-- documentation  or  information  are  expressly  subject  to  the terms and 
-- conditions of the  Altera  Program License  Subscription Agreement, Altera 
-- MegaCore Function License Agreement, or other applicable license agreement,
-- including, without  limitation, that  your use  is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by Altera or its 
-- authorized  distributors.  Please refer to  the  applicable  agreement for 
-- further details.
----------------------------------------------------------------------------- 

-- VHDL created from filter_0002_rtl
-- VHDL created on Sat Mar 24 10:32:44 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from d:/SJ/nightly/11.1/173/w32/p4/ip/aion/src/mip_common/hw_model.cpp:1213
entity filter_0002_rtl is
    port (
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_0 : in std_logic_vector(7 downto 0);
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        xOut_0 : out std_logic_vector(21 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        h_areset : in std_logic
        );
end;

architecture normal of filter_0002_rtl is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal d_xIn_0_13_q : std_logic_vector (7 downto 0);
    signal d_xIn_0_13_v_0 : std_logic_vector (7 downto 0);
    signal d_xIn_0_13_v_1 : std_logic_vector (7 downto 0);
    signal d_in0_m0_wi0_wo0_assign_sel_q_13_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_sel_q_13_v_0 : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_sel_q_13_v_1 : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_run_count : std_logic_vector(1 downto 0);
    signal u0_m0_wo0_run_pre_ena_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_run_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_run_out : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_run_enable_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_run_ctrl : std_logic_vector(2 downto 0);
    signal u0_m0_wo0_memread_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_compute_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_compute_v_0 : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_compute_q_13_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_compute_q_18_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_compute_q_18_v_0 : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_compute_q_18_v_1 : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_compute_q_18_v_2 : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_compute_q_18_v_3 : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_compute_q_19_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_ra0_count0_q : std_logic_vector(4 downto 0);
    signal u0_m0_wo0_wi0_ra0_count0_i : unsigned(4 downto 0);
    signal u0_m0_wo0_wi0_ra0_count0_eq : std_logic;
    signal u0_m0_wo0_wi0_ra0_count0_lut_q : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_wa0_q : std_logic_vector(2 downto 0);
    signal u0_m0_wo0_wi0_wa0_i : unsigned(2 downto 0);
    signal u0_m0_wo0_wi0_wa0_eq : std_logic;
    signal u0_m0_wo0_wi0_delayr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr0_iq : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_delayr0_ia : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_delayr0_ir : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_delayr0_aa : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr0_ab : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr0_q : std_logic_vector (7 downto 0);
    signal d_u0_m0_wo0_wi0_delayr0_q_15_q : std_logic_vector (7 downto 0);
    signal d_u0_m0_wo0_wi0_delayr0_q_15_v_0 : std_logic_vector (7 downto 0);
    signal d_u0_m0_wo0_wi0_split1_c_14_q : std_logic_vector (7 downto 0);
    signal d_u0_m0_wo0_wi0_split1_b_14_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_delayr9_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_0 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_1 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_2 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_3 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_4 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_5 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_6 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_7 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_8 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_9 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_10 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_11 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_12 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_13 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_14 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_15 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_16 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_17 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_18 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_19 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_20 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_21 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_22 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr9_v_23 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_ca10_q : std_logic_vector(2 downto 0);
    signal u0_m0_wo0_ca10_i : unsigned(2 downto 0);
    signal u0_m0_wo0_ca10_eq : std_logic;
    signal d_u0_m0_wo0_ca10_q_13_q : std_logic_vector (2 downto 0);
    signal d_u0_m0_wo0_ca10_q_14_q : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_cm0_q : std_logic_vector(7 downto 0);
    signal u0_m0_wo0_cm1_q : std_logic_vector(7 downto 0);
    signal u0_m0_wo0_cm2_q : std_logic_vector(7 downto 0);
    signal u0_m0_wo0_cm3_q : std_logic_vector(7 downto 0);
    signal u0_m0_wo0_cm4_q : std_logic_vector(7 downto 0);
    signal u0_m0_wo0_cm5_q : std_logic_vector(7 downto 0);
    signal u0_m0_wo0_cm6_q : std_logic_vector(7 downto 0);
    signal u0_m0_wo0_cm7_q : std_logic_vector(7 downto 0);
    signal u0_m0_wo0_cm8_q : std_logic_vector(7 downto 0);
    signal u0_m0_wo0_cm9_q : std_logic_vector(7 downto 0);
    signal u0_m0_wo0_cm10_q : std_logic_vector(7 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_a : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_s1 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_10_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_a : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_s1 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_9_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_a : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_s1 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_a : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_s1 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_7_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_a : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_s1 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_a : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_s1 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_5_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_a : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_s1 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_a : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_s1 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_3_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_a : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_s1 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_a : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_s1 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_1_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_a : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_s1 : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_add0_1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_mtree_add0_1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_mtree_add0_1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_add0_1_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_add0_2_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_mtree_add0_2_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_mtree_add0_2_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_add0_2_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_add0_3_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_mtree_add0_3_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_mtree_add0_3_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_add0_3_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_add0_4_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_mtree_add0_4_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_mtree_add0_4_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_add0_4_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : std_logic_vector(17 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : std_logic_vector(17 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_add1_1_a : std_logic_vector(17 downto 0);
    signal u0_m0_wo0_mtree_add1_1_b : std_logic_vector(17 downto 0);
    signal u0_m0_wo0_mtree_add1_1_o : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_add1_1_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_add1_2_a : std_logic_vector(17 downto 0);
    signal u0_m0_wo0_mtree_add1_2_b : std_logic_vector(17 downto 0);
    signal u0_m0_wo0_mtree_add1_2_o : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_add1_2_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_add3_0_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_add3_0_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_add3_0_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_add3_0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_aseq_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_accum_a : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_accum_b : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_accum_i : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_accum_o : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_accum_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_accum_reset : std_logic;
    COMPONENT filter_0002_rtl_AddWithSload IS
        GENERIC (
        L : INTEGER;
        SIMULATION : STRING := "FALSE";
        OPTIMIZED : STRING := "FALSE"
    );
    PORT (
        clk, reset : IN STD_LOGIC;
        ena : IN STD_LOGIC := '1';
        sreset : IN STD_LOGIC := '0';
        sload : IN STD_LOGIC;
        loadval_in : IN STD_LOGIC_VECTOR(L-1 DOWNTO 0);
        doAddnSub : IN STD_LOGIC := '1';
        addL_in : IN STD_LOGIC_VECTOR(L-1 DOWNTO 0);
        addR_in : IN STD_LOGIC_VECTOR(L-1 DOWNTO 0);
        sum_out : OUT STD_LOGIC_VECTOR(L-1 DOWNTO 0)
    );
    END COMPONENT;
    signal u0_m0_wo0_oseq_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr1_replace_mem_iq : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_ia : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_ir : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_aa : std_logic_vector (4 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_ab : std_logic_vector (4 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_q : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_rdcnt_i : unsigned(4 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq : std_logic;
    signal u0_m0_wo0_wi0_delayr1_replace_wrreg_q : std_logic_vector (4 downto 0);
    signal u0_m0_wo0_wi0_delayr1_mem_top_q : std_logic_vector (5 downto 0);
    signal u0_m0_wo0_wi0_delayr1_cmpReg_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_notEnable_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_notEnable_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_enaAnd_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_enaAnd_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_oseq_gated_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_oseq_gated_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_oseq_gated_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_split9_in : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split9_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_split9_c : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_split1_in : std_logic_vector (63 downto 0);
    signal u0_m0_wo0_wi0_split1_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_split1_c : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_split1_d : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_split1_e : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_split1_f : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_split1_g : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_split1_h : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_split1_i : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_delayr1_cmp_a : std_logic_vector(5 downto 0);
    signal u0_m0_wo0_wi0_delayr1_cmp_b : std_logic_vector(5 downto 0);
    signal u0_m0_wo0_wi0_delayr1_cmp_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_nor_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_nor_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_nor_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_join9_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_join1_q : std_logic_vector (63 downto 0);
begin


	--GND(CONSTANT,1)@20
    GND_q <= "0";

	--VCC(CONSTANT,2)@0
    VCC_q <= "1";

	--xIn(PORTIN,3)@10

	--d_xIn_0_13(DELAY,61)@10
    d_xIn_0_13: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_13_v_0 <= (others => '0');
            d_xIn_0_13_v_1 <= (others => '0');
            d_xIn_0_13_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_xIn_0_13_v_0 <= xIn_0;
            d_xIn_0_13_v_1 <= d_xIn_0_13_v_0;
            d_xIn_0_13_q <= d_xIn_0_13_v_1;
        END IF;
    END PROCESS;


	--d_in0_m0_wi0_wo0_assign_sel_q_13(DELAY,62)@10
    d_in0_m0_wi0_wo0_assign_sel_q_13: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_in0_m0_wi0_wo0_assign_sel_q_13_v_0 <= (others => '0');
            d_in0_m0_wi0_wo0_assign_sel_q_13_v_1 <= (others => '0');
            d_in0_m0_wi0_wo0_assign_sel_q_13_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_in0_m0_wi0_wo0_assign_sel_q_13_v_0 <= xIn_v;
            d_in0_m0_wi0_wo0_assign_sel_q_13_v_1 <= d_in0_m0_wi0_wo0_assign_sel_q_13_v_0;
            d_in0_m0_wi0_wo0_assign_sel_q_13_q <= d_in0_m0_wi0_wo0_assign_sel_q_13_v_1;
        END IF;
    END PROCESS;


	--u0_m0_wo0_run(ENABLEGENERATOR,6)@10
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enable_q;
    u0_m0_wo0_run: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : signed(2 downto 0);
        variable u0_m0_wo0_run_inc : signed(1 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(3,3);
            u0_m0_wo0_run_enable_q <= "0";
            u0_m0_wo0_run_count <= "00";
            u0_m0_wo0_run_inc := (OTHERS => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(2) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + 4;
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - 1;
                END IF;
                u0_m0_wo0_run_enable_q <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(2 DOWNTO 2));
            ELSE
                u0_m0_wo0_run_enable_q <= "0";
            END IF;
            CASE u0_m0_wo0_run_ctrl is
                WHEN "000" | "001" =>
                    u0_m0_wo0_run_inc := "00";
                WHEN "010" | "011" =>
                    u0_m0_wo0_run_inc := "11";
                WHEN "100" =>
                    u0_m0_wo0_run_inc := "00";
                WHEN "101" =>
                    u0_m0_wo0_run_inc := "01";
                WHEN "110" =>
                    u0_m0_wo0_run_inc := "11";
                WHEN "111" =>
                    u0_m0_wo0_run_inc := "00";
                WHEN OTHERS =>
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_pre_ena_q <= u0_m0_wo0_run_count(1 downto 1);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_pre_ena_q AND VCC_q;

	--u0_m0_wo0_memread(DELAY,7)@12
    u0_m0_wo0_memread: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_memread_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_memread_q <= u0_m0_wo0_run_q;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_memread_q_13(DELAY,63)@12
    d_u0_m0_wo0_memread_q_13: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_memread_q_13_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_memread_q_13_q <= u0_m0_wo0_memread_q;
        END IF;
    END PROCESS;


	--u0_m0_wo0_compute(DELAY,8)@12
    u0_m0_wo0_compute: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_compute_v_0 <= (others => '0');
            u0_m0_wo0_compute_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_compute_v_0 <= u0_m0_wo0_memread_q;
            u0_m0_wo0_compute_q <= u0_m0_wo0_compute_v_0;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_compute_q_13(DELAY,64)@12
    d_u0_m0_wo0_compute_q_13: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_compute_q_13_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_compute_q_13_q <= u0_m0_wo0_compute_q;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_compute_q_18(DELAY,65)@13
    d_u0_m0_wo0_compute_q_18: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_compute_q_18_v_0 <= (others => '0');
            d_u0_m0_wo0_compute_q_18_v_1 <= (others => '0');
            d_u0_m0_wo0_compute_q_18_v_2 <= (others => '0');
            d_u0_m0_wo0_compute_q_18_v_3 <= (others => '0');
            d_u0_m0_wo0_compute_q_18_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_compute_q_18_v_0 <= d_u0_m0_wo0_compute_q_13_q;
            d_u0_m0_wo0_compute_q_18_v_1 <= d_u0_m0_wo0_compute_q_18_v_0;
            d_u0_m0_wo0_compute_q_18_v_2 <= d_u0_m0_wo0_compute_q_18_v_1;
            d_u0_m0_wo0_compute_q_18_v_3 <= d_u0_m0_wo0_compute_q_18_v_2;
            d_u0_m0_wo0_compute_q_18_q <= d_u0_m0_wo0_compute_q_18_v_3;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_compute_q_19(DELAY,66)@18
    d_u0_m0_wo0_compute_q_19: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_compute_q_19_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_compute_q_19_q <= d_u0_m0_wo0_compute_q_18_q;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_ra0_count0(COUNTER,9)@13
    -- every=1, low=0, high=24, step=1, init=1
    u0_m0_wo0_wi0_ra0_count0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra0_count0_i <= TO_UNSIGNED(1,5);
            u0_m0_wo0_wi0_ra0_count0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                    IF u0_m0_wo0_wi0_ra0_count0_i = 23 THEN
                      u0_m0_wo0_wi0_ra0_count0_eq <= '1';
                    ELSE
                      u0_m0_wo0_wi0_ra0_count0_eq <= '0';
                    END IF;
                    IF (u0_m0_wo0_wi0_ra0_count0_eq = '1') THEN
                        u0_m0_wo0_wi0_ra0_count0_i <= u0_m0_wo0_wi0_ra0_count0_i - 24;
                    ELSE
                        u0_m0_wo0_wi0_ra0_count0_i <= u0_m0_wo0_wi0_ra0_count0_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra0_count0_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_ra0_count0_i,5));


	--u0_m0_wo0_wi0_ra0_count0_lut(LUT,10)@13
    u0_m0_wo0_wi0_ra0_count0_lut: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra0_count0_lut_q <= "000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                CASE u0_m0_wo0_wi0_ra0_count0_q IS
                    WHEN "00000" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "000";
                    WHEN "00001" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "001";
                    WHEN "00010" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "010";
                    WHEN "00011" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "011";
                    WHEN "00100" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "100";
                    WHEN "00101" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "001";
                    WHEN "00110" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "010";
                    WHEN "00111" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "011";
                    WHEN "01000" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "100";
                    WHEN "01001" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "000";
                    WHEN "01010" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "010";
                    WHEN "01011" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "011";
                    WHEN "01100" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "100";
                    WHEN "01101" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "000";
                    WHEN "01110" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "001";
                    WHEN "01111" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "011";
                    WHEN "10000" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "100";
                    WHEN "10001" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "000";
                    WHEN "10010" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "001";
                    WHEN "10011" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "010";
                    WHEN "10100" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "100";
                    WHEN "10101" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "000";
                    WHEN "10110" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "001";
                    WHEN "10111" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "010";
                    WHEN "11000" => u0_m0_wo0_wi0_ra0_count0_lut_q <= "011";
                    WHEN OTHERS => u0_m0_wo0_wi0_ra0_count0_lut_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_wa0(COUNTER,11)@13
    -- every=1, low=0, high=4, step=1, init=4
    u0_m0_wo0_wi0_wa0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_wa0_i <= TO_UNSIGNED(4,3);
            u0_m0_wo0_wi0_wa0_eq <= '1';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_13_q = "1") THEN
                    IF u0_m0_wo0_wi0_wa0_i = 3 THEN
                      u0_m0_wo0_wi0_wa0_eq <= '1';
                    ELSE
                      u0_m0_wo0_wi0_wa0_eq <= '0';
                    END IF;
                    IF (u0_m0_wo0_wi0_wa0_eq = '1') THEN
                        u0_m0_wo0_wi0_wa0_i <= u0_m0_wo0_wi0_wa0_i - 4;
                    ELSE
                        u0_m0_wo0_wi0_wa0_i <= u0_m0_wo0_wi0_wa0_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_wa0_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_wa0_i,3));


	--u0_m0_wo0_wi0_delayr0(DUALMEM,12)@13
    u0_m0_wo0_wi0_delayr0_reset0 <= areset;
    u0_m0_wo0_wi0_delayr0_ia <= d_xIn_0_13_q;
    u0_m0_wo0_wi0_delayr0_aa <= u0_m0_wo0_wi0_wa0_q;
    u0_m0_wo0_wi0_delayr0_ab <= u0_m0_wo0_wi0_ra0_count0_lut_q;
    u0_m0_wo0_wi0_delayr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 8,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "OLD_DATA",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => d_in0_m0_wi0_wo0_assign_sel_q_13_q(0),
        aclr0 => u0_m0_wo0_wi0_delayr0_reset0,
        clock0 => clk,
        address_b => u0_m0_wo0_wi0_delayr0_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_wi0_delayr0_iq,
        address_a => u0_m0_wo0_wi0_delayr0_aa,
        data_a => u0_m0_wo0_wi0_delayr0_ia
    );
        u0_m0_wo0_wi0_delayr0_q <= u0_m0_wo0_wi0_delayr0_iq(7 downto 0);

	--d_u0_m0_wo0_wi0_delayr0_q_15(DELAY,67)@13
    d_u0_m0_wo0_wi0_delayr0_q_15: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_delayr0_q_15_v_0 <= (others => '0');
            d_u0_m0_wo0_wi0_delayr0_q_15_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_delayr0_q_15_v_0 <= u0_m0_wo0_wi0_delayr0_q;
            d_u0_m0_wo0_wi0_delayr0_q_15_q <= d_u0_m0_wo0_wi0_delayr0_q_15_v_0;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_wi0_split1_c_14(DELAY,69)@13
    d_u0_m0_wo0_wi0_split1_c_14: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_split1_c_14_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_split1_c_14_q <= u0_m0_wo0_wi0_split1_c;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_wi0_split1_b_14(DELAY,68)@13
    d_u0_m0_wo0_wi0_split1_b_14: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_split1_b_14_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_split1_b_14_q <= u0_m0_wo0_wi0_split1_b;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr9(DELAY,19)@13
    u0_m0_wo0_wi0_delayr9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr9_v_0 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_1 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_2 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_3 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_4 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_5 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_6 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_7 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_8 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_9 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_10 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_11 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_12 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_13 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_14 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_15 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_16 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_17 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_18 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_19 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_20 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_21 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_22 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_v_23 <= (others => '0');
            u0_m0_wo0_wi0_delayr9_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_delayr9_v_0 <= u0_m0_wo0_wi0_join9_q;
                u0_m0_wo0_wi0_delayr9_v_1 <= u0_m0_wo0_wi0_delayr9_v_0;
                u0_m0_wo0_wi0_delayr9_v_2 <= u0_m0_wo0_wi0_delayr9_v_1;
                u0_m0_wo0_wi0_delayr9_v_3 <= u0_m0_wo0_wi0_delayr9_v_2;
                u0_m0_wo0_wi0_delayr9_v_4 <= u0_m0_wo0_wi0_delayr9_v_3;
                u0_m0_wo0_wi0_delayr9_v_5 <= u0_m0_wo0_wi0_delayr9_v_4;
                u0_m0_wo0_wi0_delayr9_v_6 <= u0_m0_wo0_wi0_delayr9_v_5;
                u0_m0_wo0_wi0_delayr9_v_7 <= u0_m0_wo0_wi0_delayr9_v_6;
                u0_m0_wo0_wi0_delayr9_v_8 <= u0_m0_wo0_wi0_delayr9_v_7;
                u0_m0_wo0_wi0_delayr9_v_9 <= u0_m0_wo0_wi0_delayr9_v_8;
                u0_m0_wo0_wi0_delayr9_v_10 <= u0_m0_wo0_wi0_delayr9_v_9;
                u0_m0_wo0_wi0_delayr9_v_11 <= u0_m0_wo0_wi0_delayr9_v_10;
                u0_m0_wo0_wi0_delayr9_v_12 <= u0_m0_wo0_wi0_delayr9_v_11;
                u0_m0_wo0_wi0_delayr9_v_13 <= u0_m0_wo0_wi0_delayr9_v_12;
                u0_m0_wo0_wi0_delayr9_v_14 <= u0_m0_wo0_wi0_delayr9_v_13;
                u0_m0_wo0_wi0_delayr9_v_15 <= u0_m0_wo0_wi0_delayr9_v_14;
                u0_m0_wo0_wi0_delayr9_v_16 <= u0_m0_wo0_wi0_delayr9_v_15;
                u0_m0_wo0_wi0_delayr9_v_17 <= u0_m0_wo0_wi0_delayr9_v_16;
                u0_m0_wo0_wi0_delayr9_v_18 <= u0_m0_wo0_wi0_delayr9_v_17;
                u0_m0_wo0_wi0_delayr9_v_19 <= u0_m0_wo0_wi0_delayr9_v_18;
                u0_m0_wo0_wi0_delayr9_v_20 <= u0_m0_wo0_wi0_delayr9_v_19;
                u0_m0_wo0_wi0_delayr9_v_21 <= u0_m0_wo0_wi0_delayr9_v_20;
                u0_m0_wo0_wi0_delayr9_v_22 <= u0_m0_wo0_wi0_delayr9_v_21;
                u0_m0_wo0_wi0_delayr9_v_23 <= u0_m0_wo0_wi0_delayr9_v_22;
                u0_m0_wo0_wi0_delayr9_q <= u0_m0_wo0_wi0_delayr9_v_23;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_ca10(COUNTER,20)@12
    -- every=1, low=0, high=4, step=1, init=0
    u0_m0_wo0_ca10: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca10_i <= TO_UNSIGNED(0,3);
            u0_m0_wo0_ca10_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                    IF u0_m0_wo0_ca10_i = 3 THEN
                      u0_m0_wo0_ca10_eq <= '1';
                    ELSE
                      u0_m0_wo0_ca10_eq <= '0';
                    END IF;
                    IF (u0_m0_wo0_ca10_eq = '1') THEN
                        u0_m0_wo0_ca10_i <= u0_m0_wo0_ca10_i - 4;
                    ELSE
                        u0_m0_wo0_ca10_i <= u0_m0_wo0_ca10_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca10_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca10_i,3));


	--d_u0_m0_wo0_ca10_q_13(DELAY,70)@12
    d_u0_m0_wo0_ca10_q_13: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_ca10_q_13_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_ca10_q_13_q <= u0_m0_wo0_ca10_q;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_ca10_q_14(DELAY,71)@13
    d_u0_m0_wo0_ca10_q_14: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_ca10_q_14_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_ca10_q_14_q <= d_u0_m0_wo0_ca10_q_13_q;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm0(LOOKUP,21)@14
    u0_m0_wo0_cm0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm0_q <= "00001101";
        ELSIF(clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m0_wo0_ca10_q_14_q) IS
                WHEN "000" =>
                    u0_m0_wo0_cm0_q <= "00001101";
                WHEN "001" =>
                    u0_m0_wo0_cm0_q <= "00001011";
                WHEN "010" =>
                    u0_m0_wo0_cm0_q <= "00000110";
                WHEN "011" =>
                    u0_m0_wo0_cm0_q <= "00000001";
                WHEN "100" =>
                    u0_m0_wo0_cm0_q <= "11111101";
                WHEN OTHERS =>
                    u0_m0_wo0_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm1(LOOKUP,22)@13
    u0_m0_wo0_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm1_q <= "11011001";
        ELSIF(clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m0_wo0_ca10_q_13_q) IS
                WHEN "000" =>
                    u0_m0_wo0_cm1_q <= "11011001";
                WHEN "001" =>
                    u0_m0_wo0_cm1_q <= "11100010";
                WHEN "010" =>
                    u0_m0_wo0_cm1_q <= "11110010";
                WHEN "011" =>
                    u0_m0_wo0_cm1_q <= "00000001";
                WHEN "100" =>
                    u0_m0_wo0_cm1_q <= "00001010";
                WHEN OTHERS =>
                    u0_m0_wo0_cm1_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm2(LOOKUP,23)@13
    u0_m0_wo0_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm2_q <= "01001011";
        ELSIF(clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m0_wo0_ca10_q_13_q) IS
                WHEN "000" =>
                    u0_m0_wo0_cm2_q <= "01001011";
                WHEN "001" =>
                    u0_m0_wo0_cm2_q <= "00110100";
                WHEN "010" =>
                    u0_m0_wo0_cm2_q <= "00010001";
                WHEN "011" =>
                    u0_m0_wo0_cm2_q <= "11110010";
                WHEN "100" =>
                    u0_m0_wo0_cm2_q <= "11011101";
                WHEN OTHERS =>
                    u0_m0_wo0_cm2_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm3(LOOKUP,24)@12
    u0_m0_wo0_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm3_q <= "10011001";
        ELSIF(clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "000" =>
                    u0_m0_wo0_cm3_q <= "10011001";
                WHEN "001" =>
                    u0_m0_wo0_cm3_q <= "11000010";
                WHEN "010" =>
                    u0_m0_wo0_cm3_q <= "11111010";
                WHEN "011" =>
                    u0_m0_wo0_cm3_q <= "00101100";
                WHEN "100" =>
                    u0_m0_wo0_cm3_q <= "01001010";
                WHEN OTHERS => -- unreachable
                    u0_m0_wo0_cm3_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm4(LOOKUP,25)@12
    u0_m0_wo0_cm4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm4_q <= "01101001";
        ELSIF(clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "000" =>
                    u0_m0_wo0_cm4_q <= "01101001";
                WHEN "001" =>
                    u0_m0_wo0_cm4_q <= "00110001";
                WHEN "010" =>
                    u0_m0_wo0_cm4_q <= "11101011";
                WHEN "011" =>
                    u0_m0_wo0_cm4_q <= "10101111";
                WHEN "100" =>
                    u0_m0_wo0_cm4_q <= "10010001";
                WHEN OTHERS => -- unreachable
                    u0_m0_wo0_cm4_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm5(LOOKUP,26)@12
    u0_m0_wo0_cm5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm5_q <= "10101111";
        ELSIF(clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "000" =>
                    u0_m0_wo0_cm5_q <= "10101111";
                WHEN "001" =>
                    u0_m0_wo0_cm5_q <= "11101011";
                WHEN "010" =>
                    u0_m0_wo0_cm5_q <= "00110001";
                WHEN "011" =>
                    u0_m0_wo0_cm5_q <= "01101001";
                WHEN "100" =>
                    u0_m0_wo0_cm5_q <= "01111111";
                WHEN OTHERS => -- unreachable
                    u0_m0_wo0_cm5_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm6(LOOKUP,27)@12
    u0_m0_wo0_cm6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm6_q <= "00101100";
        ELSIF(clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "000" =>
                    u0_m0_wo0_cm6_q <= "00101100";
                WHEN "001" =>
                    u0_m0_wo0_cm6_q <= "11111010";
                WHEN "010" =>
                    u0_m0_wo0_cm6_q <= "11000010";
                WHEN "011" =>
                    u0_m0_wo0_cm6_q <= "10011001";
                WHEN "100" =>
                    u0_m0_wo0_cm6_q <= "10010001";
                WHEN OTHERS => -- unreachable
                    u0_m0_wo0_cm6_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm7(LOOKUP,28)@12
    u0_m0_wo0_cm7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm7_q <= "11110010";
        ELSIF(clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "000" =>
                    u0_m0_wo0_cm7_q <= "11110010";
                WHEN "001" =>
                    u0_m0_wo0_cm7_q <= "00010001";
                WHEN "010" =>
                    u0_m0_wo0_cm7_q <= "00110100";
                WHEN "011" =>
                    u0_m0_wo0_cm7_q <= "01001011";
                WHEN "100" =>
                    u0_m0_wo0_cm7_q <= "01001010";
                WHEN OTHERS => -- unreachable
                    u0_m0_wo0_cm7_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm8(LOOKUP,29)@12
    u0_m0_wo0_cm8: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm8_q <= "00000001";
        ELSIF(clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "000" =>
                    u0_m0_wo0_cm8_q <= "00000001";
                WHEN "001" =>
                    u0_m0_wo0_cm8_q <= "11110010";
                WHEN "010" =>
                    u0_m0_wo0_cm8_q <= "11100010";
                WHEN "011" =>
                    u0_m0_wo0_cm8_q <= "11011001";
                WHEN "100" =>
                    u0_m0_wo0_cm8_q <= "11011101";
                WHEN OTHERS => -- unreachable
                    u0_m0_wo0_cm8_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm9(LOOKUP,30)@12
    u0_m0_wo0_cm9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm9_q <= "00000001";
        ELSIF(clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "000" =>
                    u0_m0_wo0_cm9_q <= "00000001";
                WHEN "001" =>
                    u0_m0_wo0_cm9_q <= "00000110";
                WHEN "010" =>
                    u0_m0_wo0_cm9_q <= "00001011";
                WHEN "011" =>
                    u0_m0_wo0_cm9_q <= "00001101";
                WHEN "100" =>
                    u0_m0_wo0_cm9_q <= "00001010";
                WHEN OTHERS => -- unreachable
                    u0_m0_wo0_cm9_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm10(LOOKUP,31)@12
    u0_m0_wo0_cm10: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm10_q <= "00000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "000" =>
                    u0_m0_wo0_cm10_q <= "00000000";
                WHEN "001" =>
                    u0_m0_wo0_cm10_q <= "00000000";
                WHEN "010" =>
                    u0_m0_wo0_cm10_q <= "00000000";
                WHEN "011" =>
                    u0_m0_wo0_cm10_q <= "00000000";
                WHEN "100" =>
                    u0_m0_wo0_cm10_q <= "11111101";
                WHEN OTHERS => -- unreachable
                    u0_m0_wo0_cm10_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_m0_wo0_mtree_mult1_10(MULT,32)@15
    u0_m0_wo0_mtree_mult1_10_a <= u0_m0_wo0_cm0_q;
    u0_m0_wo0_mtree_mult1_10_b <= d_u0_m0_wo0_wi0_delayr0_q_15_q;
    u0_m0_wo0_mtree_mult1_10_reset <= areset;

    u0_m0_wo0_mtree_mult1_10_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 8,
    lpm_widthb => 8,
    lpm_widthp => 16,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_10_a,
    datab => u0_m0_wo0_mtree_mult1_10_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_10_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_10_s1
    );
    u0_m0_wo0_mtree_mult1_10_q <= u0_m0_wo0_mtree_mult1_10_s1;

	--u0_m0_wo0_mtree_mult1_9(MULT,33)@14
    u0_m0_wo0_mtree_mult1_9_a <= u0_m0_wo0_cm1_q;
    u0_m0_wo0_mtree_mult1_9_b <= d_u0_m0_wo0_wi0_split1_b_14_q;
    u0_m0_wo0_mtree_mult1_9_reset <= areset;

    u0_m0_wo0_mtree_mult1_9_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 8,
    lpm_widthb => 8,
    lpm_widthp => 16,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_9_a,
    datab => u0_m0_wo0_mtree_mult1_9_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_9_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_9_s1
    );
    u0_m0_wo0_mtree_mult1_9_q <= u0_m0_wo0_mtree_mult1_9_s1;

	--u0_m0_wo0_mtree_mult1_8(MULT,34)@14
    u0_m0_wo0_mtree_mult1_8_a <= u0_m0_wo0_cm2_q;
    u0_m0_wo0_mtree_mult1_8_b <= d_u0_m0_wo0_wi0_split1_c_14_q;
    u0_m0_wo0_mtree_mult1_8_reset <= areset;

    u0_m0_wo0_mtree_mult1_8_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 8,
    lpm_widthb => 8,
    lpm_widthp => 16,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_8_a,
    datab => u0_m0_wo0_mtree_mult1_8_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_8_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_8_s1
    );
    u0_m0_wo0_mtree_mult1_8_q <= u0_m0_wo0_mtree_mult1_8_s1;

	--u0_m0_wo0_mtree_mult1_7(MULT,35)@13
    u0_m0_wo0_mtree_mult1_7_a <= u0_m0_wo0_cm3_q;
    u0_m0_wo0_mtree_mult1_7_b <= u0_m0_wo0_wi0_split1_d;
    u0_m0_wo0_mtree_mult1_7_reset <= areset;

    u0_m0_wo0_mtree_mult1_7_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 8,
    lpm_widthb => 8,
    lpm_widthp => 16,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_7_a,
    datab => u0_m0_wo0_mtree_mult1_7_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_7_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_7_s1
    );
    u0_m0_wo0_mtree_mult1_7_q <= u0_m0_wo0_mtree_mult1_7_s1;

	--u0_m0_wo0_mtree_mult1_6(MULT,36)@13
    u0_m0_wo0_mtree_mult1_6_a <= u0_m0_wo0_cm4_q;
    u0_m0_wo0_mtree_mult1_6_b <= u0_m0_wo0_wi0_split1_e;
    u0_m0_wo0_mtree_mult1_6_reset <= areset;

    u0_m0_wo0_mtree_mult1_6_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 8,
    lpm_widthb => 8,
    lpm_widthp => 16,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_6_a,
    datab => u0_m0_wo0_mtree_mult1_6_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_6_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_6_s1
    );
    u0_m0_wo0_mtree_mult1_6_q <= u0_m0_wo0_mtree_mult1_6_s1;

	--u0_m0_wo0_mtree_mult1_5(MULT,37)@13
    u0_m0_wo0_mtree_mult1_5_a <= u0_m0_wo0_cm5_q;
    u0_m0_wo0_mtree_mult1_5_b <= u0_m0_wo0_wi0_split1_f;
    u0_m0_wo0_mtree_mult1_5_reset <= areset;

    u0_m0_wo0_mtree_mult1_5_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 8,
    lpm_widthb => 8,
    lpm_widthp => 16,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_5_a,
    datab => u0_m0_wo0_mtree_mult1_5_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_5_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_5_s1
    );
    u0_m0_wo0_mtree_mult1_5_q <= u0_m0_wo0_mtree_mult1_5_s1;

	--u0_m0_wo0_mtree_mult1_4(MULT,38)@13
    u0_m0_wo0_mtree_mult1_4_a <= u0_m0_wo0_cm6_q;
    u0_m0_wo0_mtree_mult1_4_b <= u0_m0_wo0_wi0_split1_g;
    u0_m0_wo0_mtree_mult1_4_reset <= areset;

    u0_m0_wo0_mtree_mult1_4_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 8,
    lpm_widthb => 8,
    lpm_widthp => 16,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_4_a,
    datab => u0_m0_wo0_mtree_mult1_4_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_4_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_4_s1
    );
    u0_m0_wo0_mtree_mult1_4_q <= u0_m0_wo0_mtree_mult1_4_s1;

	--u0_m0_wo0_mtree_mult1_3(MULT,39)@13
    u0_m0_wo0_mtree_mult1_3_a <= u0_m0_wo0_cm7_q;
    u0_m0_wo0_mtree_mult1_3_b <= u0_m0_wo0_wi0_split1_h;
    u0_m0_wo0_mtree_mult1_3_reset <= areset;

    u0_m0_wo0_mtree_mult1_3_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 8,
    lpm_widthb => 8,
    lpm_widthp => 16,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_3_a,
    datab => u0_m0_wo0_mtree_mult1_3_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_3_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_3_s1
    );
    u0_m0_wo0_mtree_mult1_3_q <= u0_m0_wo0_mtree_mult1_3_s1;

	--u0_m0_wo0_mtree_mult1_2(MULT,40)@13
    u0_m0_wo0_mtree_mult1_2_a <= u0_m0_wo0_cm8_q;
    u0_m0_wo0_mtree_mult1_2_b <= u0_m0_wo0_wi0_split1_i;
    u0_m0_wo0_mtree_mult1_2_reset <= areset;

    u0_m0_wo0_mtree_mult1_2_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 8,
    lpm_widthb => 8,
    lpm_widthp => 16,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_2_a,
    datab => u0_m0_wo0_mtree_mult1_2_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_2_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_2_s1
    );
    u0_m0_wo0_mtree_mult1_2_q <= u0_m0_wo0_mtree_mult1_2_s1;

	--u0_m0_wo0_mtree_mult1_1(MULT,41)@13
    u0_m0_wo0_mtree_mult1_1_a <= u0_m0_wo0_cm9_q;
    u0_m0_wo0_mtree_mult1_1_b <= u0_m0_wo0_wi0_split9_b;
    u0_m0_wo0_mtree_mult1_1_reset <= areset;

    u0_m0_wo0_mtree_mult1_1_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 8,
    lpm_widthb => 8,
    lpm_widthp => 16,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_1_a,
    datab => u0_m0_wo0_mtree_mult1_1_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_1_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_1_s1
    );
    u0_m0_wo0_mtree_mult1_1_q <= u0_m0_wo0_mtree_mult1_1_s1;

	--u0_m0_wo0_mtree_mult1_0(MULT,42)@13
    u0_m0_wo0_mtree_mult1_0_a <= u0_m0_wo0_cm10_q;
    u0_m0_wo0_mtree_mult1_0_b <= u0_m0_wo0_wi0_split9_c;
    u0_m0_wo0_mtree_mult1_0_reset <= areset;

    u0_m0_wo0_mtree_mult1_0_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 8,
    lpm_widthb => 8,
    lpm_widthp => 16,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_0_a,
    datab => u0_m0_wo0_mtree_mult1_0_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_0_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_0_s1
    );
    u0_m0_wo0_mtree_mult1_0_q <= u0_m0_wo0_mtree_mult1_0_s1;

	--u0_m0_wo0_mtree_add0_0(ADD,43)@15
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_0_q(15 downto 0)), 17));
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_1_q(15 downto 0)), 17));
    u0_m0_wo0_mtree_add0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(16 downto 0);


	--u0_m0_wo0_mtree_add0_1(ADD,44)@15
    u0_m0_wo0_mtree_add0_1_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_2_q(15 downto 0)), 17));
    u0_m0_wo0_mtree_add0_1_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_3_q(15 downto 0)), 17));
    u0_m0_wo0_mtree_add0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_1_a) + SIGNED(u0_m0_wo0_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_q <= u0_m0_wo0_mtree_add0_1_o(16 downto 0);


	--u0_m0_wo0_mtree_add0_2(ADD,45)@15
    u0_m0_wo0_mtree_add0_2_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_4_q(15 downto 0)), 17));
    u0_m0_wo0_mtree_add0_2_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_5_q(15 downto 0)), 17));
    u0_m0_wo0_mtree_add0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_2_a) + SIGNED(u0_m0_wo0_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_2_q <= u0_m0_wo0_mtree_add0_2_o(16 downto 0);


	--u0_m0_wo0_mtree_add0_3(ADD,46)@15
    u0_m0_wo0_mtree_add0_3_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_6_q(15 downto 0)), 17));
    u0_m0_wo0_mtree_add0_3_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_7_q(15 downto 0)), 17));
    u0_m0_wo0_mtree_add0_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_3_a) + SIGNED(u0_m0_wo0_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_3_q <= u0_m0_wo0_mtree_add0_3_o(16 downto 0);


	--u0_m0_wo0_mtree_add0_4(ADD,47)@16
    u0_m0_wo0_mtree_add0_4_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_8_q(15 downto 0)), 17));
    u0_m0_wo0_mtree_add0_4_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_9_q(15 downto 0)), 17));
    u0_m0_wo0_mtree_add0_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_4_a) + SIGNED(u0_m0_wo0_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_4_q <= u0_m0_wo0_mtree_add0_4_o(16 downto 0);


	--u0_m0_wo0_mtree_add1_0(ADD,48)@16
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add0_0_q(16 downto 0)), 18));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add0_1_q(16 downto 0)), 18));
    u0_m0_wo0_mtree_add1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(17 downto 0);


	--u0_m0_wo0_mtree_add1_1(ADD,49)@16
    u0_m0_wo0_mtree_add1_1_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add0_2_q(16 downto 0)), 18));
    u0_m0_wo0_mtree_add1_1_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add0_3_q(16 downto 0)), 18));
    u0_m0_wo0_mtree_add1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_1_a) + SIGNED(u0_m0_wo0_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_q <= u0_m0_wo0_mtree_add1_1_o(17 downto 0);


	--u0_m0_wo0_mtree_add1_2(ADD,50)@17
    u0_m0_wo0_mtree_add1_2_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add0_4_q(16 downto 0)), 18));
    u0_m0_wo0_mtree_add1_2_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_10_q(15 downto 0)), 18));
    u0_m0_wo0_mtree_add1_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_2_a) + SIGNED(u0_m0_wo0_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_2_q <= u0_m0_wo0_mtree_add1_2_o(17 downto 0);


	--u0_m0_wo0_mtree_add2_0(ADD,51)@17
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add1_0_q(17 downto 0)), 19));
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add1_1_q(17 downto 0)), 19));
    u0_m0_wo0_mtree_add2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(18 downto 0);


	--u0_m0_wo0_mtree_add3_0(ADD,52)@18
    u0_m0_wo0_mtree_add3_0_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add2_0_q(18 downto 0)), 20));
    u0_m0_wo0_mtree_add3_0_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add1_2_q(17 downto 0)), 20));
    u0_m0_wo0_mtree_add3_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_0_a) + SIGNED(u0_m0_wo0_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_q <= u0_m0_wo0_mtree_add3_0_o(19 downto 0);


	--u0_m0_wo0_aseq(SEQUENCE,53)@18
    u0_m0_wo0_aseq: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : signed (4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "00000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_18_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "00000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 4;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= std_logic_vector(u0_m0_wo0_aseq_c(4 DOWNTO 4));
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_accum(ADD,54)@19
    u0_m0_wo0_accum_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add3_0_q(19 downto 0)), 22));
    u0_m0_wo0_accum_b <= u0_m0_wo0_accum_q;
    u0_m0_wo0_accum_i <= u0_m0_wo0_accum_a;
    u0_m0_wo0_accum_reset <= areset;
    u0_m0_wo0_accum_au : filter_0002_rtl_AddWithSload 
        generic map (L => 22, OPTIMIZED => "TRUE") 
        port map (clk => clk,
            reset => u0_m0_wo0_accum_reset,
            ena => d_u0_m0_wo0_compute_q_19_q(0),
            sreset => '0',
            sload => u0_m0_wo0_aseq_q(0),
            loadval_in => u0_m0_wo0_accum_i,
            doAddnSub => '1',
            addL_in => u0_m0_wo0_accum_a,
            addR_in => u0_m0_wo0_accum_b,
            sum_out => u0_m0_wo0_accum_o);
    u0_m0_wo0_accum_q <= u0_m0_wo0_accum_o(21 downto 0);


	--u0_m0_wo0_oseq(SEQUENCE,55)@18
    u0_m0_wo0_oseq: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : signed (4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "00100";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_18_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "00000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 4;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= std_logic_vector(u0_m0_wo0_oseq_c(4 DOWNTO 4));
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_oseq_gated_reg(REG,57)@19
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= u0_m0_wo0_oseq_gated_q;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr1_replace_mem(DUALMEM,72)
    u0_m0_wo0_wi0_delayr1_replace_mem_reset0 <= areset;
    u0_m0_wo0_wi0_delayr1_replace_mem_ia <= u0_m0_wo0_wi0_join1_q;
    u0_m0_wo0_wi0_delayr1_replace_mem_aa <= u0_m0_wo0_wi0_delayr1_replace_wrreg_q;
    u0_m0_wo0_wi0_delayr1_replace_mem_ab <= u0_m0_wo0_wi0_delayr1_replace_rdcnt_q;
    u0_m0_wo0_wi0_delayr1_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M4K",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 5,
        numwords_a => 24,
        width_b => 64,
        widthad_b => 5,
        numwords_b => 24,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_a => "CLEAR1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        -- indata_aclr_a => "CLEAR0",
        -- indata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone II"
    )
    PORT MAP (
        clocken1 => u0_m0_wo0_wi0_delayr1_enaAnd_q(0),
        clocken0 => d_u0_m0_wo0_compute_q_13_q(0),
        wren_a => d_u0_m0_wo0_compute_q_13_q(0),
        clock0 => clk,
        aclr1 => u0_m0_wo0_wi0_delayr1_replace_mem_reset0,
        clock1 => clk,
        address_b => u0_m0_wo0_wi0_delayr1_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_wi0_delayr1_replace_mem_iq,
        address_a => u0_m0_wo0_wi0_delayr1_replace_mem_aa,
        data_a => u0_m0_wo0_wi0_delayr1_replace_mem_ia
    );
        u0_m0_wo0_wi0_delayr1_replace_mem_q <= u0_m0_wo0_wi0_delayr1_replace_mem_iq(63 downto 0);

	--u0_m0_wo0_wi0_delayr1_replace_rdcnt(COUNTER,73)
    -- every=1, low=0, high=23, step=1, init=1
    u0_m0_wo0_wi0_delayr1_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr1_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                    IF u0_m0_wo0_wi0_delayr1_replace_rdcnt_i = 22 THEN
                      u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq <= '1';
                    ELSE
                      u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq = '1') THEN
                        u0_m0_wo0_wi0_delayr1_replace_rdcnt_i <= u0_m0_wo0_wi0_delayr1_replace_rdcnt_i - 23;
                    ELSE
                        u0_m0_wo0_wi0_delayr1_replace_rdcnt_i <= u0_m0_wo0_wi0_delayr1_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_delayr1_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_delayr1_replace_rdcnt_i,5));


	--u0_m0_wo0_wi0_delayr1_replace_wrreg(REG,74)
    u0_m0_wo0_wi0_delayr1_replace_wrreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr1_replace_wrreg_q <= "00000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_delayr1_replace_wrreg_q <= u0_m0_wo0_wi0_delayr1_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr1_mem_top(CONSTANT,75)
    u0_m0_wo0_wi0_delayr1_mem_top_q <= "010111";

	--u0_m0_wo0_wi0_delayr1_cmpReg(REG,77)
    u0_m0_wo0_wi0_delayr1_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr1_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_delayr1_cmpReg_q <= u0_m0_wo0_wi0_delayr1_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr1_sticky_ena(REG,80)
    u0_m0_wo0_wi0_delayr1_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr1_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_delayr1_nor_q = "1") THEN
                u0_m0_wo0_wi0_delayr1_sticky_ena_q <= u0_m0_wo0_wi0_delayr1_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--xOut(PORTOUT,60)@20
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= "0000000" & GND_q;
    xOut_0 <= u0_m0_wo0_accum_q;


	--u0_m0_wo0_wi0_delayr1_notEnable(LOGICAL,78)
    u0_m0_wo0_wi0_delayr1_notEnable_a <= d_u0_m0_wo0_compute_q_13_q;
    u0_m0_wo0_wi0_delayr1_notEnable_q <= not u0_m0_wo0_wi0_delayr1_notEnable_a;

	--u0_m0_wo0_wi0_delayr1_enaAnd(LOGICAL,81)
    u0_m0_wo0_wi0_delayr1_enaAnd_a <= u0_m0_wo0_wi0_delayr1_sticky_ena_q;
    u0_m0_wo0_wi0_delayr1_enaAnd_b <= d_u0_m0_wo0_compute_q_13_q;
    u0_m0_wo0_wi0_delayr1_enaAnd_q <= u0_m0_wo0_wi0_delayr1_enaAnd_a and u0_m0_wo0_wi0_delayr1_enaAnd_b;

	--u0_m0_wo0_oseq_gated(LOGICAL,56)@19
    u0_m0_wo0_oseq_gated_a <= u0_m0_wo0_oseq_q;
    u0_m0_wo0_oseq_gated_b <= d_u0_m0_wo0_compute_q_19_q;
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_gated_a and u0_m0_wo0_oseq_gated_b;

	--u0_m0_wo0_wi0_split9(BITSELECT,18)@13
    u0_m0_wo0_wi0_split9_in <= u0_m0_wo0_wi0_delayr9_q;
    u0_m0_wo0_wi0_split9_b <= u0_m0_wo0_wi0_split9_in(7 downto 0);
    u0_m0_wo0_wi0_split9_c <= u0_m0_wo0_wi0_split9_in(15 downto 8);

	--u0_m0_wo0_wi0_split1(BITSELECT,15)@13
    u0_m0_wo0_wi0_split1_in <= u0_m0_wo0_wi0_delayr1_replace_mem_q;
    u0_m0_wo0_wi0_split1_b <= u0_m0_wo0_wi0_split1_in(7 downto 0);
    u0_m0_wo0_wi0_split1_c <= u0_m0_wo0_wi0_split1_in(15 downto 8);
    u0_m0_wo0_wi0_split1_d <= u0_m0_wo0_wi0_split1_in(23 downto 16);
    u0_m0_wo0_wi0_split1_e <= u0_m0_wo0_wi0_split1_in(31 downto 24);
    u0_m0_wo0_wi0_split1_f <= u0_m0_wo0_wi0_split1_in(39 downto 32);
    u0_m0_wo0_wi0_split1_g <= u0_m0_wo0_wi0_split1_in(47 downto 40);
    u0_m0_wo0_wi0_split1_h <= u0_m0_wo0_wi0_split1_in(55 downto 48);
    u0_m0_wo0_wi0_split1_i <= u0_m0_wo0_wi0_split1_in(63 downto 56);

	--u0_m0_wo0_wi0_delayr1_cmp(LOGICAL,76)
    u0_m0_wo0_wi0_delayr1_cmp_a <= u0_m0_wo0_wi0_delayr1_mem_top_q;
    u0_m0_wo0_wi0_delayr1_cmp_b <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(u0_m0_wo0_wi0_delayr1_replace_rdcnt_q(4 downto 0)), 6));
    u0_m0_wo0_wi0_delayr1_cmp_q <= "1" when u0_m0_wo0_wi0_delayr1_cmp_a = u0_m0_wo0_wi0_delayr1_cmp_b else "0";

	--u0_m0_wo0_wi0_delayr1_nor(LOGICAL,79)
    u0_m0_wo0_wi0_delayr1_nor_a <= u0_m0_wo0_wi0_delayr1_notEnable_q;
    u0_m0_wo0_wi0_delayr1_nor_b <= u0_m0_wo0_wi0_delayr1_sticky_ena_q;
    u0_m0_wo0_wi0_delayr1_nor_q <= not (u0_m0_wo0_wi0_delayr1_nor_a or u0_m0_wo0_wi0_delayr1_nor_b);

	--u0_m0_wo0_wi0_join9(BITJOIN,17)@13
    u0_m0_wo0_wi0_join9_q <= u0_m0_wo0_wi0_split9_b & u0_m0_wo0_wi0_split1_i;

	--u0_m0_wo0_wi0_join1(BITJOIN,14)@13
    u0_m0_wo0_wi0_join1_q <= u0_m0_wo0_wi0_split1_h & u0_m0_wo0_wi0_split1_g & u0_m0_wo0_wi0_split1_f & u0_m0_wo0_wi0_split1_e & u0_m0_wo0_wi0_split1_d & u0_m0_wo0_wi0_split1_c & u0_m0_wo0_wi0_split1_b & u0_m0_wo0_wi0_delayr0_q;

end normal;
