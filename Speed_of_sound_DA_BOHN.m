 % This speed of sound  formula  is based D. A. BOHN, 1988,J. Audio Eng. Soc.,Vol-36,No. 4,1988.
 %Environmental effects on speed of sound 
 %Temperature range 0-100 degree, Relative Humidity range 0%-100%RH
 clear all;
 clc;
 
fid=fopen('Speed-of-sound.csv','w');%speed of sound  in m/s
fid1=fopen('table2.csv','w'); % only RH
fid2=fopen('table3.csv','w');% Pecentage of increase in speed of sound (combined effect of temp and RH)
fprintf(fid,"1st_cloumn->temp and 1st_row->Humidity\n");
fprintf(fid1,"1st_cloumn->temp and 1st_row->Humidity\n");
fprintf(fid2,"1st_cloumn->temp and 1st_row->Humidity\n");
fprintf(fid,"\t");
fprintf(fid1,"\t");
fprintf(fid2,"\t");

for i=5:5:50
fprintf(fid,"%d\t",i);
fprintf(fid1,"%d\t",i);
fprintf(fid2,"%d\t",i);
end
 fprintf(fid,'\n');
 fprintf(fid1,'\n');
 fprintf(fid2,'\n');
p=101325;% ambient pressure
t0=331.45;% speed of sound at 0 degree celsius
for t=5:5:50
    fprintf(fid,"%d\t",t);
    fprintf(fid1,"%d\t",t);
    fprintf(fid2,"%d\t",t);
    x1=t+237.1;
    x2=4924.99/x1;
    x3=34.494-x2;
    a=exp(x3);
    x4=t+105;
    b=x4.^(1.57);

    Ps= a/b;
   % or e(t)

    
    for RH=5:5:50
    h=(0.01*RH*Ps)/p; % p is the pressure 
    
    Yw= (7+h)/(5+h); % gamma w is specific heat of moist air(humid air)
    Mw= 29 -11*h;      %Molecular weight in presence of water  
    %Cw and Cd are the speed of sound of moist air and speed of sound of
    %dry air;
    %C=Cw/Cd
    C = ((4.5513 .* sqrt(Yw/Mw))-1)*100;
    C1 = 4.5513 .* sqrt(Yw/Mw);
  
    Cdry=331.45.*sqrt(1+(t/273.14));
     
    Cw=C1*Cdry; 
    Per_s_h= (455.13 .* sqrt(Yw/Mw))-100;% speed of sound wrt humidity
    Per_s_th=((Cw-t0)/t0)*100; % speed of sound with temperature and RH
    
    fprintf(fid,'%6.2f\t',Cw);
    fprintf(fid1,'%5.3f\t',Per_s_h);
    fprintf(fid2,'%4.2f\t',Per_s_th);
    end
    fprintf(fid,'\n');
    fprintf(fid1,'\n');
    fprintf(fid2,'\n');
    
end
fclose(fid);
fclose(fid1);
fclose(fid2);
