function [] = star(numberOfSide)
    [pointsCoordinate] = calculatingPoints(numberOfSide);
    visualization(pointsCoordinate);
end

function [pointsCoordinate] = calculatingPoints(numberOfSide)

    x0 = 0; y0 = 0; % the center point of the star
    length = 4; % distance from the star center to the points
    angle = pi/2; % starting with the 90 degrees point
    angleChangesDegree = 2*pi/numberOfSide;
    
    pointsCoordinate = [];
    for (i = 1:numberOfSide)
        x = length*cos(angle);
        y = length*sin(angle);
        pointsCoordinate = [pointsCoordinate; x y];
        angle = angle - angleChangesDegree;
    end
end

function [] = visualization(pointsCoordinate)
    clf;
    hold on;
    axis([-5 5 -5 5]);

    % double the points table for convenience
    pointsCoordinate = [pointsCoordinate; pointsCoordinate];
    length = size(pointsCoordinate, 1);

    for (i = 1:2:length - 2) % for not exceed
        plot([pointsCoordinate(i, 1) pointsCoordinate(i + 2, 1)],...
             [pointsCoordinate(i, 2) pointsCoordinate(i + 2, 2)],...
             'k-o');
    end
    
    if (mod(length/2, 2) == 0)
        for (i = 2:2:length - 2)
        plot([pointsCoordinate(i, 1) pointsCoordinate(i + 2, 1)],...
             [pointsCoordinate(i, 2) pointsCoordinate(i + 2, 2)],...
             'k-o');
        end
    else 
        plot([pointsCoordinate(1, 1) pointsCoordinate(length - 1, 1)],...
             [pointsCoordinate(1, 2) pointsCoordinate(length - 1, 2)],...
             'k-o');
    end
end