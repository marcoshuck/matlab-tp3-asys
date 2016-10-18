%{ 
An�lisis de Se�ales y Sistemas - TP Laboratorio N� 3
Funci�n FTRANSF - Grupo 6

Argumentos:
    - y: Se�al de entrada
    - T0: Periodo elemtal
    - N: Cantidad de coeficientes a calcular (0 si es aperi�dica)
    - P: Se�al peri�dica (0) o aperi�dica (1)

Retorna:
    - Xabs: Magnitud de la se�al
    - Xarg: Fase de la se�al

Repositorio disponible en: https://github.com/marcoshuck/matlab-tp3-asys

Realizado por Huck Marcos A. y Castelluci Leandro E.
%}

function[Xabs, Xarg] = FTRANSF(x, T0, N, P)
    % Definici�n de variables
    syms t A w 'real';
    syms k 'integer';
    
    % Definici�n de w0
    w0 = sym(2*pi/T0);
    
    % Definici�n de alfa
    alfa=2*pi/T0/100;
    
    % Definici�n de la delta
    DIRAC(w)=(1/alfa)*(w + alfa)*(heaviside(w + alfa) - heaviside(w));
    DIRAC(w)=DIRAC(w) + (-1/alfa)*(w - alfa)*(heaviside(w)-heaviside(w-alfa));
    
    if P == 0
         % Integral para obtener la expresi�n general de los coeficientes de Fourier
        ak(k) = 1/T0 * int(x(t).*exp(-1j*w0*k*t), t, 0, T0);

        % Simplificaci�n de ak(k)
        ak(k) = simplify(ak(k));

        % Descomposici�n de numerador y denominador
        [n, d] = numden(ak);
        
        k = 0;
        if isnan( eval(ak) );
            a=1/T0*int( x(t),t,0,T0);
        else
            a=ak(k);
        end
        
        Xabs(w)=abs(eval(2*pi*a)).*DIRAC(w);
        Xarg(w)=angle(eval(2*pi*a)).*DIRAC(w);
        
        for k=1:N
            if ((n(k) == 0) && (d(k) == 0))
                a = 1/T0 * int(x(t).*exp(-1j*w0*k*t), t, 0, T0);
            else
                a=ak(k);
            end
            Xabs(w) = Xabs(w) + abs(eval(conj(2*pi*a))).*DIRAC(w + eval(k*w0));
            Xabs(w) = Xabs(w) + abs(eval(2*pi*a)) .*DIRAC(w - eval(k*w0));
            
            Xarg(w) = Xarg(w) + angle(eval(conj(2*pi*a))).*DIRAC(w + eval(k*w0));
            Xarg(w) = Xarg(w) + angle(eval(2*pi*a)) .*DIRAC(w - eval(k*w0));
        end
    elseif P == 1
        X(w) = int(x(t).*exp(-1j*w*t), t, -T0, T0);
        X(w) = limit(simplify(X(w), 'Step' , 2000), T0, inf);
        Xabs(w) = abs(X(w));
        Xarg(w) = atan(imag(X(w))/real(X(w)));
    else
        disp('FATAL ERROR: FTRANSF(x, T0, N, P) con P invalido');
    end
end