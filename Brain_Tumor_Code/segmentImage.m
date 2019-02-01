function grayImg1=segmentImage(grayImg)

[li,center] = adaptcluster_kmeans(grayImg);
A=find(li==1); %assigning cluster1 to variable A
B=find(li==2); %assigning cluster2 to variable B
C=find(li==3); %assigning cluster3 to variable C

[n m1]=size(grayImg); % size of gray image is stored (to display as image it must be converted to 2d array)
grayImg1=grayImg; 
a1=length(A); %assigning length of A to a1
M=1;
for j =1:a1
    if A(M)==M
        grayImg1(A(M)) =  grayImg(A(M));
        M=M+1;
    else
        grayImg1(A(M)) = 0;
        M=M+1;
    end
end
grayImg2=grayImg;
b1=length(B);
M=1;
for j =1:b1
    if B(M)==M
        grayImg2(B(M)) =  grayImg(B(M));
        M=M+1;
    else
        grayImg2(B(M)) = 0;
        M=M+1;
    end
end
grayImg3=grayImg;
c1=length(C);
M=1;
for j =1:c1
    if C(M)==M
        grayImg3(C(M)) =  grayImg(C(M));
        M=M+1;
    else
        grayImg3(C(M)) = 0;
        M=M+1;
    end
end 

figure,imshow(grayImg1),title('Segmented 1 Image');
figure,imshow(grayImg2),title('Segmented 2 Image');
figure,imshow(grayImg3),title('Segmented 3 Image');

