classdef LinkedList < dlnode
   properties
      Name = ''
   end
   methods
      function n = LinkedList (name,data)
         if nargin == 0
            name = '';
            data = [];
         end
         n = n@dlnode(data);
         n.Name = name;
      end
   end
end