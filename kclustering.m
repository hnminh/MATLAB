function [] = kclustering (fig)
    dim = 2;
    [data, clusterInfo] = generateData(dim);
    
    numberOfClusters = 3;
    methodInitial = 1;
    [centers] = initialGuess(data, numberOfClusters, methodInitial);
    
    visualize(fig, data, clusterInfo, centers);
end

function [data, cN] = generateData(dim)
    numberOfCluster = 3;
    N = 100*[2 4 3];  % numbers of data points in each cluster
    cN = [0 cumsum(N)];
    
    km = 1;
    xmeans = km*[-2 3 0];
    ymeans = km*[2 0 -3];
    means = [xmeans' ymeans'];
    
    %means = zeros([3 2]);
    %devs = ones([3 2]);
    
    kd = 0.5;
    xdev = kd*[2 1 1];
    ydev = kd*[1 2 1];
    devs = [xdev' ydev'];
    
    data = zeros([sum(N) dim]);
    for(n = 1:numberOfCluster)
        for (d = 1:dim)
            data(cN(n) + 1:cN(n + 1), d) = means(n, d) + devs(n, d)*randn([N(n) 1]);
        end
    end
end

function [] = visualize (fig, data, clusterInfo, centers)
    
    markers0 = ['^sodx+*vp<h>']; markers = repmat(markers0, [1 5]);
    colours0 = ['rkcgmy']; colours = repmat(colours0, [1 10]);
    
    figure(fig);
    clf;
    
    horz = 4;
    vert = 4;
    subplot(vert, horz, [1 5]);
    plot(data(:,1), data(:,2), 'b.');
    
    subplot(vert, horz, [9, 13]);
    hold on;
    for(n = 1:length(clusterInfo) - 1)
        plot(data(clusterInfo(n) + 1:clusterInfo(n + 1), 1),...
             data(clusterInfo(n) + 1:clusterInfo(n + 1), 2),...
             ['b', markers(n)]);
             
    end
    
    subplot(vert, horz, [2, 4]);
    
    subplot(vert, horz, [6, 16]);
    hold on;
    for(n = 1:length(clusterInfo) - 1)
        plot(data(clusterInfo(n) + 1:clusterInfo(n + 1), 1),...
             data(clusterInfo(n) + 1:clusterInfo(n + 1), 2),...
             ['b', markers(n)]);
        plot(centers(n, 1), centers(n, 2), [colours(n), markers(n)], ...
             'MarkerSize', 20, 'LineWidth', 5);
    end
end

function [centers] = initialGuess(data, numberOfClusters, method)
    N = size(data, 1);
    
    if (method == 1)
        centers = data(randperm(N, numberOfClusters),:);
    elseif (method == 2)
        %
    else
        centers = data(1:numberOfClusters, :);
    end
end