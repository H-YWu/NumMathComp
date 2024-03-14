imax = 0;
n = 30;
x = 0.5;
h = 1.0;
emax = 0.0;
errors = zeros(1, n); % Initialize array to store errors
y_values = zeros(1, n); % Initialize array to store y values
x_values = zeros(1, n); % Initialize array to store x values
cos_values = zeros(1, n); % Initialize array to store cos(x) values
h_values = zeros(1, n); % Initialize array to store h values

for i = 1:n
    h = 0.25 * h;
    y = (sin(x + h) - sin(x - h)) / (2.0 * h); % Central difference formula
    y_values(i) = y; % Store y value for plotting
    x_values(i) = x; % Store x value for plotting
    cos_values(i) = cos(x); % Store cos(x) value for plotting
    h_values(i) = h; % Store h value for plotting
    error = abs(cos(x) - y); % Take absolute value of error
    errors(i) = error; % Store error for plotting
    if error > emax
        emax = error;
        imax = i;
    end
end

% Plot error vs. iteration index
subplot(2, 1, 1);
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

% Plot y, x, h, and cos(x)
subplot(2, 1, 2);
plot(1:n, y_values, 'r.-', 1:n, x_values, 'g.-', 1:n, h_values, 'm.-', 1:n, cos_values, 'k.-');
legend('y', 'x', 'h', 'cos(x)', 'Location', 'best');
xlabel('Iteration Index (i)');
ylabel('Value');
title('Values vs. Iteration Index');
grid on;
