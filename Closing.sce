clc
clear all
A=imread("H:\IVP\blobs.png")
A=double(A)
a=find(A==255)
A(a)=1
[r c]=size(A)
W=[1 1 1;1 1 1;1 1 1]
a1=find(W==1)
count=length(a1)
Di=zeros(r,c)
Cl=zeros(r,c)

for i=2:r-1
    for j=2:c-1
        t=sum(A(i-1:i+1,j-1:j+1).*W)
        if(t>0)
            Di(i,j)=1
            
         else
             Di(i,j)=0
end
end
end
for i=2:r-1
    for j=2:c-1
        t=sum(Di(i-1:i+1,j-1:j+1).*W)
        if(t==count)
            Cl(i,j)=1
            
        else
            Cl(i,j)=0
        end
end
end

Di=255*Di;
Cl=255*Cl;
A=255*A;

figure,
subplot(131),imshow(uint8(A)),title("original Image");
subplot(132),imshow(uint8(Di)),title("Dilated Image");
subplot(133),imshow(uint8(Cl)),title("Closed Image");

