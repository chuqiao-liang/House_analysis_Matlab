%this function gets the basic info for each house
%# bathrooms bedrooms and square footage. 
function [bathrooms bedrooms sqfoot] = getdeepsearch(house)
zillowid = 'X1-ZWz18vp017vx8r_aypsc';
[full_address,city_statezip] = get_Formatted_address(house);
data = webread('http://www.zillow.com/webservice/GetDeepSearchResults.htm',...
    'zws-id',zillowid,'address',full_address,'citystatezip',city_statezip);
%organize the data returned from call
remain = data;
segments = strings(0);
while (remain ~= "")
   [token,remain] = strtok(remain, '<>');
   segments = [segments ; token];
end
%get the #baths and beds and square footage 
%from the organized returned
bathrooms = str2double(segments{81});
bedrooms = str2double(segments{84});
sqfoot = str2double(segments{78});