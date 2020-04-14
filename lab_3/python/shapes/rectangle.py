import numpy as np

from shapes.region import Region


class Rectangle(Region):
    def __init__(self, shape=np.array([[0, 0], [0, 1], [1, 1], [1, 0]])):
        super().__init__(shape)
        self.x_int = [shape[:, 0].min(), shape[:, 0].max()]
        self.y_int = [shape[:, 1].min(), shape[:, 1].max()]

    def _flatten(self, n):
        n += 1

        def half_step(interval):
            return (interval[1] - interval[0]) / (n - 1) / 2

        first_layer = np.linspace(self.x_int[0], self.x_int[1], n)
        second_layer = np.linspace(self.x_int[0] + half_step(self.x_int), self.x_int[1] + half_step(self.x_int), n - 1,
                                   endpoint=False)

        second_layer = np.append(second_layer, first_layer[0])
        second_layer = np.append(second_layer, first_layer[-1])

        segment = np.append(first_layer, second_layer)
        net_x = np.tile(segment, n - 1)
        self.x_coords = np.append(net_x, first_layer)

        net_y = np.linspace(self.y_int[0], self.y_int[1], 2*n - 1)
        first = np.repeat(net_y[::2], n)
        second = np.repeat(net_y[1::2], n + 1)
        self.y_coords = np.sort(np.append(first, second))