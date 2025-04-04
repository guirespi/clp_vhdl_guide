-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declaracion de entidad
entity cont4b is
  port(
    clk_i    : in std_logic;
    rst_i    : in std_logic;
    ena_i    : in std_logic;
    count_o : out std_logic_vector(3 downto 0)
  );
end;

-- Declaracion cuerpo de arquitectura
architecture cont4b_arq of cont4b is
  -- Parte declarativa
  signal sum_o : std_logic_vector(3 downto 0) := "0000";

begin
  -- Parte descriptiva
  
  process(clk_i)
    begin
      if rising_edge(clk_i) then
        if (rst_i = '1') then
          sum_o <= "0000";
        else
          if(ena_i = '1') then
              sum_o <= std_logic_vector(unsigned(sum_o) + 1);
              count_o <= sum_o;
          end if;
        end if;
      end if;
  end process;

end;
      
