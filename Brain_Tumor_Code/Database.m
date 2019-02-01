function [data,tar]=Database()
x=1; tar=[];
for i=1:3
    
d=dir(['data\',num2str(i),'\*.jpg']);

for j=1:length(d)
    
    img=imread(['data\',num2str(i),'\',d(j).name]);
    img=im2bw(img);
    img = imresize(img, [80 40]);
data(x,:)=img(:)';
x=x+1;
end
tar=[tar ones(1,length(d))*i];
end
% save('data4.mat','data');
