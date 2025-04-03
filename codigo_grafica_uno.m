% Leer los datos ignorando los encabezados
datos = readtable('rssi_measurements 2.txt', 'Delimiter', '\t'); 

% Extraer columnas
distancia = datos{:,1};  % Primera columna: distancia
rssi = datos{:,2};       % Segunda columna: RSSI
desviacion = datos{:,3}; % Tercera columna: Desviación estándar

% Calcular valores adicionales
n = length(rssi); 
error_estandar = desviacion / sqrt(n); 
IC_95 = 1.96 * error_estandar; 
IC_99 = 2.58 * error_estandar; 

% Crear la figura
figure;
hold on;
grid on;

% Graficar barras de error
errorbar(1, mean(rssi), error_estandar(1), 'bo', 'CapSize', 10, 'LineWidth', 1.5);
errorbar(2, mean(rssi), 2 * error_estandar(1), 'bo', 'CapSize', 10, 'LineWidth', 1.5);
errorbar(3, mean(rssi), desviacion(1), 'b', 'CapSize', 10, 'LineWidth', 1.5);
errorbar(4, mean(rssi), 2 * desviacion(1), 'b', 'CapSize', 10, 'LineWidth', 1.5);
errorbar(5, mean(rssi), IC_95(1), 'b', 'CapSize', 10, 'LineWidth', 1.5);
errorbar(6, mean(rssi), IC_99(1), 'b', 'CapSize', 10, 'LineWidth', 1.5);

% Marcar los promedios con diamantes rojos
scatter(1:6, repmat(mean(rssi), 1, 6), 100, 'r', 'd', 'filled');

% Etiquetas
xticks(1:6);
xticklabels({'1 EE', '2 EE', '1 DE', '2 DE', 'IC 95%', 'IC 99%'});
ylabel('RSSI (dBm)');
title('Representación de Error en RSSI');

hold off;
