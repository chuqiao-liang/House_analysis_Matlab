%this function formats the inputted address so that it works with the API
%parameters.
function [full_address,citystatezip] = get_Formatted_address(house1)
[full_address,rest] = strtok(house1,',');
citystatezip = rest(2:end);
end
