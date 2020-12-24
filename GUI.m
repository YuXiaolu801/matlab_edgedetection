clear,clc,close all
kuan=800;
gao=kuan/2;
pingmu = get(0,'screensize');
f=figure('menubar','none','numbertitle','off','name','图像处理菜单',...
    'position',[pingmu(3)/3 pingmu(4)/3 kuan gao]);
axes1=axes('Position',[0   0.5 0.4 0.4]);%相对于（0，0.5）的点，宽的0.5倍，高的0.5倍
axes2=axes('position',[0.5 0.5 0.4 0.4]);
axes3=axes('position',[0   0   0.4 0.4]);
axes4=axes('position',[0.5 0   0.4 0.4]);
wenjian = uimenu(f,'text','文件');
dakai   = uimenu(wenjian,'text','打开','callback', @(h,e)dakaick(h,e,axes1));%回调函数
daochu  = uimenu(wenjian,'text','导出','callback', @(h,e)daochuck(h,e,axes2));
% daochu  = uimenu(wenjian,'text','导出','callback', @(h,e)daochuck(h,e,axes3));%可选择导出的图片
% daochu  = uimenu(wenjian,'text','导出','callback', @(h,e)daochuck(h,e,axes4));
tuichu  = uimenu(wenjian,'text','退出','callback','clear,clc,close all');
 tuxiang=uimenu(f,'text','图像处理');
 sobelmax  = uimenu(tuxiang,'text','maxsobel','callback',@(h,e)maxsobel(h,e,axes1,axes2));
 sobelsum  = uimenu(tuxiang,'text','sumsobel','callback',@(h,e)sumsobel(h,e,axes1,axes3));
 kirschmax = uimenu(tuxiang,'text','maxkirsch','callback',@(h,e)maxkirsch(h,e,axes1,axes4));

function  dakaick(h,e,axes1)
[wenjianming,lujing]=uigetfile('*.tif');%若想打开任意格式的文件，可改为*.*
axes(axes1);
imshow(fullfile(lujing,wenjianming));
title('原图');
set(axes1,'userdata',fullfile(lujing,wenjianming));
end
function maxsobel(h,e,axes1,axes2)
wenjianlujing=get(axes1,'userdata');
data=imread(wenjianlujing);
data2=Filter_1(data, 0, 0);
axes(axes2);
imshow(data2);
title('maxsobel');
set(axes2,'userdata',data2);
end
function sumsobel(h,e,axes1,axes3)
wenjianlujing=get(axes1,'userdata');
data=imread(wenjianlujing);
data2=Filter_1(data, 0, 1);
axes(axes3);
imshow(data2);
title('sumsobel');
set(axes3,'userdata',data2);
end

function maxkirsch(h,e,axes1,axes4)
wenjianlujing=get(axes1,'userdata');
data=imread(wenjianlujing);
data2=Filter_1(data, 1, 0);
axes(axes4);
imshow(data2);
title('maxkirsch');
set(axes4,'userdata',data2);
end

function daochuck(h,e,axes1)
data2=get(axes1,'userdata');
wenjianming=imputfile;
imwrite(data2,wenjianming);
helpdlg('导出完成');
end
