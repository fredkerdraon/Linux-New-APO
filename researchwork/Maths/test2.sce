-----------------------------------------------------------------------------------------
t = (8:14);
a = gca();
// Set the x-axis limits to the first and last element of t
a.tight_limits = "on";
a.data_bounds(:, 1) = t([1 $]);
// Set the ticks and format the labels
a.x_ticks = tlist(["ticks","locations","labels"], ...
   t, msprintf("%02i:00\n", t));

Jour=" Aujourd"'hui, nous sommes le : " ;
save("Exemple2",Jour) ;// On sauve Jour dans le fichier Exemple2
clr() ; On efface la memoire temporaire
load("Exemple2") ;// On charge le fichier
disp(Jour + date())

-----------------------------------------------------------------------------------------