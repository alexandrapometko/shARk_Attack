close all
clear all

v = VideoWriter('mavideo.avi');
v.FrameRate = 25;
open(v);
%=========PARAMETRES VIDEO PAPIER==============
vid = VideoReader('vid_in2.mp4');
numFrames = get(vid,'NumberOfFrames');


%=========PARAMETRES VIDEO PROJETER==============
vid2=VideoReader('shark.avi');
numFrames2 = get(vid2,'NumberOfFrames');

coins = corners(vid);
%Extraction d'une frame
for i=1:numFrames
    frame = read(vid,i);
    frame2 = read(vid2,i+32);
    newframe=homographie(frame,frame2,coins(i));
    writeVideo(v, newframe);
end
close(v)