% This is the name of the data file we will read. 
ncfile='uv20150102rt.nc';

windData = readFile(ncfile);

NLAT=6;
NLON=12;
NREC=2;
NLVL=2;

% 
% These are used to construct some example data. 
SAMPLE_PRESSURE = 900;
SAMPLE_TEMP = 9.0;
START_LAT = 25.0;
START_LON = -125.0;

%
% Create some pretend data. If this wasn't an example program, we
% would have some real data to write, for example, model
% output.
lats = [25:0.5:27.5]';
NLAT = length(lats);
lons = [-125:0.5:-119.5]';
NLON = length(lons);

pres_out = ones(NLVL,NLAT,NLON);
temp_out = ones(NLVL,NLAT,NLON);

%
% This is a little inefficient from a matlab point of view, but 
% accomplishes the same thing as the corresponding C program.
inc = 0;
for lvl = 1:NLVL
    for lat = 1:NLAT
        for lon = 1:NLON
            pres_out(lvl,lat,lon) = SAMPLE_PRESSURE + inc;
            temp_out(lvl,lat,lon) = SAMPLE_TEMP + inc;
            inc = inc + 1;
        end
    end
end

%
% Retrieve the coordinate variable data.
lat_out = nc_varget ( ncfile, 'latitude' );
lon_out = nc_varget ( ncfile, 'longitude' );

%
% Check the coordinate variable data. */
if any(lats - lat_out)
    error ( 'latitudes did not match.\n' );
end
if any(lons - lon_out)
    error ( 'latitudes did not match.\n' );
end

%
% Read the data. Since we know the contents of the file we know
% that the data arrays in this program are the correct size to
% hold one timestep.
count = [1 NLVL NLAT NLON];
start = [0    0    0    0];

%
% Read and check one record at a time. */
for rec = 0:NREC-1

      start(1) = rec;
      pres_in = nc_varget ( ncfile, 'pressure', start, count );
      temp_in = nc_varget ( ncfile, 'temperature', start, count );

      if any(pres_in - pres_out)
          error ( 'pressure data did not match\n' );
      end
      if any(temp_in - temp_out)
          error ( 'temperature data did not match\n' );
      end

end

fprintf(1, '*** SUCCESS reading example file pres_temp_4D.nc!\n');
