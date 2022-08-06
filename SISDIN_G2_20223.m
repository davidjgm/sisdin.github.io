% ============================================================
% CURSO: SEÑALES Y SISTEMAS
% GRUPO: 2
% SEMESTRE: 2022-3
% PROFESOR: DAVID JULIAN GONZÁLEZ MALDONADO
% ============================================================

close all % Cierro todas las ventanas
clc % Limpio el Command Window

t = -10:0.01:10; % Creo un vector de tiempo de 0 a 10, en interv. de 0.01

% Gráfica de una onda seno
x1 = sin(2*pi*t/3);
figure
plot(t,x1)
title('sin(2*pi*t/3)')

% Cálculo de polos de la función F = (s+1)/(4s^3+2s^2+3s+1)
polos = roots([4 2 3 1])