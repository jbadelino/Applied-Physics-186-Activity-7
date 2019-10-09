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


//gaussian distribution - red
mu_r = mean(r_ROI);
sigma_r = stdev(r_ROI);
p_r_ROI = (1/(sigma_r*sqrt(2*%pi)))*exp(-((r-mu_r).^2/(2*sigma_r.^2)));

//gaussian distribution - green
mu_g = mean(g_ROI);
sigma_g = stdev(g_ROI);
p_g_ROI = (1/(sigma_g*sqrt(2*%pi)))*exp(-((g-mu_g).^2/(2*sigma_g.^2)));

jp_ROI = p_r_ROI.*p_g_ROI; //joint probability

imshow(jp_ROI);
imwrite(jp_ROI, "C:\Users\Asus\Documents\Applied Physics 186\act 7\cancerPS.jpg");
