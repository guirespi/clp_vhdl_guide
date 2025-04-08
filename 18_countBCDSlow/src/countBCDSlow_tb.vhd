-- Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;


-- Declaracion de entidad
entity countBCDSlow_tb is
end;

-- Declaracion de arquitectura
architecture countBCDSlow_arq of countBCDSlow_tb is
  -- Parte declarativa
  component countBCDSlow is
    generic(
      cycles : natural := 4
    );
    port(
      clk_i   : in std_logic;
      rst_i   : in std_logic;
      ena_i : in std_logic;
      count_o : out std_logic_vector(3 downto 0)
    );
  end component countBCDSlow;

  constant cycles_tb : natural := 10;

  signal clk_tb   : std_logic := '0';
  signal rst_tb   : std_logic := '1';
  signal ena_tb   : std_logic := '0';
  signal count_tb : std_logic_vector(3 downto 0);

begin
  -- Parte descriptiva
  clk_tb  <= not clk_tb after 10 ns;
  rst_tb  <= '0' after 50 ns;
  ena_tb  <= '1' after 10 ns;

  DUT: countBCDSlow
    generic map (
        cycles => cycles_tb
    )
    port map(
      clk_i   => clk_tb,
      rst_i   => rst_tb,
      ena_i   => ena_tb,
      count_o => count_tb
    );
end;