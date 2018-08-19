%this function gets the zpid needed from the GetSearchResults API. 
%the zpid is only available in this API and is needed to access all other
%data for the other API calls.
function zpid = getzid(house1)

zillowid = 'X1-ZWz18vp017vx8r_aypsc';
[housenum1,citystatezip1] = get_Formatted_address(house1);
%call to getsearchresults API
data1 = webread('http://www.zillow.com/webservice/GetSearchResults.htm', 'zws-id',...
    zillowid ,'address',housenum1,'citystatezip', citystatezip1);
remain = data1;
segments = strings(0);
%organize data 
while (remain ~= "")
   [token,remain] = strtok(remain, '<>');
   segments = [segments ; token];
end
%reach into data and get zpid
id = segments{23};
zpid = str2double(id);
end