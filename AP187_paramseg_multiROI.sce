stacksize("max");
img = double(imread('C:\Users\Asus\Documents\Applied Physics 186\act 7\ppg.jpg'));
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

//chromaticity coordinates
I = R+G+B;
I(find(I==0))=100000;
r = R./I; //red NCC
g = G./I;//green NCC 
b = B./I; //blue NCC


//tri-colored ROIs

//ROI1
ROI1 = double(imread('C:\Users\Asus\Documents\Applied Physics 186\act 7\orangeROI.jpg'))
R_ROI1 = ROI1(:,:,1); //red component 
G_ROI1= ROI1(:,:,2); //green component
B_ROI1 = ROI1(:,:,3); // blue component 
I_ROI1 = R_ROI1+ G_ROI1 + B_ROI1; 
I_ROI1(find(I_ROI1==0))=100000;
r_ROI1 = R_ROI1./I_ROI1; //red NCC
g_ROI1 = G_ROI1./I_ROI1;//green NCC 


//gaussian distribution - red
mu_r1 = mean(r_ROI1);
sigma_r1 = stdev(r_ROI1);
p_r_ROI1 = (1/(sigma_r1*sqrt(2*%pi)))*exp(-((r-mu_r1).^2/(2*sigma_r1.^2)));

//gaussian distribution - green
mu_g1 = mean(g_ROI1);
sigma_g1 = stdev(g_ROI1);
p_g_ROI1 = (1/(sigma_g1*sqrt(2*%pi)))*exp(-((g-mu_g1).^2/(2*sigma_g1.^2)));

//ROI2
ROI2 = double(imread('C:\Users\Asus\Documents\Applied Physics 186\act 7\redROI.jpg'))
R_ROI2 = ROI2(:,:,1); //red component 
G_ROI2 = ROI2(:,:,2); //green component
B_ROI2 = ROI2(:,:,3); // blue component 
I_ROI2 = R_ROI2 + G_ROI2 + B_ROI2; 
I_ROI2(find(I_ROI2==0))=100000;
r_ROI2 = R_ROI2./I_ROI2; //red NCC
g_ROI2 = G_ROI2./I_ROI2;//green NCC 


//gaussian distribution - red
mu_r2 = mean(r_ROI2);
sigma_r2 = stdev(r_ROI2);
p_r_ROI2 = (1/(sigma_r2*sqrt(2*%pi)))*exp(-((r-mu_r2).^2/(2*sigma_r2.^2)));

//gaussian distribution - green
mu_g2= mean(g_ROI2);
sigma_g2 = stdev(g_ROI2);
p_g_ROI2 = (1/(sigma_g2*sqrt(2*%pi)))*exp(-((g-mu_g2).^2/(2*sigma_g2.^2)));

//ROI3
ROI3 = double(imread('C:\Users\Asus\Documents\Applied Physics 186\act 7\yellowROI.jpg'))
R_ROI3 = ROI3(:,:,1); //red component 
G_ROI3 = ROI3(:,:,2); //green component
B_ROI3 = ROI3(:,:,3); // blue component 
I_ROI3 = R_ROI3 + G_ROI3 + B_ROI3; 
I_ROI3(find(I_ROI3==0))=100000;
r_ROI3 = R_ROI3./I_ROI3; //red NCC
g_ROI3 = G_ROI3./I_ROI3;//green NCC 


//gaussian distribution - red
mu_r3 = mean(r_ROI3);
sigma_r3 = stdev(r_ROI3);
p_r_ROI3 = (1/(sigma_r3*sqrt(2*%pi)))*exp(-((r-mu_r3).^2/(2*sigma_r3.^2)));

//gaussian distribution - green
mu_g3 = mean(g_ROI3);
sigma_g3= stdev(g_ROI3);
p_g_ROI3 = (1/(sigma_g3*sqrt(2*%pi)))*exp(-((g-mu_g3).^2/(2*sigma_g3.^2)));

jp_ROI1 = (p_r_ROI1.*p_g_ROI1); //joint probability
jp_ROI2 = (p_r_ROI2.*p_g_ROI2);
jp_ROI3 = (p_r_ROI3.*p_g_ROI3);
jp_ROI = jp_ROI1 + jp_ROI2 + jp_ROI3;
imshow(jp_ROI);
imwrite(jp_ROI, "C:\Users\Asus\Documents\Applied Physics 186\act 7\oryPS.jpg");


