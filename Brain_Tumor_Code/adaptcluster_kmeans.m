function [li,center] = adaptcluster_kmeans(inp)
% inp - is input image to be clustered.
% li - is labeled image (Clustered Image).
% CENTER - is array of cluster centers.

% checks wheather input image is grayscale or color image
if size(inp,3)>1
    [li,center] = ColorClustering(inp); % do color clustering
else
    [li,center] = GrayClustering(inp); %do grayimage clustering
end

% convert values of image into double precision
gray = double(gray); %convert matrix value into double
array = gray(:); % Copy those values into array 
 tic
while(true)
    clu = mean(array); % Initialize seed Point(number of clusters).(seed)
    i = i+1; %Increment Counter for each iteration.
    while(true)
        j = j+1; % Initialize Counter for each iteration.
        dist = (sqrt((array-clu).^2)); % Find distance between Seed point and Gray Value.
        distth = (sqrt(sum((array-clu).^2)/numel(array)));% find the distance to check whether they are in range or not
        %         distth = max(dist(:))/5;
        band = dist<distth;% copy values  if they are in range(qualified)
        newseed = mean(array(band));% again Update mean.
        
        if isnan(newseed) % Check mean is not a NaN(infinity) value.
            break;
        end
        
        if clu == newseed || j>10 % Condition for convergence and maximum iteration.
            j=0;
            array(band) = [];% Remove values which have assigned to a cluster i.e. it stores empty matrix in array
            center(i) = newseed; % Store center of cluster.
            break;
        end
        clu = newseed;% Update seed.
    end
    
    if isempty(array) || i>10 % Check maximum number of clusters.
        i = 0; % Reset Counter.
        break;
    end
    
end
toc








