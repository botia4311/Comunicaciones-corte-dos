% Cargar datos desde un archivo .txt con formato flexible
filename = 'fft_100_64.txt'; % Reemplazar con el nombre correcto del archivo
datos = readmatrix(filename); % Funciona con archivos CSV o TXT bien formateados
% Verificar si los datos se cargaron correctamente
if size(datos,2) < 2    
    error('El archivo debe contener al menos dos columnas: tiempo y valores.');
end
% Extraer columnas (asumiendo que son tiempo y valores)
tiempo = datos(:,1);  % Primera columna -> Tiempo
valores = datos(:,2); % Segunda columna -> Valores
% Crear la figura
figure; hold on; % Mantener ambos gráficos en la misma figura
% Graficar con plot (línea continua)
plot(tiempo, valores, '-o', 'Color', 'b', 'DisplayName', 'Señal (plot)');
% Graficar con stem (líneas verticales y puntos)
stem(tiempo, valores, 'r', 'DisplayName', 'Señal (stem)');
% Configuración del gráfico
xlabel('Tiempo');
ylabel('Valores');
title('Gráfico de la señal desde TXT');
legend; % Mostrar leyenda
grid on; % Activar la cuadrícula
hold off;
