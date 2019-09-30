function found=check_queue(q,obj)
% function found=check_queue(q,obj)
%
%   q   queue (it is a LinkedList object from java)

    import java.util.LinkedList     % Import queue structure from java
    list = LinkedList();
    list=q;
    found=0;

    while(list.isEmpty()~=1)
        element=list.remove();
        if(element==obj)
            found = true;
        end
    end
end
