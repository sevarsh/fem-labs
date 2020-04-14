import numpy as np

from shapes.rectangle import Rectangle


if __name__ == "__main__":
    rect_shape = [[1, 1], [1, 3], [2, 3], [2, 1]]
    num_of_nodes = 10

    rect = Rectangle(np.asarray(rect_shape))

    # rect.draw()

    rect.flatten(num_of_nodes)
    rect.triangulate()
    rect.draw_net()

# Задать исследуемую функцию
# Построить линейный интерполянт
# Численно посчитать градиент
# Численно посчитать интеграл
# Посчитать L2 норму для разностей функций и градиентов
# Написать функцию минимизации функционала
