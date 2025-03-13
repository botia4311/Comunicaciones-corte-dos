% Cargar los datos del archivo
data = readtable('samples_1.txt', 'Delimiter', '\t');

% Extraer la columna de voltajes
voltajes = data.Voltaje_V;

% Eliminar valores NaN si existen
voltajes = voltajes(~isnan(voltajes));

% Calcular la media y la desviación estándar
media = mean(voltajes);
desviacion_estandar = std(voltajes);

% Mostrar los resultados
fprintf('Media de los voltajes: %.4f V\n', media);
fprintf('Desviación estándar de los voltajes: %.4f V\n', desviacion_estandar);
