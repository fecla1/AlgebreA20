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
% classement.m
%
%%
clc
clear all
%%README
%- il faudrait vérifier si une mise en page est possible pour les
%classements finaux avec les scores de chaque équipe et le nom de la bonne 
%équipe à côté
%- vérifier le PDF sur les clarifications
%- pour d,e,f vérifier si on cherche le différentiel ou les points marqués
%en soustrayant les points accordés
%% Problème 1 – Classement des équipes d’un championnat de football

%% Tableau des points marqués Sij

Sij = [ 0	14	3	17	24	0	35	2;
        7	0	14	31	45	2	29	28;
        7	31	0	42	7	17	7	34;
        12	10	34	0	20	31	12	14;
        27	28	35	27	0	14	15	20;
        3	24	41	7	41	0	13	35;
        38	23	27	13	31	17	0	49;
        3	16	30	14	13	8	35	0 ];

%Sij = xlsread("Scores_Sij.xlsx"); % $$ MOD: read from xls file $$
disp("Matrice Sij :")
disp(Sij)

S = Sij;

%% Méthode de classement 1
disp("Méthode de classement 1") % $ MOD : Ajout sections dans la console $
disp(" ")
%% (a)

R = zeros(8,8); % matrice des Parties gagnés
% C* = []
C = [zeros(8,1) [1:8]']; % variables de Classement(nbrs de parties gagnées)
                % $$ MOD : pré allocation de la mémoire
                % +
                % Uilisation d'une matrice double [score num.equipe] $$
for i = 1:8
    for j = 1:8
        if S(i,j) > S(j,i)
            R(i,j) = 1;
        else
            R(i,j) = 0;
        end
    end
tot = sum(R(i,:));
% C* = [C* tot]
C(i,1) = tot; % $$ MOD : pré allocation de la mémoire $$
end

disp("Variables de classement (Col 1) par equipe (Col 2)")
disp(C)

%% (b)
% Cs* = sort(C, 'descend');
Cs = sortrows(C, "descend"); % $$ MOD Utilisations de "sortrows" pour 
                             % classé et garder le numéro d'équipe 
disp("Classement des valeurs xi de la plus grande à la plus faible")
disp(Cs)

%% (c)
disp('Résultas')
for i = 1:8
    score = Cs(i,1);
    equipe = Cs(i,2);
    
    formatSpec = "Équipe %i | Parties gagnées: %i"; % MOD: Parties gagnés 
                                                    % Plus logique que
                                                    % scores
    disp(sprintf(formatSpec, equipe, score))
end

% disp('  ')
% disp('Les variables de classement')
% disp(Cs')

% $$MOD :Le display des variables de classement devient un peu inutile non?

%% Méthode de classement 2 
%% (d)
disp(" ")
disp("Méthode de classement 2") % $ MOD : Ajout sections dans la console $
disp(" ")

R2 = zeros(8,8); % matrice des Points marqués
%C2* = [];
C2 = [zeros(8,1) [1:8]'];   % [var. de Class (Pts Marqués) | Num. Équipe)
                        % $$ MOD : pré allocation de la mémoire
                      % +
                  %Uilisation d'une matrice double [score | num.equipe] $$
for i = 1:8
    for j = 1:8
        if i ~= j
            R2(i,j) = S(i,j)/(S(i,j)+S(j,i));
        else
            R2(i,j) = 0;
        end
    end
tot2 = sum(R2(i,:));
%C2* = [C2, tot2];
C2(i,1) = tot2; % $$ MOD : Pour matrice double $$%
end

disp("Variables de classement (Col 1) par equipe (Col 2)")
disp(C2)

%% (e)
%Cs2* = sort(C2, 'descend');
Cs2 = sortrows(C2, "descend");

disp("Classement des valeurs xi de la plus grande à la plus faible")
disp(Cs2)

%% (f)
disp('Résultas')
for i = 1:8
    score2 = Cs2(i,1);
    equipe2 = Cs2(i,2); % $$MOD pour garder classement avec num.equipe$$
    formatSpec = "Équipe %d | Points marqués: %f"; % $$ MOD : Plus logique
                                                   % que score
    disp(sprintf(formatSpec, equipe2, score2))
end

% disp('  ')
% disp('Les variables de classement')
% disp(Cs2')

% $$MOD: Devient un peu inutile$$




