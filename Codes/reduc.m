%----------------------------------------------------------%
%-- FONCTION REDUC --%
%   Calcul la moyenne de l'entrée pour l'approximation du laplacien
% 
%	In : 
% 	- U : Une matrice 
%
%	Out : 
% 	- V : la matrice pondéré
% 	
%	Auteurs : 
% 	- Timothée Schmoderer
%	- Emeric Quesnel
%
%	INSA de Rouen Normandie 2017	
%		
%----------------------------------------------------------%

function V = reduc(U)
    % Noyau de convolution
    s = (1/12)*[1 2 1;2 0 2;1 2 1];
    V = conv2(U,s,'same');
end
