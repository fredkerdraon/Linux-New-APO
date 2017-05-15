// 1. Define Rosenbrock for optimization
            function [f, g, ind]=rosenbrock(x, ind)
            f = 100.0 *(x(2) - x(1)^2)^2 + (1 - x(1))^2;
            g(1) = - 400. * ( x(2) - x(1)**2 ) * x(1) -2. * ( 1. - x(1) )
            g(2) = 200. * ( x(2) - x(1)**2 )
            endfunction

            // 2. Define rosenbrock for contouring
            function f=rosenbrockC(x1, x2)
            x = [x1 x2]
            ind = 4
            [ f , g , ind ] = rosenbrock ( x , ind )
            endfunction

            // 3. Define Rosenbrock for plotting
            function [f, g, ind]=rosenbrockPlot(x, ind)
            [ f , g , ind ] = rosenbrock ( x , ind )
            if (ind == 1) then
            plot ( x(1) , x(2) , "g." )
            end
            endfunction

            // 4. Draw the contour of Rosenbrock's function
            x0 = [-1.2 1.0];
            xopt = [1.0 1.0];
            xdata = linspace(-2,2,100);
            ydata = linspace(-2,2,100);
            contour ( xdata , ydata , rosenbrockC , [1 10 100 500 1000])
            plot(x0(1) , x0(2) , "b.")
            plot(xopt(1) , xopt(2) , "r*")

            // 5. Plot the optimization process, during optimization
            [fopt, xopt] = optim ( rosenbrockPlot , x0 , imp = -1)

Example: Optimizing with numerical derivatives

It is possible to optimize a problem without an explicit knowledge of the derivative of the cost function. For this purpose, we can use the numderivative function to compute a numerical derivative of the cost function.

In the following example, we use the numderivative function to solve Rosenbrock's problem.

function f=rosenbrock(x)
            f = 100.0 *(x(2)-x(1)^2)^2 + (1-x(1))^2;
            endfunction

            function [f, g, ind]=rosenbrockCost(x, ind)
            f = rosenbrock ( x );
            g = numderivative ( rosenbrock , x );
            endfunction

            x0 = [-1.2 1.0];

            [ fopt , xopt ] = optim ( rosenbrockCost , x0 )


