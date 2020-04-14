from abc import ABC, abstractmethod
import matplotlib.pyplot as plt
import matplotlib.tri as tri
import matplotlib.patches as patches


class Region(ABC):
    triangles = []
    x_coords = []
    y_coords = []
    shape = []

    def __init__(self, shape):
        self.shape = shape

    def triangulate(self):
        x = self.x_coords
        y = self.y_coords
        self.triangles = tri.Triangulation(x, y)

        # Mask off unwanted triangles.
        # xmin = x[self.triangles.triangles].min(axis=1)
        # xmax = x[self.triangles.triangles].max(axis=1)
        # ymin = y[self.triangles.triangles].min(axis=1)
        # ymax = y[self.triangles.triangles].max(axis=1)
        # mask = np.where(np.sqrt((xmax - xmin) ** 2 + (ymax - ymin) ** 2) > min_radius, 1, 0)
        # self.triangles.set_mask(mask)

    # generate flatten coords of the net points
    # with specified discretization steps
    @abstractmethod
    def flatten(self, n):
        pass

    def draw(self):
        fig, ax = plt.subplots(1)
        shape = patches.Polygon(self.shape)
        ax.add_patch(shape)
        plt.show()

    def draw_net(self):
        plt.figure()
        plt.gca().set_aspect('equal')
        plt.triplot(self.triangles, 'bo-')
        plt.title('triplot of Delaunay triangulation')
        plt.show()