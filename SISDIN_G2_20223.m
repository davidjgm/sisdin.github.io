% ============================================================
% CURSO: SISTEMAS DINÁMICOS
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

% Respuesta de sistemas subamortiguados
k=4/90; % Ganancia K
sigma = 5/2; % sigma = zeta*omegan
omegad=sqrt(335)/2; % Frecuencia amortiguada
omegan=sqrt(90); % Frecuencia no amortiguada
zeta=sigma/omegan; % Coeficiente de amortiguamento

tr=(pi-atan(omegad/sigma))/omegad % Tiempo de retardo
tp=pi/omegad % Tiempo pico
Mp=k*e^(-zeta/sqrt(1-zeta^2)*pi) % Sobrepaso máximo
ts=4/(zeta*omegan) % Tiempo de subida
sys = tf(4,[1 5 90]) % Función de Transferencia
step(sys,3)
