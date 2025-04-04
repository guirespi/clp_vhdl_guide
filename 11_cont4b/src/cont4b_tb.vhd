-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de entidad
entity cont4b_tb is
end;

-- Declaracion cuerpo de arquitectura
architecture cont4b_tb_arq of cont4b_tb is
  -- Parte declarativa
  component cont4b is
    port(
      clk_i    : in  std_logic;
      rst_i    : in  std_logic;
      ena_i    : in  std_logic;
      count_o  : out std_logic_vector(3 downto 0)
    );
  end component;
  
  -- Senales de prueba
  signal clk_tb    : std_logic := '0';
  signal ena_tb    : std_logic := '1';
  signal rst_tb    : std_logic := '0';
  signal count_tb : std_logic_vector(3 downto 0);

begin

  clk_tb <= not clk_tb after 10 ns;
  ena_tb <= '0' after 250 ns, '1' after 500 ns;
  rst_tb <= '1' after 50 ns, '0' after 100 ns;
  
  DUT : cont4b
    port map(
      clk_i     => clk_tb,
      rst_i     => rst_tb,
      ena_i     => ena_tb,
      count_o   => count_tb
    );
  
end;
      
