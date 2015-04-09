 % Uses YQL to query the geo.places database for the latitude and longitude
 % of a city, given the city name and country code.
 function [latDegs, lonDegs] = getLatLonViaYql(city,countryCode)
    % build the YQL query
    yqlQuery = sprintf(['select centroid.latitude,centroid.longitude ' ...
                        'from geo.places '                             ...
                        'where text="%s" and country.code="%s" and '   ...
                        'placeTypeName.code="7"'],                     ...
                        city, countryCode);
    % build the URL
    yqlUrl = ['http://query.yahooapis.com/v1/public/yql?q=' yqlQuery];
    % replace blank spaces with %20
    yqlUrl = strrep(yqlUrl,' ','%20');
    % retrieve the data
    xmlData = urlread(yqlUrl);
    % get the latitude and longitude (here we assume that the latitude is
    % within <latitude>XYZ</latitude> and the longitude within
    % <longitude>UVW</longitude> tags)
    posData = regexp(xmlData,'>[0-9.-]+<','match');
    % if exactly two tags match the above regexp then parse the latitude
    % and longitude data
    if length(posData)==2
        latDegs = str2double(char(posData{1}(2:end-1)));
        lonDegs = str2double(char(posData{2}(2:end-1)));
    else
        latDegs = 0;
        lonDegs = 0;
    end
 end
