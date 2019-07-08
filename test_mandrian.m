%% Set "reference" image, get feature points, and get descriptors
ref_img = imread('data\img.png');

ref = image_match(ref_img);
ref.get_feature_points();
ref.get_descriptors();
ref.plot_feature_points();

%% Set "current" image, get feature points, and get descriptors
cur_img = imread('data\img_IR.png');
cur = image_match(cur_img);
cur.get_feature_points();
cur.get_descriptors();
cur.plot_feature_points();

%% Match points
match_points = image_match.get_match_points(ref,cur);
image_match.plot_match_points(ref,cur,match_points);

%% Pose estimation
[h_pose, match_points_pose] = image_match.get_pose(ref,cur,match_points);
image_match.plot_match_points(ref,cur,match_points_pose);
image_match.plot_pose(ref,cur,h_pose);