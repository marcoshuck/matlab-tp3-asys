%{ 
An�lisis de Se�ales y Sistemas - TP Laboratorio N� 3
Funci�n FTRANSFD - Grupo 6

Argumentos:
    - x: Se�al de entrada
    - n: Variable independiente
    - w: Frecuencia angular

Retorna:
    - Xabs: Magnitud de la se�al
    - Xarg: Fase de la se�al

Repositorio disponible en: https://github.com/marcoshuck/matlab-tp3-asys

Realizado por Huck Marcos A. y Castelluci Leandro E.
%}

function[Xabs, Xarg] = FTRANSFD(x, n, w)
    fi = exp(-1i*n);
    for p=1:length(w)
        Xw(p) = sum(x.*(fi.^w(p)));
    end
    Xabs = abs(Xw);
    Xarg = angle(Xw);
end