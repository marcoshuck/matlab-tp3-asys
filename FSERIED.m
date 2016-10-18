%{ 
Análisis de Señales y Sistemas - TP Laboratorio Nº 3
Función FSERIED - Grupo 6

Argumentos:
    - x: Señal de entrada
    - n: Variable independiente
    - N: Cantidad de coeficientes a calcular
    - k: Cantidad de coeficientes a calcular

Retorna:
    - ak: Coeficientes de Fourier

Repositorio disponible en: https://github.com/marcoshuck/matlab-tp3-asys

Realizado por Huck Marcos A. y Castelluci Leandro E.
%}

function[ak] = FSERIED(x, n, N, k)
    fi = exp(-1i*n*2*pi/N);
    for p=1:length(k)
        ak(p) = 1/N * sum(x.*(fi.^k(p)));
    end
end