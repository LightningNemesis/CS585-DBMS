import math

# Given coordinates
x_center = -118.28341902447363
y_center = 34.020447068158866

# Spirograph parameters
R = 0.0005  # radius of the large circle
r = 0.0009  # radius of the small circle
O = 0.5  # distance of the pen point from the center of the small circle
num_points = 5000  # number of points to generate along the spirograph curve

spirograph_points = []

for i in range(num_points):
    t = i * (2000 * math.pi) / num_points
    x = (R + r) * math.cos((r/R) * t) + x_center
    y = (R + r) * math.sin((r/R) * t) + y_center
    spirograph_points.append((x, y))

# Writing the KML output to a file
with open("spirograph.kml", "w") as file:
    file.write('<?xml version="1.0" encoding="UTF-8"?>\n')
    file.write('<kml xmlns="http://www.opengis.net/kml/2.2">\n')
    file.write('  <Document>\n')
    file.write('    <Placemark>\n')
    file.write('      <name>Spirograph</name>\n')
    file.write('      <LineString>\n')
    file.write('        <coordinates>\n')

    for point in spirograph_points:
        file.write(f'          {point[0]},{point[1]},0\n')

    file.write('        </coordinates>\n')
    file.write('      </LineString>\n')
    file.write('    </Placemark>\n')
    file.write('  </Document>\n')
    file.write('</kml>\n')
