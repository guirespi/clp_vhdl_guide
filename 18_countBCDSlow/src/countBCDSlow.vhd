-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaracion de entidad
entity countBCDSlow is
  generic(
    -- There is 1E09 nanoseconds in a second. Our clk is 20 ns period. 
    cycles : natural := 10 
  );
  port (
    clk_i : in std_logic;
    rst_i : in std_logic;
    ena_i : in std_logic;
    count_o : out std_logic_vector(3 downto 0);
    max_o   : out std_logic
  );
end;

-- Declaracion cuerpo de arquitectura
architecture countBCDSlow_arq of countBCDSlow is

  component countBCD is
    generic(
      N : natural := 4;
      M : natural := 10
    );
    port (
      clk_i : in std_logic;
      rst_i : in std_logic;
      ena_i : in std_logic;
      count_o : out std_logic_vector(N-1 downto 0);
      max_o   : out std_logic
    );
  end component;

  component genEna is
    generic(
        N: natural := 4
    );
    port (
        rst_i: in std_logic;
        clk_i: in std_logic;
        s_o:   out std_logic
    );
    end component;

    signal ena_s, ena_aux : std_logic;
     
begin

    ena_aux <= ena_s and ena_i;

  countBCD_inst : countBCD
    generic map(
      N => 4,
      M => 10
    )
    port map(
      clk_i => clk_i,
      rst_i => rst_i,
      ena_i => ena_aux,
      count_o => count_o,
      max_o => max_o
    );

  genEna_inst: genEna
    generic map(
      N => cycles
    )
    port map(
      rst_i => rst_i,
      clk_i => clk_i,
      s_o   => ena_s
    );
    
end;