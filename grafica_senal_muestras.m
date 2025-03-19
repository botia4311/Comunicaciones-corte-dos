% Cargar datos desde el archivo .txt
filename = 'muestras_100_64.txt'; % Nombre del archivo proporcionado
datos = readtable(filename); % Leer los datos como tabla

% Extraer columnas (asumiendo que son tiempo y valores)
tiempo = datos{:, 1};  % Primera columna -> Tiempo
valores = datos{:, 2}; % Segunda columna -> Valores

% Gráfica de la señal en el dominio del tiempo
figure;
plot(tiempo, valores, '-o', 'Color', 'b', 'DisplayName', 'Señal original');
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Señal en el dominio del tiempo');
grid on;
legend;
