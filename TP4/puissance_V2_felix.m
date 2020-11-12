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

%% Partie II

%% 3 (méthode itérative de la puissance inverse décalée)

A = xlsread("Matrice_A.xlsx")

% lambda1 est contenu dans l'intervalle réel [-1, 1]
% lambda1 est contenu dans l'intervalle imaginaire [-1, 1]
% lambda2 est contenu dans l'intervalle réel [3, 7]
% lambda2 est contenu dans l'intervalle imaginaire [-2, 2]
% lambda3 est contenu dans l'intervalle réel [2, 4]
% lambda3 est contenu dans l'intervalle imaginaire [-1, 1]
% lambda4 est contenu dans l'intervalle réel [6.25, 7.75]
% lambda4 est contenu dans l'intervalle imaginaire [-0.75, 0.75]


% 
% Il faut commencer avec A-a*eye(4) (A-aI). On applique la méthode et on va
% trouver la valeur propre la plus proche de a. On doit donc utilisé chaque
% centre des rayons trouvé dans la partie 1. 


%% 4

%% 5
eig(A)


