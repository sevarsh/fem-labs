import numpy as np


class Interpolation:
    def __init__(self, func, shape=np.array([[0, 0], [0, 1], [1, 1], [1, 0]])):
        # self.omega = Re(shape)
        self.function = func
        self.approx = func

    def interpolate(self):
        # self.approx = interpolant
        pass

    def gradient(self):
        pass

    def integral(self):
        pass

    def norm(self, val):
        pass