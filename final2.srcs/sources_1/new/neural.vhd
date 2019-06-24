library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.all;
use IEEE.numeric_std.all;

package neurals_utils is
  TYPE matrix_8_2 IS ARRAY (0 To 7, 0 To 1) Of real;
  TYPE matrix_1_2 IS ARRAY (0 to 1) of real;
  TYPE matrix_1_4 IS ARRAY (0 To 3) Of real;
  TYPE matrix_1_8 IS ARRAY (0 To 7) Of real;
  TYPE matrix_4_8 IS ARRAY (0 To 3, 0 To 7) Of real;
  TYPE matrix_8_8 IS ARRAY (0 To 7, 0 To 7) Of real;
  TYPE array_20 IS ARRAY (20 downto 1) of matrix_1_4;
  TYPE array_8 IS ARRAY (8 downto 1) of real;
    
    function slv_to_single_float (
        input : in std_logic_vector(31 downto 0))
        return real;
        
    function single_float_to_slv (
        input : in real)
        return std_logic_vector;
        
end package neurals_utils;

package body neurals_utils is

  function slv_to_single_float (
    input : in std_logic_vector(31 downto 0))
    return real is
      variable o : real;
    begin
      o := 0.0;
      o := real(to_integer(signed(input))) * 2.0**(-23); 
    return o;
  end;

  function single_float_to_slv (
    input : in real)
    return std_logic_vector is
      variable o : std_logic_vector(31 downto 0) := (others => '0');
    begin
      o:= (others => '0');
      o := std_logic_vector(to_signed(integer(input*2**(23)),32));
    return o;
  end;
end neurals_utils;
