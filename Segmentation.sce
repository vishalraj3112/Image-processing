clc
clear all
im=imread('E:\IVP\coins.png')
im=double(im)
[r c]=size(im)
premx=(1/6)*[1 1 1;0 0 0;-1 -1 -1]
premy=premx';
sobx=(1/6)*[-1 -2 -1;0 0 0;1 2 1];
soby=sobx'
premx0=zeros(r,c)
premy0=zeros(r,c)
sobx0=zeros(r,c)
soby0=zeros(r,c)
premout=zeros(r,c)
sobout=zeros(r,c)

for i=2:r-1
    for j=2:c-1
        i1=im(i-1:i+1,j-1:j+1)
        premx0(i,j)=sum(i1.*premx);
        premy0(i,j)=sum(i1.*premy);
        sobx0(i,j)=sum(i1.*sobx);
        soby0(i,j)=sum(i1.*soby);
end
end
 
 premx0=abs(premx0)
 premy0=abs(premy0)
 sobx0=abs(sobx0)
 soby0=abs(soby0)
 
 premout=premx0+premy0
 sobout=sobx0+soby0
 
figure,
subplot(2,4,1),imshow(uint8(im)),title('original image')
subplot(2,4,2),imshow(uint8(premx0)),title('premx0')
subplot(2,4,6),imshow(uint8(premy0)),title('premy0');
subplot(2,4,3),imshow(uint8(sobx0)),title('sobx0');
subplot(2,4,7),imshow(uint8(soby0)),title('soby0');
subplot(2,4,4),imshow(uint8(premout)),title('premout');
subplot(2,4,8),imshow(uint8(sobout)),title('sobout');
subplot(2,4,5),imshow(uint8(im)),title('Image');
