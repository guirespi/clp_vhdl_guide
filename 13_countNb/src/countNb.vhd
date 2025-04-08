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
  signal sum_o : std_logic_vector(N-1 downto 0);

begin
  -- Parte descriptiva
  count_o <= sum_o;

  process(clk_i)
  begin
    if rising_edge(clk_i) then
      if (rst_i = '1') then
        sum_o <= std_logic_vector(to_unsigned(0,N));
      else
        if(ena_i = '1') then
          sum_o <= std_logic_vector( unsigned(sum_o) + to_unsigned(1,N) );
        end if;
      end if;
    end if;
  end process;
  
end;

