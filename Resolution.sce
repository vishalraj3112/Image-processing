clc
clear
i=imread("H:\IVP\Strawberries.jpg")

i=rgb2gray(i);
[r c]=size(i);
x=1;

for m=1:2:r
    y=1
    for n=1:2:c
        j(x,y)=i(m,n)
        y=y+1
end
x=x+1
end

figure;
subplot(2,1,1),imshow(i);title('Input Image');
subplot(2,2,2),imshow(j);title('Output Image');
disp('Size of input image:',size(i));
disp('Size of output image:',size(j));
