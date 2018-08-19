%this function retrieves the historical highest and lowest values of the house
%as well as the change in price in last 30 days.
function [valuation_low,valuation_high,thirty_change] = getvaluation(house)
zillowid = 'X1-ZWz18vp017vx8r_aypsc';
data = webread('http://www.zillow.com/webservice/GetZestimate.htm',...
    'zws-id' ,zillowid,'zpid', getzid(house));
%organize data
remain = data;
segments = strings(0);
while (remain ~= "")
   [token,remain] = strtok(remain, '<>');
   segments = [segments ; token]
end
%get the valuations and 30-day change from organized returned data
valuation_low = str2double(segments{68});
valuation_high = str2double(segments{71});
thirty_change = str2double(segments{64});
end
