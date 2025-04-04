-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declaracion de entidad
entity countNb is
  generic(
    N : natural := 4
  );
  port (
    clk_i   : in std_logic;
    rst_i   : in std_logic;
    ena_i   : in std_logic;
    count_o : out std_logic_vector(N-1 downto 0)
  );
end;

-- Declaracion cuerpo de arquitectura
architecture countNb_arq of countNb is
  -- Parte declarativa
  signal reg_o : std_logic_vector(N-1 downto 0);
  signal sum_o : std_logic_vector(N-1 downto 0);

  component ffd is
    port(
      clk_i: in std_logic;
      rst_i: in std_logic;
      ena_i: in std_logic;
      d_i: in std_logic;
      q_o: out std_logic
    );
  end component;

begin
  sum_o <= std_logic_vector( unsigned(reg_o) + to_unsigned(1,N) );
  count_o <= reg_o;

  reg_i: for i in 0 to (N - 1) generate
  ffd_inst: ffd
    port map(
      clk_i => clk_i,
      rst_i => rst_i, 
      ena_i => ena_i,
      d_i   => sum_o(i), 
      q_o   => reg_o(i)
    );
  end generate;

end;

