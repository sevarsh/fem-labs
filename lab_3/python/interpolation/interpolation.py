import numpy as np

from shapes.rectangle import Rectangle


class Interpolation:
    def __init__(self, func, shape=np.array([[0, 0], [0, 1], [1, 1], [1, 0]])):
        self.shape = shape
        self.function = func
        self.omega = Rectangle(self.shape)

    def interpolate(self, n):
        self.omega.triangulate(n)


    def gradient(self):
        pass

    def integral(self):
        pass

    def norm(self, val):
        pass