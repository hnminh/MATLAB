function [] = newtonMethod(initialGuess)
	% using newton's method to calculate the solution
	% for the equation e^(-x) = sin(x)

	[history] = findSolution(initialGuess);
	visualize(history(size(history, 1)));
end

function [history] = findSolution(x0)
	[x1] = findNext(x0);
	history = [x1];

	err = 10^(-15);
	while (abs(x1 - x0) > err)
		x0 = x1;
		[x1] = findNext(x0);
		history = [history; x1];
	end
end

function [x1] = findNext(x0)
	fx = exp(-x0) - sin(x0);
	dfx = -exp(-x0) - cos(x0);
	x1 = x0 - fx/dfx; % newton's method
end

function [] = visualize(xSolution)
	clf;
	hold on;

	x = [-3:0.01:3];
	y1 = exp(-x);
	y2 = sin(x);
	plot(x, y1, 'g-.');
	plot(x, y2, 'r-.');

	ySolution = sin(xSolution);
	plot(xSolution, ySolution, 'kx');
end