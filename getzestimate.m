%this function gets the zestimate and home value index from returned data 
%for the house entered. home value index is median zestimate value for 
%given geographic area on given day.
function [zestimate,homeindex]= getzestimate(house)
zillowid = 'X1-ZWz18vp017vx8r_aypsc';
data = webread('http://www.zillow.com/webservice/GetZestimate.htm',...
    'zws-id' ,zillowid,'zpid', getzid(house));
remain = data;
segments = strings(0);
%organize data
while (remain ~= "")
   [token,remain] = strtok(remain, '<>');
   segments = [segments ; token];
end
%get the zestimate and HVI from organized returned data
zestimate = str2double(segments{56});
homeindex = str2double(segments{81});
end
