%speed of sound calculated based on Owen Cramer Paper(1992) 
%Temp range : 0- 30 Degree celcius, RH : 0-100%
%-----------------
a0 = 331.5024;
a1 = 0.603055; 
a2 = -0.000528; 
a3 = 51.471935; 
a4 = 0.1495874; 
a5 = -0.000782;
a6 = -1.82 * 10^-7; 
a7 = 3.73 * 10^-8; 
a8 = -2.93 * 10^-10; 
a9 = -85.20931; 
a10 = -0.228525; 
a11 = 5.91 * 10^-5; 
a12 = -2.835149; 
a13 = -2.15 * 10^-13;
a14 = 29.179762; 
a15 = 0.000486; 
p=101325;
Xc=0.000314;


fileID = fopen('CramerSpeedofSound.csv','w');
fprintf(fileID,"1st_cloumn->temp and 1st_row->Humidity\n");
fprintf(fileID,"\t");
for i=0:10:100
fprintf(fileID,"%d\t",i);
end
fprintf(fileID,'\n');

for temp=0:5:30
fprintf(fileID,"%d\t",temp);
for humidity=0:10:100
    
T=temp+273.15;
h=humidity/100.0;

f=1.00062+0.0000000314*p+0.00000056*temp*temp;%enhancement factor
Psv = exp((0.000012811805 * T * T) - (0.019509874 * T )+ 34.04926034 - 6353.6311 / T);

Xw = h * f * Psv / p;
speed = a0 + a1 * temp + a2 * temp * temp + (a3 + a4 * temp + a5 * temp * temp) * Xw + (a6 + a7 * temp + a8 * temp * temp) * p + (a9 + a10 * temp + a11 * temp * temp) * Xc + a12 * Xw * Xw + a13 * p * p + a14 * Xc * Xc + a15 * Xw * p * Xc;

    fprintf(fileID,' %6.3f \t',speed);
   
end
fprintf(fileID,'\r\n');
end
fclose(fileID);
    
    
