clc
clear all
A=imread("H:\IVP\blobs.png");
A=double(A)
a=find(A==255)
A(a)=1;
W=[1 1 1;1 1 1;1 1 1]
a1=find(W==1)
count=length(a1);
[r c]=size(A);
E=zeros(r,c);
O=zeros(r,c);

for i=2:r-1
    for j=2:c-1
        t=sum(A(i-1:i+1,j-1:j+1).*W)
        if(t==count)
            E(i,j)=1;
        else
            E(i,j)=0;
        end
end
end

for i=2:r-1
    for j=2:c-1
        t=sum(E(i-1:i+1,j-1:j+1).*W)
        if(t>0)
            O(i,j)=1;
        else
            O(i,j)=0;
        end
end
end

A=255*A;
O=255*O;
E=255*E;

figure,
subplot(131),imshow(uint8(A)),title("original Image");
subplot(132),imshow(uint8(E)),title("Eroded Image");
subplot(133),imshow(uint8(O)),title("Image after opening");
