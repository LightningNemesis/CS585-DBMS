import math



def spirograph_generation(points):
  # Declare variables as given by sir
    R = 36.0
    r = 9.0
    a = 30.0

  # Points for Tommy Trojan
    cx = -118.28543170888742
    cy = 34.02049236057662
    nRev = 16.0
    t = 0.1

    # Looping through
    while t < math.pi*nRev:
        x = (R+r)*math.cos((r/R)*t)-a*math.cos((1+r/R)*t)
        y = (R+r)*math.sin((r/R)*t)-a*math.sin((1+r/R)*t)
        x = (x*0.000008)+cx
        y = (y*0.000008)+cy        
        spirograph_points.append((x,y))
        t += 0.1


def write_kml(points):
    with open("spirograph.kml", "w") as file:
        file.write('<?xml version="1.0" encoding="UTF-8"?>\n')
        file.write('<kml xmlns="http://www.opengis.net/kml/2.2">\n')
        file.write('  <Document>\n')
        file.write('    <Placemark>\n')
        file.write('      <name>Spirograph</name>\n')
        file.write('      <LineString>\n')
        file.write('        <coordinates>\n')

        for point in points:
            file.write(f'          {point[0]},{point[1]},0\n')

        file.write('        </coordinates>\n')
        file.write('      </LineString>\n')
        file.write('    </Placemark>\n')
        file.write('  </Document>\n')
        file.write('</kml>\n')


if __name__ =="__main__":
    spirograph_points = []
    spirograph_generation(points=spirograph_points)
    write_kml(spirograph_points)