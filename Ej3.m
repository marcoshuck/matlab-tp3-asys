% -------------------------------------------------------------------------
%{ 
An�lisis de Se�ales y Sistemas - TP Laboratorio N� 3
Ejercicio 3 - Grupo 6

Repositorio disponible en: https://github.com/marcoshuck/matlab-tp3-asys

Realizado por Huck Marcos A. y Castelluci Leandro E.
%}
% -------------------------------------------------------------------------
% Borramos todas las variables del workspace
clear all;
% Borramos los outputs e inputs de la ventana de comandos
clc;

% Inicializaci�n de variables y constantes
syms t w 'real';
syms A T;

% -------------------------------------------------------------------------

%% << INICIO DEL EJERCICIO 3.1 (senoidal) >>
disp('Ejercicio 3 - Grupo 6 - 3.1 (senoidal)');

% Definimos las constantes simb�licas
T=sym(pi/20);
A=sym(150);

% Definimos la se�al
x(t) = A*sin(((2*sym('pi'))/T)*t) + A;

% C�lculo de la transformada de Fourier con la funci�n FTRANSF
[Xabs, Xarg] = FTRANSF(x, T, 4, 0);

subplot(3,1,1);
ezplot( x(t) ,[-double(T),double(T)])
xlabel('t')
title('x(t)')
grid on;

subplot(3,1,2);
ezplot( Xabs(w) ,[-double(4*((2*pi)/T)), double(4*((2*pi)/T))])
xlabel('iw')
title('|X(iw)|')
grid on;

subplot(3,1,3);
ezplot( Xarg(w) ,[-double(4*((2*pi)/T)), double(4*((2*pi)/T))])
xlabel('iw')
title('arg(X(iw))')
grid on;

%% << FIN DEL EJERCICIO 3.1 (senoidal) >>

disp('Final del ejercicio 3.1 (senoidal). Presione una tecla para continuar.');
system('PAUSE>NULL');

% Realizamos un salto de l�nea por cuesti�n est�tica
fprintf('\n');

% -------------------------------------------------------------------------

%% << INICIO DEL EJERCICIO 3.1 (cuadrada) >>
disp('Ejercicio 3 - Grupo 6 - 3.1 (cuadrada)');

% Definimos las constantes simb�licas
T=sym(pi/20);
A=sym(150);

% Definimos la se�al
x(t) = (A*(heaviside(t)-heaviside(t-T/2)) - A*(heaviside(t-T/2)-heaviside(t-T))) + A;

% C�lculo de la transformada de Fourier con la funci�n FTRANSF
[Xabs, Xarg] = FTRANSF(x, T, 4, 0);

subplot(3,1,1);
ezplot( x(t) ,[-double(T),double(T)])
xlabel('t')
title('x(t)')
grid on;

subplot(3,1,2);
ezplot( Xabs(w) ,[-double(4*((2*pi)/T)), double(4*((2*pi)/T))])
xlabel('iw')
title('|X(iw)|')
grid on;

subplot(3,1,3);
ezplot( Xarg(w) ,[-double(4*((2*pi)/T)), double(4*((2*pi)/T))])
xlabel('iw')
title('arg(X(iw))')
grid on;

%% << FIN DEL EJERCICIO 3.1 (cuadrada) >>

disp('Final del ejercicio 3.1 (cuadrada). Presione una tecla para continuar.');
system('PAUSE>NULL');

% Realizamos un salto de l�nea por cuesti�n est�tica
fprintf('\n');

% -------------------------------------------------------------------------

%% << INICIO DEL EJERCICIO 3.1 (triangular) >>
disp('Ejercicio 3 - Grupo 6 - 3.1 (triangular) - Con error, cancelando ejecuci�n');

% Definimos las constantes simb�licas
T=sym(pi/20);
A=sym(150);

% Definimos la se�al
x(t) = ((A/T/2)*t*(heaviside(t)-heaviside(t-T/2)) + (A/T/2)*t*(heaviside(t-T/2)-heaviside(t-T))) + A;

% C�lculo de la transformada de Fourier con la funci�n FTRANSF

%{
    Error using symengine
    Division by zero.

    Error in sym/subs>mupadsubs (line 140)
    G = mupadmex('symobj::fullsubs',F.s,X2,Y2);

    Error in sym/subs (line 125)
        G = mupadsubs(F,X,Y);

    Error in symfun/feval>evalScalarFun (line 42)
    y = subs(formula(Ffun), Fvars, inds);

    Error in symfun/feval (line 28)
        varargout{1} = evalScalarFun(F, Fvars, varargin);

    Error in symfun/subsref (line 175)
                    B = feval(A,inds{:});

    Error in FTRANSF (line 52)
                    a=ak(k);

    Error in TPL3_Ej3_Grupo6 (line 115)
    [Xabs, Xarg] = FTRANSF(x, T, 4, 0);
%}

%{ 
[Xabs, Xarg] = FTRANSF(x, T, 4, 0);

subplot(3,1,1);
ezplot( x(t) ,[-double(T),double(T)])
xlabel('t')
title('x(t)')
grid on;

subplot(3,1,2);
ezplot( Xabs(w) ,[-double(4*((2*pi)/T)), double(4*((2*pi)/T))])
xlabel('iw')
title('|X(iw)|')
grid on;

subplot(3,1,3);
ezplot( Xarg(w) ,[-double(4*((2*pi)/T)), double(4*((2*pi)/T))])
xlabel('iw')
title('arg(X(iw))')
grid on;

%}
%% << FIN DEL EJERCICIO 3.1 (triangular) >>

disp('Final del ejercicio 3.1 (triangular). Presione una tecla para continuar.');
system('PAUSE>NULL');

% Realizamos un salto de l�nea por cuesti�n est�tica
fprintf('\n');

% -------------------------------------------------------------------------

%% << INICIO DEL EJERCICIO 3.2 >>
disp('Ejercicio 3 - Grupo 6 - 3.2');

% Definimos las constantes simb�licas
syms T 'real';

% Definimos la se�al
x(t) = exp(-7*t)*heaviside(t);

% C�lculo de la transformada de Fourier con la funci�n FTRANSF
[Xabs, Xarg] = FTRANSF(x, T, 0, 1);

subplot(3,1,1);
ezplot( x(t) ,[-10,10])
xlabel('t')
title('x(t)')
grid on;

subplot(3,1,2);
ezplot( Xabs(w) ,[-10,10])
xlabel('iw')
title('|X(iw)|')
grid on;

subplot(3,1,3);
ezplot( Xarg(w) ,[-10,10])
xlabel('iw')
title('arg(X(iw))')
grid on;


%% << FIN DEL EJERCICIO 3.2 >>

disp('Final del ejercicio 3.2 Presione una tecla para continuar.');
system('PAUSE>NULL');

% Realizamos un salto de l�nea por cuesti�n est�tica
fprintf('\n');

clear T w Xabs Xarg;

clf;

% -------------------------------------------------------------------------

%% << INICIO DEL EJERCICIO 3.3 >>
disp('Ejercicio 3 - Grupo 6 - 3.3');

n=-100:1:100;
x=(1/2).^(-7*n);
w=-2*pi:0.01:2*pi;

% Definimos las constantes simb�licas
T=sym(pi/40);

% C�lculo de la transformada de Fourier con FTRANSFD
[Xabs, Xarg] = FTRANSFD(x, n, w);

subplot(4,1,1);
plot(w,Xabs);
xlim([-2*pi,2*pi]);
xlabel('w(rad/s)');
title('|Xw|')
grid on;

subplot(4,1,2);
plot(w,Xarg);
xlim([-2*pi,2*pi]);
xlabel('w(rad/s)');
title('arg(Xw)');
grid on;

%% << FIN DEL EJERCICIO 3.3 >>

disp('Final del ejercicio 3.3 Presione una tecla para continuar.');
system('PAUSE>NULL');

% Realizamos un salto de l�nea por cuesti�n est�tica
fprintf('\n');

% -------------------------------------------------------------------------