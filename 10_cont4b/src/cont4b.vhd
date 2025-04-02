-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

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

  signal d      : std_logic_vector(3 downto 0);
  signal q      : std_logic_vector(3 downto 0);
  signal carry  : std_logic_vector(2 downto 0);

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

  count_o <= q;
    
  d(0)      <=  ena_i xor q(0);
  carry(0)  <=  ena_i and q(0);
  
  d(1)      <=  carry(0) xor q(1);
  carry(1)  <=  carry(0) and q(1);
 
  d(2)      <=  carry(1) xor q(2);
  carry(2)  <=  carry(1) and q(2);
  
  d(3)      <=  carry(2) xor q(3);

  reg_i: for i in 0 to 3 generate
    ffd_inst: ffd
      port map(
        clk_i => clk_i,
        d_i   => d(i), 
        rst_i => rst_i, 
        ena_i => ena_i,
        q_o   => q(i)
      );
  end generate;
    
end;
      
