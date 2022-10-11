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

% Resolución de sistemas de ecuaciones lineales
R1 = 1e3;
R2 = 270;
R3 = 330;
Vs1 = 12;
Vs2 = 5;
A = [1 -1 -1;R1 0 R2;0 R3 -R2];
B=[0;Vs1-Vs2;Vs2];
%I = inv(A)*B
I = A\B;

% Sistemas Eléctricos
R = 2;
L = 1;
C = 1;

% Sistema RC
VcVs1 = tf([1],[R*C 1])
figure
step(VcVs1,100)

% Sistema RLC
VcVs2 = tf([1],[L*C R*C 1])
figure
step(VcVs2,100)

% ----------------------------------
% CLASE 15/09/2022
% ----------------------------------

% 1 Polo negativo (ESTABLE)
sis1 = tf(1,[1 1])
impulse(sis1)
% 1 Polo (o par de polos conjugados) en el origen (CRITICAMENTE ESTABLE)
sis2 = tf(1,[1 0])
impulse(sis2)
% 2 Polos en el origen (INESTABLE)
sis3 = tf(1,[1 0 0])
impulse(sis3)

sis = tf(1,[1 0 0 ])
step(sis)


% ----------------------------------
% CLASE 04/10/2022
% ----------------------------------
close all
% DIAGRAMA DE BODE
omega = 0.01:0.01:1000;
X = 1./(1i*omega +10);

% Diagrama de Bode: Escala vertical lineal vs. Escala horizontal lineal
mag = abs(X);
fas = angle(X);
figure
subplot(2,1,1)
plot(omega,mag)
xlabel('Frecuencia (rad/s)')
ylabel('Unidad de amplitud')
h=gcf();
text(50.0,0.08, {"La magnitud está concentrada","en las frecuencias bajas"})
title('Magnitud: Eje vertical lineal - Eje horizontal lineal')

subplot(2,1,2)
plot(omega,fas)
xlabel('Frecuencia (rad/s)')
ylabel('rad')
text(50.0,-0.2, {"La fase está concentrada","en las frecuencias bajas"})
title('Fase: Eje vertical lineal - Eje horizontal lineal')

% Diagrama de Bode: Escala vertical lineal vs. Escala horizontal logarítmica
mag = abs(X);
fas = angle(X);
figure
subplot(2,1,1)
semilogx(omega,mag)
xlabel('Frecuencia (rad/s)')
ylabel('Unidad de amplitud')
text(0.012,0.06, {"La magnitud en las frecuencias bajas","se amplia horizontalmente"})
title('Magnitud: Eje vertical lineal - Eje horizontal logarítmico')
subplot(2,1,2)
semilogx(omega,fas)
xlabel('Frecuencia (rad/s)')
ylabel('rad')
text(0.012,-0.5, {"La fase en las frecuencias bajas","se amplia horizontalmente"})
title('Fase: Eje vertical lineal - Eje horizontal logarítmico')

% Diagrama de Bode: 20*log10(Magnitud en Escala lineal) vs. Escala horizontal logarítmica
mag = 20*log10(abs(X));
fas = angle(X);
figure
subplot(2,1,1)
semilogx(omega,mag)
xlabel('Frecuencia (rad/s)')
ylabel('dB (20*log_{10}(Mag))')
text(0.012,-30, {"La magnitud en las frecuencias bajas","se amplia horizontalmente"})
text(0.0512,-50, {"La atenuación de la magnitud","se convierte en una linea recta"})
title('Magnitud: Eje vertical en decibeles - Eje horizontal logarítmico')
subplot(2,1,2)
semilogx(omega,fas)
xlabel('Frecuencia (rad/s)')
ylabel('rad')
text(0.012,-0.5, {"La fase en las frecuencias bajas","se amplia horizontalmente"})
title('Fase: Eje vertical lineal - Eje horizontal logarítmico')

% Usando las funciones FFT y BODE
sis1 = tf(1,[1 10]);
figure
bode(sis1)
