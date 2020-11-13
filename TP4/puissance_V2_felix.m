%
% TP 4
% ÉQUIPE 22
%
% NOM : Couillard, Charles-Émile
% COURRIEL : charles-emile.couillard.1@ulaval.ca
%
% NOM : Cloutier-Asselin, Félix
% COURRIEL : felix.cloutier-asselin.1@ulaval.ca
%
% MAT-2930 Algèbre linéaire appliquée
% Automne 2020
%
% puissance.m
%
%%
clc, clear

NBR_ITER_MAX = 100;

%% Partie II

%% 3 (méthode itérative de la puissance inverse décalée)


% On doit donc utilisé chaque centre des rayons trouvé dans la partie 1. 
% lambda1 est contenu dans l'intervalle réel [-1, 1]
% lambda1 est contenu dans l'intervalle imaginaire [-1, 1]
% lambda2 est contenu dans l'intervalle réel [3, 7]
% lambda2 est contenu dans l'intervalle imaginaire [-2, 2]
% lambda3 est contenu dans l'intervalle réel [2, 4]
% lambda3 est contenu dans l'intervalle imaginaire [-1, 1]
% lambda4 est contenu dans l'intervalle réel [6.25, 7.75]
% lambda4 est contenu dans l'intervalle imaginaire [-0.75, 0.75]


% ------------------

%Soit la matrice carré A:

A = xlsread("Matrice_A.xlsx")

% de grandeur n x n
[n,~] = size(A);

% et soit "a" les valeurs prochent des lamba qu'on cherche
% (trouvé dans la partie I)

a = [0 5 3 7];

% -> on sait  que 1/(lambda - a) est valeur propre de (A-lambda*I)^-1
% -> On fait la méthode de la puissance inverse pour trouver 1/(lambda - a)
% -> Pour l'inverse, on peut simplement résoudre A*x(k) = y(k-1) au lieu de
%   calculer x(k)=(A^-1)*y-1


% On fera le prochain algorithme pour tous les ai
% et les lambda seront stocké dans

lambda = [];

for ai = a
    
    % On doit poser un vecteur x0 avec n'importe quel valeurs, 
    %           mais dont la plus grande valeur est égale à 1 :

    x0 = ones(n,1);

    % On prend la valeur la plus petite du vecteur (mk)
    
    %%%% SI on prend la plus petite valeur : pour les "a" plus petit, on arrive
    %%%% exactement à ce que eig(A) nous donne, mais pour les "a" plus
    %%%% grand, les valeurs propres diverge ou sont érroné. 
    %%%% Si on prends la plus grande valeur absolue, on arrive à exactement
    %%%% à ce que eig(A) nous donnes pour les grandes valeurs de a, mais une
    %%%% diférence pour les plus petites

    m0 = abs(max(x0));

    %et on normalise le vecteur avec cette valeur

    y0 = x0/m0;

    % On fait le calcul des prochaines valeurs par itération

    for k=1:NBR_ITER_MAX
        %On résoue avec élimination de gauss
        Gauss = rref([A-ai*eye(n) y0]);
        % la solution(dernière colonne) est notre prochain xk
        xk = Gauss(:,n+1);
        % On prend plus petite valeur
        mk = max(abs(xk));
        %et on normalise
        yk = xk./mk;
        % On vérifie si mk converge
        if abs(m0-mk) < 0.001
            break
        % si non, on met à jour les dernieres valeurs
        else
            m0 = mk;
            y0 = yk;
        end




    end

    %après l'itération on obtient un mk dont la valeur la plus petite tend
    %vers une valeur propre de 1/(lambda - a) et le vecteur propre yk associé

    % On peut maintenant trouvé lambda le plus près du "ai"

    lambda_i = 1/mk + ai;
    
    lambda = [lambda ;lambda_i];
end

% On obtient tous les valeurs propre lambda pour chaque "a" trouvé

lam_a = sort([lambda a'])


%% 4

openfig("Disques_Gerschgorin_1.fig")
hold on
for points = lam_a(:,1)
    plot(points, 0,"o")
end



%% 5
lam_ML = eig(A);
disp("[ par itération | par eig(A) ]")
Resultats = [lam_a(:,1) lam_ML];
disp(Resultats)

