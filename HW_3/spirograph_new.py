import simplekml
import numpy as np

def spirograph(R, r, a, n, x_center, y_center):
    t = np.arange(0, n*np.pi, 0.01)
    x = (R + r) * np.cos((r/R) * t) - a * np.cos((1 + r/R) * t) + x_center
    y = (R + r) * np.sin((r/R) * t) - a * np.sin((1 + r/R) * t) + y_center

    kml = simplekml.Kml()
    line = kml.newlinestring(name='Spirograph')
    for i in range(len(x)):
        line.coords.addcoordinates([(x[i], y[i])])
    line.style.linestyle.color = simplekml.Color.red
    line.style.linestyle.width = 3
    
    kml.save('spirograph.kml')

# spirograph(40, 9, 30, 8, -118.28341902447363, 34.020447068158866)
# spirograph(10, 2, 5, 50, -118.28341902447363, 34.020447068158866)
# spirograph(1, 0.2, 0.5, 10, -118.28341902447363, 34.020447068158866)
# spirograph(0.0001, 0.002, 0.0008, 10, -118.28341902447363, 34.020447068158866)
# spirograph(0.003, 0.0005, 0.0008, 15, -118.28341902447363, 34.020447068158866)

# spirograph(0.001, 0.008, 0.00008, 10, -118.28341902447363, 34.020447068158866)

# spirograph(0.0001, 0.00008, 0.00008, 10, -118.28341902447363, 34.020447068158866)
# spirograph(0.0006, 0.00003, 0.00008, 27, -118.28341902447363, 34.020447068158866)

# Final
# spirograph(0.00039, 0.00003, 0.00009, 26, -118.28544680361115, 34.020517410885276)
spirograph(0.009, 0.0009, 0.00009, 15, -118.28544680361115, 34.020517410885276)