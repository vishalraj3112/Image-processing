clc
clear all
im=imread("C:\Users\VIshal\Desktop\lena.png")
im=rgb2gray(im);
nk=zeros(1,260);
PDF=zeros(1,260);
CDF=zeros(1,260);
sk=zeros(1,260);
ns=zeros(1,260);

for i=0:255
    a=find(i==im)
    nk(i+1)=length(a)
end

n=0:259
figure,subplot(121),bar(n,nk);
[r c]=size(im)
PDF=nk/(r*c);
CDF=cumsum(PDF);
sk=round(255*CDF);

for i=0:255
    a=find(im==i)
    jm(a)=sk(i+1)
end

for i=0:255
    a=find(jm==i)
    ns(i+1)=length(a)
end

subplot(122),bar(n,ns);

figure,subplot(121),imshow(im),title('Input Image');
subplot(122),imshow(uint8(jm)),title('Output Image');


