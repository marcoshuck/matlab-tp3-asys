%{ 
Análisis de Señales y Sistemas - TP Laboratorio Nº 3
Función FSERIE - Grupo 6

Argumentos:
    - y: Señal de entrada
    - T: Periodo elemental
    - N: Cantidad de coeficientes a calcular

Retorna:
    - yR: Señal resultante

Repositorio disponible en: https://github.com/marcoshuck/matlab-tp3-asys

Realizado por Huck Marcos A. y Castelluci Leandro E.
%}

function[ak, yr] = FSERIE(y, T, N)
    syms t 'real';
    syms k 'integer';
    
    % Integral para obtener la expresión general de los coeficientes de Fourier
    ak(k) = 1/T * int(y(t).*exp(-1j*2*pi/T*k*t), t, 0, T);

    % Simplificación de ak(k)
    ak(k) = simplify(ak(k));

    % Definición de vector de aN
    aN = sym(zeros(2*N+1, 1));

    % Descomposición de numerador y denominador
    [n, d] = numden(ak);

    % Cálculo de los coeficientes de Fourier
    for k = 0:N
        if (n(k) == 0) && (d(k) == 0)
            aN(k+1) = 1/T * int(y(t), t, 0, T);
        else
            aN(k+1) = ak(k);
        end
    end

    % Cálculo de la serie de Fourier
    m = 1;
    yr(t) = aN(m);
    for m = 2:N
        if aN(m) ~= sym(0)
            yr(t) = yr(t) + conj(aN(m))*exp(- 1j*(m-1)*2*pi/T*t) ;
            yr(t) = yr(t) + aN(m)*exp(1j*(m-1)*2*pi/T*t);
        end
    end
end