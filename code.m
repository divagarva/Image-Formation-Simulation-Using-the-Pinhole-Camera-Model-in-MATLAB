% Full Image Formation Simulation Project in MATLAB

clc;
clear;

% Step 1: Define the camera and 3D scene
focal_length = 1;  
camera_position = [0, 0, 0];  
scene_points = [1, 2, 10; 2, 4, 12; 3, -1, 8; -2, 3, 15; -1, -2, 7];  

% Display the 3D scene
figure;
plot3(scene_points(:,1), scene_points(:,2), scene_points(:,3), 'o');
title('3D Scene');
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
axis equal;
hold on;
plot3(camera_position(1), camera_position(2), camera_position(3), 'rx', 'MarkerSize', 10);
legend('Scene Points', 'Camera');
for i = 1:size(scene_points, 1)
    plot3([camera_position(1), scene_points(i,1)], [camera_position(2), scene_points(i,2)], [camera_position(3), scene_points(i,3)], 'k--');
end
hold off;

% Step 2: Apply pinhole camera model for image formation
image_plane = [];  
for i = 1:size(scene_points, 1)
    X = scene_points(i, 1);
    Y = scene_points(i, 2);
    Z = scene_points(i, 3);
    u = (focal_length / Z) * X;
    v = (focal_length / Z) * Y;
    image_plane = [image_plane; u, v];
end

% Step 3: Display the 2D image plane with enhancements
figure;
plot(image_plane(:,1), image_plane(:,2), 'o');
title('Image Plane (Projected 2D Points)');
xlabel('u (Image X)');
ylabel('v (Image Y)');
grid on;
axis equal;
hold on;
xline(0, 'r');  
yline(0, 'r');
for i = 1:size(image_plane, 1)
    plot([0, image_plane(i,1)], [0, image_plane(i,2)], 'k--');
end
hold off;
