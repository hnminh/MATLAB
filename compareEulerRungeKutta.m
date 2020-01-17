function [] = compareEulerRungeKutta()
	% implement on the equation y = e^x

	x0 = 0; y0 = 1; % initial point
	stepSize = 0.1;
	numberOfSteps = 20;
	method = 'Euler';
	[xE, yE] = generateData(method, x0, y0, stepSize, numberOfSteps);

	method = 'Ru-Ku';
	[xRK, yRK] = generateData(method, x0, y0, stepSize, numberOfSteps);

	visualize(x0, y0, xE, yE, xRK, yRK);
end

function [X, Y] = generateData(method, x0, y0, stepSize, numberOfSteps)

	% initialize the results storage
	X = zeros([(numberOfSteps + 1) 1]);
	Y = zeros([(numberOfSteps + 1) 1]);

	X(1) = x0;
	Y(1) = y0;

	for (i = 1:numberOfSteps)
		if (method == 'Euler')
			[dYi] = evaluateODE(X(i), Y(i));

			X(i + 1) = X(i) + stepSize;
			Y(i + 1) = Y(i) + stepSize*dYi;
		elseif (method == 'Ru-Ku')
        	k1 = evaluateODE(X(i), Y(i));
			k2 = evaluateODE(X(i) + stepSize/2, Y(i) + stepSize/2*k1);
			k3 = evaluateODE(X(i) + stepSize/2, Y(i) + stepSize/2*k2);
			k4 = evaluateODE(X(i) + stepSize, Y(i) + stepSize*k3);
			
			X(i + 1) = X(i) + stepSize;
			Y(i + 1) = Y(i) + stepSize/6*(k1 + 2*k2 + 2*k3 + k4);
		end	
	end
end

function [dy] = evaluateODE(x, y)
	dy = y;
end

function [] = visualize(x0, y0, xE, yE, xRK, yRK)
	clf;
	hold on;

	plot(xE, exp(xE), 'k-o');
	plot(xE, yE, 'r-x');
	plot(xRK, yRK, 'g-s');
end