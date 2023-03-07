clear;
clc;
close all;
Image=imread('cameraman.tif'); %reading the image
figure
subplot(1,2,1);
imshow(Image);  %plotting the image
title("Original_Image");
subplot(1,2,2);
imhist(Image,64);  %plotting histogram of image
title("Histogtam");
X = 0:1:255;
Y = X;
figure
subplot(3,3,1);
imshow(Image);  %plotting the image
title("Original_Image");
subplot(3,3,2);
imhist(Image,64);  %plotting histogram of image
title("Histogtam");
subplot(3,3,3);
plot(X,Y);  %plotting the X,Y axes
[row, col] = size(Image); %identifying the size of the image
brighted_Image = uint8(zeros(row,col)); %The Brighted Image
darkened_Image = uint8(zeros(row,col)); %The Darkened Image
for R = 1:row
    for C = 1:col
        New_Image = 100 + Image(R,C); %Adding 100 to every pixel in the image 
        if New_Image > 255
            New_Image = 255;
        end
        brighted_Image(R,C) = New_Image; %Now the new image is The Brighted Image
    end
end
Y = X + 100;
for i=1:255
    if Y(i) > 255
        X(i) = 255;
    end
end
subplot(3,3,6);
plot(X,Y); %plotting the output transform of the Bighntened Image
title("The output transform of the Bighntened Image");
subplot(3,3,4);
imshow(brighted_Image); %Plotting the Bighntened Image
title("Bighntened Image");
subplot(3,3,5);
imhist(brighted_Image,64); %Plotting histogram of the Bighntened Image
for R = 1:row
    for C = 1:col
        new_Image = Image(R,C) - 100; %Subtracting 100 from every pixel in the image
        if new_Image < 0
            new_Image = 0;
        end
        darkened_Image(R,C) = new_Image;  %Now the new image is The Darkened Image
    end
end
Y = X - 100;
for i=1:255
    if Y(i) < 0
        Y(i) = 0;
    end
end
subplot(3,3,9);
plot(X,Y); %plotting the output transform of the Darkened Image
title("The output transform of the Bighntened Image");
subplot(3,3,7);
imshow(darkened_Image); %Plotting the Darkened Image
title("Darkened image");
subplot(3,3,8);
imhist(darkened_Image,64); %Plotting histogram of the Darkened Image


[Enhanced_image, Enhanced_transform] = histeq(Image); %to return the output transform of Enhanced image.
figure
subplot(2, 3, 1);
 imshow(Image); %plotting the original image
 subplot(2, 3, 2);
 imhist(Image,64); %plotting the histogram of original image
 X = 0:1:255;
Y = X;
subplot(2, 3, 3);
plot(X,Y);
subplot(2, 3, 4);
imshow(Enhanced_image); % plotting the Enhanced image
subplot(2, 3, 5);
imhist(Enhanced_image,64); % plotting the histogram of the Enhanced image
subplot(2, 3, 6);
 plot(Enhanced_transform); %the output transform of Enhanced image.