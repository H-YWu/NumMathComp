imax = 0;
n = 100;
x = 0.5;
h = 0.5;
emax = 0.0;
errors = zeros(1, n); % Initialize array to store errors

for i = 1:n
    h = 0.50 * h;
    y = (sin(x + h) - sin(x)) / h;
    % error = abs(cos(x) - y); % Take absolute value of error
    error = abs(cos(x) - y);
    errors(i) = error; % Store error for plotting
    if error > emax
        emax = error;
        imax = i;
    end
end

% Plot error vs. iteration index
plot(1:n, errors, 'b.-');
xlabel('Iteration Index (i)');
ylabel('Error');
title('Error vs. Iteration Index');
grid on;

% Highlight the maximum error point
hold on;
plot(imax, emax, 'ro', 'MarkerSize', 10);
text(imax, emax, ['  max error: ' num2str(emax)]);
hold off;