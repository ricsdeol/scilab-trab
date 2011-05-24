//Alunos: Ricardo S. O. Leite ;
//        Guilherme Fernando Ferreira;
//Professor: Will
//Trabalho: processamento de uma lista de chamadas
//Lingagem: Scilab ( v5.3 ) utilizando SIVP (v0.5.3-3)

imgSrc=imread('./img/source.jpg');
imgSrc=rgb2gray(imgSrc);
[r_imgSrc c_imgSrc]=size(imgSrc);

img0=imread('./img/0.jpg');
img0=rgb2gray(img0);
[r_img0 c_img0]=size(img0);

img1=imread('./img/1.jpg');
img1=rgb2gray(img1);
[r_img1 c_img1]=size(img1);

img2=imread('./img/2.jpg');
img2=rgb2gray(img2);
[r_img2 c_img2]=size(img2);

img3=imread('./img/3.jpg');
img3=rgb2gray(img3);
[r_img3 c_img3]=size(img3);

img4=imread('./img/4.jpg');
img4=rgb2gray(img4);
[r_img4 c_img4]=size(img4);

img5=imread('./img/5.jpg');
img5=rgb2gray(img5);
[r_img5 c_img5]=size(img5);

img6=imread('./img/6.jpg');
img6=rgb2gray(img6);
[r_img6 c_img6]=size(img6);

img7=imread('./img/7.jpg');
img7=rgb2gray(img7);
[r_img7 c_img7]=size(img7);

img8=imread('./img/8.jpg');
img8=rgb2gray(img8);
[r_img8 c_img8]=size(img8);

img9=imread('./img/9.jpg');
img9=rgb2gray(img9);
[r_img9 c_img9]=size(img9);

//Retorna se a imgBase ( somente a região de comparação com tamanho igual a imgTemplete) com imgTamplate
function diffImg=diffImage(imgBase, imgTemplate)
    fatorDiferenca = 50;
    porcetagemIgualdade = 0.8; 
    
    subM = imgBase - imgTemplate;
    
    imgDiff = subM < fatorDiferenca;
    
    [r, c]=size(imgDiff);
    
    if length(find(imgDiff)) > r*c*porcetagemIgualdade then
        diffImg = 255;
    else
        diffImg = 0;
    end 

endfunction

function [imgResultadoBusca]=searchImg(imgBase, imgTemplate)
    [r_imgBase c_imgBase]=size(imgBase);
    [r_imgTemplate c_imgTemplate]=size(imgTemplate);
    
    r_finalImgBase= r_imgBase - r_imgTemplate;
    c_finalImgBase= c_imgBase - c_imgTemplate;
    
    imgResultadoBusca=zeros(r_finalImgBase,c_finalImgBase);

    for i= 1:r_finalImgBase
        for j=1:c_finalImgBase
           imgResultadoBusca(i,j)=diffImage( imgBase(i:r_imgTemplate+i-1,j:c_imgTemplate+j-1), imgTemplate);
        end
    end
endfunction

img = searchImg(imgSrc,img0);
disp(img);

//r_finalImgSrc = r_imgSrc - r_img0;
//c_finalImgSrc = c_imgSrc - c_img0;

//imgResultadoBusca=zeros(r_finalImgSrc,c_finalImgSrc);

//for i= 1:r_finalImgSrc
//    for j=1:c_finalImgSrc
//        diffImage( imgSrc(i:r_img0+i-1,j:c_img0+j-1), img0);
//    end
//end