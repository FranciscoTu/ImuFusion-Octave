function dcm = angle2dcm( r1, r2, r3, S )
%  ANGLE2DCM Create direction cosine matrix from rotation angles.
%   N = ANGLE2DCM( R1, R2, R3 ) calculates the direction cosine matrix, N,
%   for a given set of rotation angles, R1, R2, R3.   R1 is an M array of
%   first rotation angles.  R2 is an M array of second rotation angles.  R3
%   is an M array of third rotation angles.  N returns an 3-by-3-by-M
%   matrix containing M direction cosine matrices.  Rotation angles are
%   input in radians.  
%
%   N = ANGLE2DCM( R1, R2, R3, S ) calculates the direction cosine matrix,
%   N, for a given set of rotation angles, R1, R2, R3, and a specified
%   rotation sequence, S. 
%
%   The default rotation sequence is 'ZYX' where the order of rotation
%   angles for the default rotation are R1 = Z Axis Rotation, R2 = Y Axis
%   Rotation, and R3 = X Axis Rotation. 
%
%   All rotation sequences, S, are supported: 'ZYX', 'ZYZ', 'ZXY', 'ZXZ',
%   'YXZ', 'YXY', 'YZX', 'YZY', 'XYZ', 'XYX', 'XZY', and 'XZX'.
%
%   Examples:
%
%   Determine the direction cosine matrix from rotation angles:
%      yaw = 0.7854; 
%      pitch = 0.1; 
%      roll = 0;
%      dcm = angle2dcm( yaw, pitch, roll )
%
%   Determine the direction cosine matrix from multiple rotation angles:
%      yaw = [0.7854 0.5]; 
%      pitch = [0.1 0.3]; 
%      roll = [0 0.1];
%      dcm = angle2dcm( pitch, roll, yaw, 'YXZ' )
%
%   See also DCM2ANGLE, DCM2QUAT, QUAT2DCM, QUAT2ANGLE.

%   Copyright 2000-2020 The MathWorks, Inc.

arguments
    r1
    r2
    r3
    S Aero.internal.datatype.Rotation = 'zyx'
end

if any(~isreal(r1) | ~isnumeric(r1))
    error(message('aero:angle2dcm:isNotReal1'));
end

if any(~isreal(r2) | ~isnumeric(r2))
    error(message('aero:angle2dcm:isNotReal2'));
end

if any(~isreal(r3) | ~isnumeric(r3))
    error(message('aero:angle2dcm:isNotReal3'));
end

if (length(r1) ~= length(r2)) || (length(r1) ~= length(r3))
    error(message('aero:angle2dcm:wrongDimension'));
end

angles = [r1(:), r2(:), r3(:)];

dcm = Aero.internal.math.angle2dcm(angles,string(S));

end