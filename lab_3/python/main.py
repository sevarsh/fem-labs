import numpy as np
from math import sin

from interpolation.interpolation import Interpolation


if __name__ == "__main__":
    def function(x, y): return sin(x - y)
    rect_shape = [[1, 1], [1, 3], [2, 3], [2, 1]]
    num_of_nodes = 10

    inter = Interpolation(function, np.asarray(rect_shape))

    inter.omega.triangulate(num_of_nodes)
    inter.omega.draw_net()

# Задать исследуемую функцию
# Построить линейный интерполянт
# Численно посчитать градиент
# Численно посчитать интеграл
# Посчитать L2 норму для разностей функций и градиентов
# Написать функцию минимизации функционала
