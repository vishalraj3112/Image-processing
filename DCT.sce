clc
clear all
f=imread('H:\IVP\mandrill square.jpg')
imshow(f)
f=rgb2gray(f)
[M N]=size(f)
disp("This is no of rows:",M);
disp("This is no of columns:",N);

f=double(f)

for k=1:N
    for n=1:N
        if((k-1)==0)
            c(k,n)=inv(sqrt(N))
        else
            c(k,n)=sqrt(2)*inv(sqrt(N))*cos(%pi*(k-1)*(2*(n-1)+1)/(2*N))
        end
end        
end
[M N]=size(c);
disp("This is no of rows of c:",M);
disp("This is no of columns of n:",N);
c_tan=(c)';
F=c*f*c_tan;
f1=c_tan*F*c;

D=[uint8(f) uint8(F) uint8(f1)]
imshow(D)
