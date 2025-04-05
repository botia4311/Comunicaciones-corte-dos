% Punto 3 - Modulación 16-QAM y diagrama de constelación
clc; clear; close all;

% Limpia la consola (clc), borra variables previas (clear), y cierra gráficos anteriores (close all)

% 1. Generar una secuencia aleatoria de bits
num_bits = 400; % Número de bits. Debe ser múltiplo de 4 ya que 16-QAM usa 4 bits por símbolo
bits = randi([0 1], 1, num_bits); % Genera una fila de bits aleatorios entre 0 y 1

% 2. Agrupar en bloques de 4 bits (2 para I y 2 para Q)
bits_reshape = reshape(bits, 4, []).'; 
% Reorganiza los bits en filas de 4 bits por símbolo
% Transpuesta para que cada fila represente un símbolo

% 3. Tabla de mapeo para bits → niveles de voltaje
% Esta tabla asigna a cada par de bits un voltaje específico según el ejercicio
map = containers.Map({'00', '01', '10', '11'}, [-0.821, -0.22, 0.22, 0.821]);

% 4. Convertir cada bloque de 4 bits en un símbolo complejo (I + jQ)
symbols = zeros(1, size(bits_reshape,1)); % Vector para guardar los símbolos modulados
for i = 1:size(bits_reshape,1)
    b = bits_reshape(i,:); % Obtiene los 4 bits del símbolo i
    I_bits = sprintf('%d%d', b(1), b(2)); % Primeros 2 bits → componente I
    Q_bits = sprintf('%d%d', b(3), b(4)); % Últimos 2 bits → componente Q
    I = map(I_bits); % Mapea bits I a voltaje
    Q = map(Q_bits); % Mapea bits Q a voltaje
    symbols(i) = I + 1j*Q; % Crea el número complejo (I + jQ)
end

% 5. Graficar el diagrama de constelación
figure; % Abre una nueva figura
plot(real(symbols), imag(symbols), 'o', 'MarkerSize', 7, 'MarkerFaceColor', 'b');
% Dibuja los puntos de la constelación (eje x = I, eje y = Q)

xlabel('I (In-phase)'); % Etiqueta del eje X
ylabel('Q (Quadrature)'); % Etiqueta del eje Y
title('Diagrama de Constelación 16-QAM'); % Título del gráfico
grid on; % Muestra una rejilla
axis equal; % Escalas iguales para X y Y
xlim([-1 1]); % Límites del eje X
ylim([-1 1]); % Límites del eje Y
