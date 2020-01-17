function [] = pendulum ()
  % initialize the basic data
  length = 5;
  g = 9.81;
  w = sqrt(g/length);
  alpha0 = pi/20;  
  % the pivot of the pendulum is at (0, 0)
  
  % runs in 10 seconds
  for (t = 1:0.1:10)
    [x, y] = pendulumCoordinate (length, alpha0, w, t);
    [xStr, yStr] = stringGenerate (x, y);
    visualize (x, y, xStr, yStr);
  end
end

function [x, y] = pendulumCoordinate (length, alpha0, w, t)
  alpha = alpha0*cos(w*t);
  x = length*sin(alpha);
  y = -length*cos(alpha);
end

function [xStr, yStr] = stringGenerate (x, y)
  N = 10^3;
  xStr = linspace(0, x, N);
  yStr = xStr * y/x;
end

function [] = visualize (x, y, xStr, yStr)
  clf;
  hold on;
  % the pivot of the pendulum
  %plot(0, 0, 'MarkerSize', 20, 'Color', [0 0 0]/255);
  plot(0, 0, 'Marker' , 'o', 'MarkerSize', 10, 'MarkerEdgeColor', [0 0 0]/255, 'MarkerFaceColor', [0 0 0]/255);
  
  plot(xStr, yStr, 'Color', [0 0 0]/255);
  %plot(x, y, 'MarkerSize', 100, 'Color', [255 0 0]/255);
  plot(x, y, 'Marker' , 'o', 'MarkerSize', 50, 'MarkerEdgeColor', [255 0 0]/255, 'MarkerFaceColor', [255 0 0]/255);
  
  % set the axis limit for the plot
  axis([-3 3 -6 1]);
  pause(0.1);
end
