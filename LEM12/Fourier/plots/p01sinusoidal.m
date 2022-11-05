clear all; close all; clc;
Data = fopen('data/01sinusoidal');
Data = strrep(Data, ',', '.');
fid = fopen('data/01sinusoidal', 'r');
fwrite(fid, Data, "char");

