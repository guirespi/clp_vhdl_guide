-- Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;


-- Declaracion de entidad
entity countBCD_tb is
end;

-- Declaracion de arquitectura
architecture countBCD_tb_arq of countBCD_tb is
  -- Parte declarativa
  component countBCD is
    generic(
      N : natural := 4;
      M : natural := 10
    );
    port (
      clk_i   : in std_logic;
      rst_i   : in std_logic;
      ena_i   : in std_logic;
      count_o : out std_logic_vector(N-1 downto 0);
      max_o   : out std_logic
    );
  end component;

  constant N_tb : natural := 4;
  constant M_tb : natural := 10;

  signal clk_tb   : std_logic := '0';
  signal rst_tb   : std_logic := '1';
  signal ena_tb   : std_logic := '0';
  signal count_tb : std_logic_vector(N_tb-1 downto 0);
  signal max_tb   : std_logic;

begin
  -- Parte descriptiva
  clk_tb  <= not clk_tb after 10 ns;
  rst_tb  <= '0' after 50 ns;
  ena_tb  <= '1' after 100 ns;

  DUT: countBCD
    generic map (
      N => N_tb,
      M => M_tb
    )
    port map(
      clk_i     => clk_tb,
      rst_i     => rst_tb,
      ena_i     => ena_tb,
      count_o   => count_tb,
      max_o     => max_tb
    );

end countBCD_tb_arq;