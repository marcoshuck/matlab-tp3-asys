% -------------------------------------------------------------------------
%{ 
An�lisis de Se�ales y Sistemas - TP Laboratorio N� 3
Ejercicio 1 - Grupo 6

Repositorio disponible en: https://github.com/marcoshuck/matlab-tp3-asys

Realizado por Huck Marcos A. y Castelluci Leandro E.
%}
% -------------------------------------------------------------------------
% Borramos todas las variables del workspace
clear all;
% Borramos los outputs e inputs de la ventana de comandos
clc;

% Inicializaci�n de variables y constantes
syms t 'real';
syms A T;

% -------------------------------------------------------------------------

%% << INICIO DEL EJERCICIO 1.1 >>
disp('Ejercicio 1 - Grupo 6 - 1.1');

% Definimos las constantes simb�licas
T=sym(pi/40);
A=sym(300);

% Definimos la se�al: Onda rectificada
y(t) = (heaviside(t)-heaviside(t-T)).*sin( 2*pi/(2*T)*t);

% Ingreso de N por el usuario
N = input('Ingrese la cantidad de coeficientes que desea calcular: ');

% C�lculo de la serie de Fourier con la funci�n FSERIE
[ak, yr] = FSERIE(y, T, N);

% Estado de hold graph desactivado
hold off;

% Gr�fico de yr(t)
gv = ezplot(yr(t),[0,1.5*double(T)]);

% Estado de hold graph activado
hold on;

simplify(yr(t), 'Step', 100);

str = sprintf('Ejercicio 1.1 con %d coeficientes', N);
title(str);

grid on;

xlabel('t');
ylabel('yr(t)');

%% << FIN DEL EJERCICIO 1.1 >>

disp('Final del ejercicio 1.1 Presione una tecla para continuar.');
system('PAUSE>NULL');

% Realizamos un salto de l�nea por cuesti�n est�tica
fprintf('\n');

% -------------------------------------------------------------------------

%% << INICIO DEL EJERCICIO 1.2 >>
disp('Ejercicio 1 - Grupo 6 - 1.2');

% Definimos las constantes simb�licas
T=sym(0.002);
A=sym(28);

% Definimos la se�al: Cuadrada, simetr�a impar
y(t) = A*(heaviside(t-T/2)-heaviside(t-T)) - A*(heaviside(t+T/2)-heaviside(t-T/2));

% Ingreso de N por el usuario
N = input('Ingrese la cantidad de coeficientes que desea calcular: ');

% C�lculo de la serie de Fourier con la funci�n FSERIE
[ak, yr] = FSERIE(y, T, N);

% Estado de hold graph desactivado
hold off;

% Gr�fico de yr(t)
gv = ezplot(yr(t),[0,1.5*double(T)]);

% Estado de hold graph activado
hold on;

simplify(yr(t), 'Step', 100);

str = sprintf('Ejercicio 1.2 con %d coeficientes', N);
title(str);

grid on;

xlabel('t');
ylabel('yr(t)');

%% << FIN DEL EJERCICIO 1.2 >>

disp('Final del ejercicio 1.2 Presione una tecla para continuar.');
system('PAUSE>NULL');

% Realizamos un salto de l�nea por cuesti�n est�tica
fprintf('\n');

% -------------------------------------------------------------------------

%% << INICIO DEL EJERCICIO 1.3 >>
disp('Ejercicio 1 - Grupo 6 - 1.3');

% Definimos las constantes simb�licas
T=sym(pi/40);
A=sym(300);

% Definimos la se�al: Cuadrada, simetr�a par
y(t) = A*sin(((2*sym('pi'))/T)*t)*(heaviside(t)-heaviside(t-T/2)) + sym(-0.00001)*(heaviside(t-T/2)-heaviside(t-T));

% Ingreso de N por el usuario
N = input('Ingrese la cantidad de coeficientes que desea calcular: ');

% C�lculo de la serie de Fourier con la funci�n FSERIE
[ak, yr] = FSERIE(y, T, N);

% Estado de hold graph desactivado
hold off;

% Gr�fico de yr(t)
gv = ezplot(yr(t),[0,1.5*double(T)]);

% Estado de hold graph activado
hold on;

simplify(yr(t), 'Step', 100);

str = sprintf('Ejercicio 1.3 con %d coeficientes', N);
title(str);

grid on;

xlabel('t');
ylabel('yr(t)');

%% << FIN DEL EJERCICIO 1.3 >>

disp('Final del ejercicio 1.3 Presione una tecla para continuar.');
system('PAUSE>NULL');

% Realizamos un salto de l�nea por cuesti�n est�tica
fprintf('\n');

% -------------------------------------------------------------------------

%% << INICIO DEL EJERCICIO 1.4 >>
disp('Ejercicio 1 - Grupo 6 - 1.4');

% Definimos las constantes simb�licas
T=sym(pi/40);
A=sym(300);

% Definimos la se�al: Cuadrada, simetr�a par
y(t) = A*sin(((2*sym('pi'))/T)*t)*(heaviside(t)-heaviside(t-T/2)) + sym(-0.00001)*(heaviside(t-T/2)-heaviside(t-T));

% Ingreso de N por el usuario
N = input('Ingrese la cantidad de coeficientes que desea calcular: ');

% C�lculo de la serie de Fourier con la funci�n FSERIE
[ak, yr] = FSERIE(y, T, N);

% Estado de hold graph desactivado
hold off;

% Gr�fico de yr(t)
gv = ezplot(yr(t),[0,1.5*double(T)]);

% Estado de hold graph activado
hold on;

simplify(yr(t), 'Step', 100);

str = sprintf('Ejercicio 1.4 con %d coeficientes', N);
title(str);

grid on;

xlabel('t');
ylabel('yr(t)');

%% << FIN DEL EJERCICIO 1.4 >>

disp('Final del ejercicio 1.4 Presione una tecla para continuar.');
system('PAUSE>NULL');

% Realizamos un salto de l�nea por cuesti�n est�tica
fprintf('\n');

% -------------------------------------------------------------------------

%% << INICIO DEL EJERCICIO 1.5 >>
disp('Ejercicio 1 - Grupo 6 - 1.5');

% Definimos las constantes simb�licas
n = 0:1:100;
k = -10:1:10;

% Definimos la se�al: Cuadrada, simetr�a par
x = (n >= 0 && n <= 4);
x = x * ((1/2).^(-n));

% Ingreso de N por el usuario
N = input('Ingrese la cantidad de coeficientes que desea calcular: ');

% C�lculo de la serie de Fourier con la funci�n FSERIED
ak = FSERIED(x, n, N, k);

% Estado de hold graph desactivado
hold off;

% Gr�fico de la magnitud
subplot(4,1,1);
stem(k,abs(ak));
xlim([-6, 6])
xlabel('k');
title('|ak|')
grid on;

% Gr�fico de la fase
subplot(4,1,2);
stem(k, angle(ak));
xlim([-6, 6])
xlabel('k');
title('arg(ak)');
grid on;

% << FIN DEL EJERCICIO 1.5 >>

disp('Final del ejercicio 1.5 Presione una tecla para continuar.');
system('PAUSE>NULL');

% Realizamos un salto de l�nea por cuesti�n est�tica
fprintf('\n');

