from netCDF4 import Dataset
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap


# read a a specific netCDF file
my_example_nc_file = "/Users/mukundsudarshan/Documents/SampleData/uv20150101rt.nc"
# create a netCDF4.Dataset object
fh = Dataset(my_example_nc_file, mode='r')

# create some netCDF4.Variable objects
x = fh.variables['u']
y = fh.variables['v']

# create some numpy.ndarray objects
lons = fh.variables['lon'][:]
lats = fh.variables['lat'][:]
tmax = fh.variables['time'][:]

# fetch some units
tmax_units = fh.variables['time'].units

# Get some parameters for the Stereographic Projection
lon_0 = lons.mean()
lat_0 = lats.mean()

m = Basemap(width=5000000,height=3500000, resolution='l',projection='stere', lat_ts=40,lat_0=lat_0,lon_0=lon_0)

# Because our lon and lat variables are 1D, 
# use meshgrid to create 2D arrays 
# Not necessary if coordinates are already in 2D arrays.
lon, lat = np.meshgrid(lons, lats)
xi, yi = m(lon, lat)


print tmax

# close the dataset
fh.close()