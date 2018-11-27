function [coverience,nor_Rank] = getGNMcovariance(pdb_ca,GNMValues)
[gnmEigVector]=getGNM(pdb_ca);
division_eig = 1./GNMValues;
cov_matrix = gnmEigVector*diag(division_eig)*transpose(gnmEigVector);
cov_matrix = abs(cov_matrix);
coverience = diag(cov_matrix);
[~, ~, ranking] = unique(coverience);
reverseRank = max(ranking) - ranking  + 1;
nor_Rank = 1-(reverseRank./length(pdb_ca));