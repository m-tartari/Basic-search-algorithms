function found=check_vector(q,obj)
% function found=check_queue(q,obj)
%
%   found   return 0 if not found else it gives back the postion in the
%           vector
%
%     q     vector of element to control, element are saved in colum
%    obj    element to find
%
found=0;
for i=1:size(q,1)
    if(q(i,:)==obj)
            found = i;
            break;
    end
end
