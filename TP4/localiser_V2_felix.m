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
% localiser.m
%
%%
clc
clear all
%%README

%Pour la boucle, on peut utiliser la méthode size(A, dim), donc peut
%importe la matrice donnée, on obtient la grandeur de celle-ci.
%https://www.mathworks.com/help/matlab/ref/size.html

%Partie Re et Im
%https://www.mathworks.com/help/matlab/ref/imag.html
%https://www.mathworks.com/help/matlab/ref/real.html

% Pour ajouter à la précision, On pourrait faire les cerlces p/r aux
% colonnes, puisque les valeurs propres de A' sont aussi des valeurs
% propres de A.

% Je ne pense pas que les intérvalles imaginaires ont rapport
%% Problème 2 – Méthode numérique de la puissance inverse décalée

% A = [0	 1	 0	  0;
%      2	 5	 0	  0;
%     0.5	 0	 3	 0.5;
%      0	 0	0.75  7];

A = xlsread("Matrice_A.xlsx"); % $$ MOD: read from xls file $
disp("Matrice A:")
disp(A)

%% PARTIE I
%% (1)

figure('name', 'Figure 1')

for i = 1:4 %on peut utiliser size(A,1) pour la borne max.
    x = real(A(i,i)); %centre réel
    y = imag(A(i,i)); %centre imaginaire
    r = 0;
    for j = 1:4
        if i ~= j %symbole matlab ~ pas !
            r = r + norm(A(i,j)); %rayon du cercle sans l'élément de centre
            %il faut utiliser la récursion, sinon on additionne par les
            %normes, on obtient des rayons de 0(dernier éléments).
            
        end
    end
                   
    w = (0:300)*2*pi/300;         %liste de 300 points (avec 6 on obtient des pentagones ouverts et ensuite on redivise.
    plot(r*cos(w)+x, r*sin(w)+y); %dessiner un cercle autour du centre
    hold on;
    plot(x, y,'*');               %dessiner les centres des cercles
end

axis equal
title('Disques centrés seuls de Gerschgorin')
xlabel('Re') 
ylabel('Im') 
grid on
grid minor
hold off;  
saveas(gcf,'Disques_Gerschgorin_1.jpg')
saveas(gcf,'Disques_Gerschgorin_1')

%% (2)

% Bien justifier les bornes pour chaque valeur propre.!!!!



%commentaire de justification
P1_2 = 'comparaison avec utilisation du \n';
fprintf(P1_2);

disp("lambda1 est contenu dans l'intervalle réel [-1, 1]")
disp("lambda1 est contenu dans l'intervalle imaginaire [-1, 1]")

disp("lambda2 est contenu dans l'intervalle réel [3, 7]")
disp("lambda2 est contenu dans l'intervalle imaginaire [-2, 2]")

disp("lambda3 est contenu dans l'intervalle réel [2, 4]")
disp("lambda3 est contenu dans l'intervalle imaginaire [-1, 1]")

disp("lambda4 est contenu dans l'intervalle réel [6.25, 7.75]")
disp("lambda4 est contenu dans l'intervalle imaginaire [-0.75, 0.75]")




