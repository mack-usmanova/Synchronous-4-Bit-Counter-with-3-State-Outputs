----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2025 06:23:29 PM
-- Design Name: 
-- Module Name: sn74als561a - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sn74als561a is 
Port ( 
    ENP, ENT, clk, oe : in std_logic; 
    ACLR, Aload, SCLR, Sload : in std_logic; 
    D : in std_logic_vector(3 downto 0); 
    rco, cco : out std_logic; 
    Q : out std_logic_vector(3 downto 0)
    ); 
end sn74als561a; 
architecture Behavioral of sn74als561a is 
signal acount : std_logic_vector(3 downto 0); 
signal rco_in : std_logic; 
begin 
process (ENT, ENP, ACLR, SCLR, Aload, Sload, acount, D, clk) 
begin 
if ACLR = '0' then 
    acount <= "0000"; 
elsif Aload = '0' then  
    acount <= D; 
elsif rising_edge(clk) then 
    if ENP = '1' and ENT = '1' and Sload = '1' and SCLR = '1' and Aload = '1' and ACLR = '1' then  
        acount <= acount + '1'; 
    elsif SCLR = '0' then 
        acount <= "0000"; 
    elsif Sload = '0' then 
        acount <= D; 
    elsif ENP = '0' then 
        acount <= acount; 
    end if;  
end if; 
             
if oe = '0' then  
    Q <= acount;  
else  
    Q <= (others => 'Z'); 
end if; 
         
 
    if acount = "1111" then 
        rco <= '1'; 
        rco_in <= '1'; 
    else  
        rco <= '0'; 
        rco_in <= '0'; 
    end if; 
end process;    
       
  
process(clk) begin 
       if rco_in = '1' and clk = '0' then        
             cco <= '1'; 
        else 
            cco <= '0'; 
        end if;                              
      
end process; 
end Behavioral;