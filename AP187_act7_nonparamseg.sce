stacksize("max");
img = double(imread('C:\Users\Asus\Documents\Applied Physics 186\act 7\cancer.jpg'));
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

//chromaticity coordinates
I = R+G+B;
I(find(I==0))=100000;
r = R./I; //red NCC
g = G./I;//green NCC 
b = B./I; //blue NCC

//ROI
ROI = double(imread('C:\Users\Asus\Documents\Applied Physics 186\act 7\cancerROI.jpg')) 
R_ROI = ROI(:,:,1); //red component 
G_ROI = ROI(:,:,2); //green component
B_ROI = ROI(:,:,3); // blue component 
I_ROI = R_ROI + G_ROI + B_ROI; 
I_ROI(find(I_ROI==0))=100000;
r_ROI = R_ROI./I_ROI; //red NCC
g_ROI = G_ROI./I_ROI;//green NCC 


//histogram 
BINS = 32; 
r_int = round(r_ROI*(BINS-1)+1);
g_int = round(g_ROI*(BINS-1)+1);
colors = g_int(:) + (r_int(:)-1)*BINS; 
hist = zeros(BINS, BINS);
for row = 1:BINS
    for col = 1:(BINS-row+1)
        hist(row,col) = length(find(colors == (((col+(row-1)*BINS)))));
    end;
end;
imwrite(hist,'C:\Users\Asus\Documents\Applied Physics 186\act 7\hist_cancer.jpg' )

//backprojection 
imsize = size(img);
NPS_ROI = zeros(imsize(1), imsize(2));
for i=1:imsize(1)
    for j=1:imsize(2)
        r_new = round(r(i,j)*(BINS-1) +1);
        g_new = round(g(i,j)*(BINS-1) +1);
        NPS_ROI(i,j) = hist(r_new, g_new);
    end;
end;

imshow(NPS_ROI);
imwrite(NPS_ROI, 'C:\Users\Asus\Documents\Applied Physics 186\act 7\cancerNPS.jpg' )
