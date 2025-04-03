% Datos experimentales
distancia = 0:17; % Distancia en metros
RSSI_exp = [-47.90, -52.43, -61.22, -66.69, -63.00, -63.15, -74.71, -73.03, -77.15, -79.18, ...
            -79.49, -77.86, -82.29, -83.42, -84.42, -84.87, -84.40, -85.99]; % RSSI experimental

% Parámetros del modelo teórico
f = 2412; % Frecuencia en MHz para canal 1 (WiFi 2.4 GHz)
dkm = distancia / 1000; % Convertir distancia a kilómetros
FSPL = 20 * log10(dkm) + 20 * log10(f) + 32.44; % Cálculo de FSPL

% Ajuste con K
PTX = 20; % Potencia del transmisor en dBm
K = RSSI_exp(2) - (PTX - FSPL(2)); % Ajuste usando d = 1 m
RSSI_teo = PTX - FSPL + K; % RSSI teórico ajustado

% Graficar
figure;
plot(distancia, RSSI_exp, 'bo-', 'LineWidth', 2, 'MarkerSize', 8); % Datos experimentales
hold on;
plot(distancia, RSSI_teo, 'r--', 'LineWidth', 2, 'MarkerSize', 8); % Modelo teórico ajustado

% Personalización de la gráfica
grid on;
xlabel('Distancia (m)');
ylabel('RSSI (dBm)');
title('Comparación entre RSSI Experimental y Teórico');
legend('RSSI Experimental', 'RSSI Teórico Ajustado', 'Location', 'best');
xlim([0 17]);
ylim([-100 -40]);
hold off;
