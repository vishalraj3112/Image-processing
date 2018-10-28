clc
clear all
im=imread('E:\IVP\mandrill.jpg')
im=rgb2gray(im)
im=double(im)
I=fft2(im)
Is=fftshift(I)
Do=10;
n=2;
gh=1.5;
gl=0.5;
[r c]=size(im)

for u=1:r
    for v=1:c
        D=(((r/2)-u)^2+((c/2)-v)^2)^(0.5);
        Hh(u,v)=(((gh-gl)*(1-exp((-1*D^2)/(Do^2))))+gl);
        Hg(u,v)=1-exp((-1*D^2)/(2*(Do^2)));
end
end

Gh=abs(ifft(Is.*Hh));
Gg=abs(ifft(Is.*Hg));

figure,
subplot(121),imshow(uint8(255*Hh)),title('Homomorphic');
subplot(122),imshow(uint8(255*Hg)),title('Gaussian');

figure,
subplot(121),imshow(uint8(im)),title('original image');
subplot(122),imshow(uint8(abs(Is))),title('fourier shifted image');

figure,
subplot(121),mesh(Hh),title('Ideal filter');
subplot(122),mesh(Hg),title('butterworth filter');

figure,
subplot(121),imshow(uint8(Gh)),title('homomorphic filtered image');
subplot(122),imshow(uint8(Gg)),title('gaussian image');

