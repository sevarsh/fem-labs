import numpy as np
import matplotlib.pyplot as plt
import matplotlib.tri as tri
import math


# Creating a Triangulation without specifying the triangles results in the
# Delaunay triangulation of the points.

# First create the x and y coordinates of the points.
n_angles = 10
n_radii = 8
min_radius = 0.25
radii = np.linspace(min_radius, 0.95, n_radii)

angles = np.linspace(0, 2*math.pi, n_angles, endpoint=False)
angles = np.repeat(angles[..., np.newaxis], n_radii, axis=1)
angles[:, 1::2] += math.pi/n_angles

x = (radii*np.cos(angles)).flatten()
y = (radii*np.sin(angles)).flatten()

# Create the Triangulation; no triangles so Delaunay triangulation created.
triang = tri.Triangulation(x, y)

# Mask off unwanted triangles.
xmid = x[triang.triangles].mean(axis=1)
ymid = y[triang.triangles].mean(axis=1)
mask = np.where(xmid*xmid + ymid*ymid < min_radius*min_radius, 1, 0)
triang.set_mask(mask)

# Plot the triangulation.
plt.figure()
plt.gca().set_aspect('equal')
plt.triplot(triang, 'bo-')
plt.title('triplot of Delaunay triangulation')

plt.show()


# points = np.array([[0, 0], [0, 1], [1, 1], [1, 2], [2, 2], [2, 0]])
# tri = Delaunay(points)
# plt.triplot(points[:, 0], points[:, 1], tri.simplices)
# plt.plot(points[:, 0], points[:, 1], 'o')
# plt.show()

# x = np.linspace(0, 1, 100)
# y = x ** 2
# z = x ** 3
# plt.plot(x, y)
# plt.plot(x, z)
# plt.show()

# Задать простую полигональную область
# Задать сетку
# Задать исследуемую функцию
# Построить линейный интерполянт
# Численно посчитать градиент
# Численно посчитать интеграл
# Посчитать L2 норму для разностей функций и градиентов
# Написать функцию минимизации функционала
