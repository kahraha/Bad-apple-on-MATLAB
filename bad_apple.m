srcFiles = dir('/home/linuxlite/Documents/MATLAB/frames/*.png');

filename = fullfile('/home/linuxlite/Documents/MATLAB/frames', ...
                    srcFiles(1).name);

I = rgb2gray(imread(filename));
BW = imbinarize(I);
trace = edge(BW);

h = imshow(trace);

iterationTime = 1/30;

counter = 0; 

for i = 2:length(srcFiles)

    counter = counter + 1; 
    disp(counter); 

    tic;

    filename = fullfile('/home/linuxlite/Documents/MATLAB/frames', ...
                        srcFiles(i).name);

    I = rgb2gray(imread(filename));
    BW = imbinarize(I);
    trace = edge(BW);

    set(h, 'CData', trace);

    drawnow;

    elapsedTime = toc;

    if elapsedTime < iterationTime
        pause(iterationTime - elapsedTime);
    end

end
