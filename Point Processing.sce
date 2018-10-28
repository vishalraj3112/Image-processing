clc
clear all
i=imread("C:\Users\VIshal\Desktop\lena.png")
im=rgb2gray(i)
figure,imshow(im);
s1=255*bitget(im,1);
s2=255*bitget(im,2);
s3=255*bitget(im,3);
s4=255*bitget(im,4);
s5=255*bitget(im,5);
s6=255*bitget(im,6);
s7=255*bitget(im,7);
s8=255*bitget(im,8);
figure,
subplot(2,4,1),imshow(uint8(s8));
subplot(2,4,2),imshow(uint8(s7));
subplot(2,4,3),imshow(uint8(s6));
subplot(2,4,4),imshow(uint8(s5));


