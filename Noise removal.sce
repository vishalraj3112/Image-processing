clc
clear all
im=imread('E:\IVP\coins.png')
imn1=imnoise(im,'gaussian',0,0.02);
imn2=imnoise(im,'salt & pepper',0.2);
imn1=double(imn1);
imn2=double(imn2);
im=double(im)
[r c]=size(im)
i01=zeros(r,c)
i02=i01;
i03=i02;
i04=i03;

wlpf=(1/9)*[1 1 1;1 1 1;1 1 1]
for i=2:r-1
    for j=2:c-1
        I=imn1(i-1:i+1,j-1:j+1)
        i01(i,j)=sum(I.*wlpf)
        I=gsort(I)
        i02(i,j)=I(5)
        
        I1=imn1(i-1:i+1,j-1:j+1)
        i03(i,j)=sum(I1.*wlpf)
        I1=gsort(I1)
        i04(i,j)=I1(5)
        
end
end

figure,
subplot(131),imshow(uint8(imn1)),title("original gausian image")
subplot(132),imshow(uint8(i01)),title("filtered b lpf")
subplot(133),imshow(uint8(i02)),title("filtered b median filter")

figure,
subplot(131),imshow(uint8(imn2)),title("original salt and pepper image")
subplot(132),imshow(uint8(i03)),title("filtered b lpf")
subplot(133),imshow(uint8(i04)),title("filtered b median filter")
