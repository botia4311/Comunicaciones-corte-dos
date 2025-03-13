% Cargar los datos
filename = 'Datos.txt';
data = readmatrix(filename);

% Seleccionar maximo 35 datos
tiempo_ms = data(1:22, 1); % Tiempo en milisegundos
voltaje = data(1:22, 2);   % Voltaje en voltios

% Convertir tiempo a segundos
tiempo_s = tiempo_ms / 1000;

% Graficar los datos
figure;
plot(tiempo_s, voltaje, '-o', 'LineWidth', 1.5);
grid on;
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
title('Señal de voltaje vs tiempo de los primeros datos (TOMA 1)');


