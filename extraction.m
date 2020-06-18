function [cov, w, h, latent, cir] = ekstrakcja(Image)
Im = rgb2gray(Image);
Im = double(Im)/255;
cov = sum(sum(Im>0.7));
%figure(); imshow(Im>0.7);
SE = [1 1];

[W,H] = nnmf(Im, 1);
w = sum(W);
h = sum(H);

[~, ~, latent] = pca(Im);
latent = sum(sum(latent));

%Im = Im>0.7;
%Im = (1/2)*(imdilate(Im,SE) + imerode(Im, SE) - 2*Im);
cir = 0; %double(sum(sum(Im)));
%figure(); imshow(Im, []);
