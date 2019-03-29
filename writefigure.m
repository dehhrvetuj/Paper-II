% REMOVE THE GAP AT LEFT AND RIGHT END

B = B(:,100:end-100,:);

imwrite(B,'test.PNG');

figure
imshow(B)