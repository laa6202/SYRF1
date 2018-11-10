%0.
clear all
clc


%1
fn = 't2.txt';
fid = fopen(fn,'r');
d0 = fread(fid);
len = floor(length(d0) / 6);

d1 = zeros(len,1);
for i=1:len
    j=i-1;
    a1 = fun1(d0(j*6+1));
    a2 = fun1(d0(j*6+2));
    b1 = fun1(d0(j*6+4));
    b2 = fun1(d0(j*6+5));
    d1(i) = a1 * 4096 + a2 * 256 + b1 * 16 + b2;
end

d2 = d1(1:4000);


