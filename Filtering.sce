clc
clear all
im=imread('E:\IVP\mandrill.jpg')
im=rgb2gray(im)
im=double(im)
I=fft2(im)
Is=fftshift(I)
Do=30;
n=2;
[r c]=size(im)
disp('This is r:',r)
disp('This is c:',c)
for u=1:r
    for v=1:c
        D=(((r/2-u)^2+(c/2-v)^2)^0.5)
        if(D<=Do)
            Hi(u,v)=1;
        else
           Hi(u,v)=0; 
        end
Hb(u,v)=1/(1+(D/Do)^(2*n));
Hg(u,v)=exp((-1*D^2)/(2*Do)^2)
end
end
Gi=Hi.*Is;
Gb=Hb.*Is;
Gg=Hg.*Is;
gi=abs(ifft(Gi))
gb=abs(ifft(Gb))
gg=abs(ifft(Gg))

figure,
subplot(131),imshow(uint8(255*Hi)),title('Ideal filter')
subplot(132),imshow(uint8(255*Hb)),title('Butterworth filter')
subplot(133),imshow(uint8(255*Hg)),title('Gaussian filter')

figure,
subplot(131),imshow(uint8(i)),title('original image')
subplot(132),imshow(uint8(abs(I))),title('fourier image')
subplot(133),imshow(uint8(abs(Is))),title('fourier shifted image')

figure,
subplot(131),mesh(Hi),title('Ideal filter')
subplot(132),mesh(Hb),title('butterworth filter')
subplot(133),mesh(Hg),title('gaussian filter')

figure,
subplot(131),imshow(uint8(gi)),title('ideal filtered image')
subplot(132),imshow(uint8(gb)),title('butterworth image')
subplot(133),imshow(uint8(gg)),title('gaussian image')
