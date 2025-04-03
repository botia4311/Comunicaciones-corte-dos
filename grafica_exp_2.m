% Cargar datos desde el archivo TXT
data = readtable('rssi_measurements 3.txt');

% Extraer las columnas
distancia = data.Distancia;
rssi = data.RSSI;
desviacion = data.Desviacion;

% Crear la gráfica con barras de error
figure;
errorbar(distancia, rssi, desviacion, 'o', 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'Color', 'b', 'LineWidth', 1.2);
hold on;

% Resaltar puntos específicos con rombos rojos
scatter(distancia, rssi, 50, 'r', 'd', 'filled');

% Configuración de la gráfica
grid on;
xlabel('Distancia (m)');
ylabel('RSSI (dBm)');
title('Representación de Error en RSSI');
xticks(unique(distancia)); % Ajustar los ticks del eje X
ylim([-90, -10]); % Ajustar el rango de valores en Y

% Agregar etiquetas a puntos clave
for i = 1:4
    text(distancia(i), rssi(i), sprintf('X %d\nY %.2f', i, rssi(i)), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 10, 'BackgroundColor', 'w');
end

% Agregar leyenda
legend('Medición RSSI', 'Puntos destacados', 'Location', 'best');

hold off;
