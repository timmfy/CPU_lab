library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ID_EX is
    port(
        clk: in std_logic;
        --reset: in std_logic;
        ALUOp_in      : in std_logic_vector(3 downto 0);    -- ALU operation
        ALUSrc_in     : in std_logic;                      -- ALU source (register or immediate)
        RegWrite_in   : in std_logic;                      -- Write to register file
        MemRead_in    : in std_logic;                      -- Read from memory
        MemWrite_in   : in std_logic;                      -- Write to memory
        MemToReg_in   : in std_logic;                      -- Memory to register
        MemSize_in    : in std_logic_vector(1 downto 0);  -- Memory size (byte, halfword, word)
        Branch_in     : in std_logic;                      -- Branch signal
        ID_flush      : in std_logic;                   -- Flush signal 
        read_data1_in : in std_logic_vector(63 downto 0);
        read_data2_in : in std_logic_vector(63 downto 0);
        imm_in        : in std_logic_vector(63 downto 0);
        rd_in         : in std_logic_vector(4 downto 0);
        pc_in         : in std_logic_vector(63 downto 0);
        funct3_in     : in std_logic_vector(2 downto 0);
        rs1_in        : in std_logic_vector(4 downto 0);
        rs2_in        : in std_logic_vector(4 downto 0);
        ALUOp_out         : out std_logic_vector(3 downto 0);    -- ALU operation
        ALUSrc_out        : out std_logic;                      -- ALU source (register or immediate)
        RegWrite_out      : out std_logic;                      -- Write to register file
        MemRead_out       : out std_logic;                      -- Read from memory
        MemWrite_out      : out std_logic;                      -- Write to memory
        MemToReg_out      : out std_logic;                      -- Memory to register
        MemSize_out       : out std_logic_vector(1 downto 0);  -- Memory size (byte, halfword, word)
        Branch_out        : out std_logic;                      -- Branch signal
        read_data1_out    : out std_logic_vector(63 downto 0);
        read_data2_out    : out std_logic_vector(63 downto 0);
        imm_out           : out std_logic_vector(63 downto 0);
        rd_out            : out std_logic_vector(4 downto 0);
        pc_out            : out std_logic_vector(63 downto 0);
        funct3_out        : out std_logic_vector(2 downto 0);
        rs1_out            : out std_logic_vector(4 downto 0);
        rs2_out            : out std_logic_vector(4 downto 0)
    );
end entity ID_EX;

architecture behavior of ID_EX is
    signal ALUOp_reg     : std_logic_vector(3 downto 0);    -- ALU operation
    signal ALUSrc_reg    : std_logic;                      -- ALU source (register or immediate)
    signal RegWrite_reg  : std_logic;                      -- Write to register file
    signal MemRead_reg   : std_logic;                      -- Read from memory
    signal MemWrite_reg  : std_logic;                      -- Write to memory
    signal MemToReg_reg  : std_logic;                      -- Memory to register
    signal MemSize_reg   : std_logic_vector(1 downto 0);  -- Memory size (byte, halfword, word)
    signal Branch_reg    : std_logic;                      -- Branch signal
    signal read_data1_reg: std_logic_vector(63 downto 0);
    signal read_data2_reg: std_logic_vector(63 downto 0);
    signal imm_reg      : std_logic_vector(63 downto 0);
    signal rd_reg       : std_logic_vector(4 downto 0);
    signal pc_reg       : std_logic_vector(63 downto 0);
    signal funct3_reg    : std_logic_vector(2 downto 0);
    signal rs1_reg       : std_logic_vector(4 downto 0);
    signal rs2_reg       : std_logic_vector(4 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            ALUOp_reg <= ALUOp_in;
            ALUSrc_reg <= ALUSrc_in;
            RegWrite_reg <= RegWrite_in;
            MemRead_reg <= MemRead_in;
            MemWrite_reg <= MemWrite_in;
            MemToReg_reg <= MemToReg_in;
            MemSize_reg <= MemSize_in;
            Branch_reg <= Branch_in;
            read_data1_reg <= read_data1_in;
            read_data2_reg <= read_data2_in;
            imm_reg <= imm_in;
            rd_reg <= rd_in;
            pc_reg <= pc_in;
            funct3_reg <= funct3_in;
            rs1_reg <= rs1_in;
            rs2_reg <= rs2_in;
        end if;
    end process;
    ALUOp_out <= (others => '0') when ID_flush = '1' else ALUOp_reg;
    ALUSrc_out <= '0' when ID_flush = '1' else ALUSrc_reg;
    RegWrite_out <= '0' when ID_flush = '1' else RegWrite_reg;
    MemRead_out <= '0' when ID_flush = '1' else MemRead_reg;
    MemWrite_out <= '0' when ID_flush = '1' else MemWrite_reg;
    MemToReg_out <= '0' when ID_flush = '1' else MemToReg_reg;
    MemSize_out <= (others => '0') when ID_flush = '1' else MemSize_reg;
    Branch_out <= '0' when ID_flush = '1' else Branch_reg;
    read_data1_out <= (others => '0') when ID_flush = '1' else read_data1_reg;
    read_data2_out <= (others => '0') when ID_flush = '1' else read_data2_reg;
    imm_out <= (others => '0') when ID_flush = '1' else imm_reg;
    rd_out <= (others => '0') when ID_flush = '1' else rd_reg;
    pc_out <= (others => '0') when ID_flush = '1' else pc_reg;
    funct3_out <= (others => '0') when ID_flush = '1' else funct3_reg;
    rs1_out <= (others => '0') when ID_flush = '1' else rs1_reg;
    rs2_out <= (others => '0') when ID_flush = '1' else rs2_reg;
end architecture;