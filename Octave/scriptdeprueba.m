clear all;
clc;
valores_locos = 5 + round( rand(5) * 100 ) / 10 / 2; # Genera 25 valores aleatorios entre el 5 y el 10
[x,y] = size(valores_locos);
k = 1;
for i = 1:x
  for j = 1:y
    valores_locos_2(k) = valores_locos(i,j) * rand(1); # Los multiplica por otro número entre 0 y 1
    k++;
  endfor
endfor
valores_locos_2
bins = [0:9];
hist(valores_locos_2, bins, "facecolor", [0.402 0.3 0.75], "edgecolor", [0.001 0.001 0.1],"linewidth",1.5);
colormap(winter())