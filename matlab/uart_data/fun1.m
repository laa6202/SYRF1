
function [y]=fun1(x)
   switch x
       case 65
           y=10;
       case 66
           y=11;
       case 67
           y=12;
       case 68
           y=13;
       case 69
           y=14;
       case 70
           y=15;
       otherwise
           y=hex2dec(x);
   end
end