% demonstrate  the Filter_1.m 
 Img1 = imread('D:\桌面\大三上\数字图像处理\数字图像处理-实验\jobs\cameraman.tif'); 
 Img2 = imread('D:\桌面\大三上\数字图像处理\数字图像处理-实验\jobs\rice.png'); 
 
I2 = Filter_1(Img1, 0, 0);        %图像1的maxsobel 
I3 = Filter_1(Img1, 0, 1);        %图像1的sumsobel 
I4 = Filter_1(Img1, 1, 0);        %图像1的maxkirsch 
 
I5 = Filter_1(Img2, 0, 0);        %图像2的maxsobel 
I6 = Filter_1(Img2, 0, 1);        %图像2的sumsobel 
I7 = Filter_1(Img2, 1, 0);        %图像2的maxkirsch 
 
select=input('选择一张图片展示\n0、cameraman     1、rice\n'); 
if select == 0 
    while 1 
        select2=input('选择格式\n0、原图 1、maxsobel 2、sumsobel 3、maxFirsch 4、都显示 5、退出\n'); 
        if select2 == 0 
            figure;imshow(Img1);  title('原图'); 
        end 
        if select2 == 1 
            figure;imshow(I2);   title('maxsobel');end 
        if select2 == 2 
            figure;imshow(I3);   title('sumsobel');end 
        if select2 == 3 
            figure;imshow(I4);   title('maxkirsch');end 
        if select2 == 4 
            figure; 
            imshow(Img1);  title('原图'); 
            figure; 
            imshow(I2);   title('maxsobel'); 
            figure; 
            imshow(I3);   title('sumsobel'); 
            figure; 
            imshow(I4);   title('maxkirsch'); 
        end 
        if select2 == 5 
            break; 
        end 
    end 
else 
    figure; 
    subplot(2,2,1); imshow(Img2);  title('原图'); 
    subplot(2,2,2); imshow(I5);   title('maxsobel'); 
    subplot(2,2,3); imshow(I6);   title('sumsobel'); 
    subplot(2,2,4); imshow(I7);   title('maxkirsch'); 
end 

