-- Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;


-- Declaracion de entidad
entity countNb_tb is
end;

-- Declaracion de arquitectura
architecture countNb_tb_arq of countNb_tb is
  -- Parte declarativa
  component countNb is
    generic(
      N		: natural := 4
    );
    port(
      clk_i   : in std_logic;
      rst_i   : in std_logic;
      ena_i   : in std_logic;
      count_o : out std_logic_vector(N-1 downto 0)
    );
  end component countNb;

  constant N_tb : natural := 4;

  signal clk_tb   : std_logic := '0';
  signal rst_tb   : std_logic := '1';
  signal ena_tb   : std_logic := '0';
  signal count_tb : std_logic_vector(N_tb-1 downto 0);

begin
  -- Parte descriptiva
  clk_tb  <= not clk_tb after 10 ns;
  rst_tb  <= '0' after 100 ns;
  ena_tb  <= '1' after 200 ns;

  DUT: countNb
    generic map (
      N => N_tb
    )
    port map(
      clk_i   => clk_tb,
      rst_i   => rst_tb,
      ena_i   => ena_tb,
      count_o => count_tb
    );

end countNb_tb_arq;