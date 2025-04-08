-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declaracion de entidad
entity countBCD is
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
end;

-- Declaracion cuerpo de arquitectura
architecture countBCD_arq of countBCD is
  -- Parte declarativa
  signal rst_o, comp_o : std_logic;
  signal sum_o : std_logic_vector(N - 1 downto 0);

begin
  -- Parte descriptiva
  comp_o <= '1'  when sum_o = std_logic_vector(to_unsigned(M - 1, N)) else '0';
  rst_o <= rst_i or (ena_i and comp_o);

  process(clk_i)
  begin
    if rising_edge(clk_i) then
      if (rst_o = '1') then
        sum_o <= std_logic_vector(to_unsigned(0,N));
      else
        if(ena_i = '1') then
          sum_o <= std_logic_vector( unsigned(sum_o) + to_unsigned(1,N) );
        end if;
      end if;
    end if;
  end process;

  count_o <= sum_o;
  max_o <= comp_o;
  
  
end;

