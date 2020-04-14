import numpy as np

from shapes.rectangle import Rectangle


if __name__ == "__main__":
    s = [[1, 1], [1, 3], [2, 3], [2, 1]]
    rect = Rectangle(np.asarray(s))
    for i in range(1, 10):
        rect = Rectangle(np.asarray(s))
        rect.flatten(i)
        rect.triangulate()
        rect.draw_net()

# Задать простую полигональную область
# Задать сетку
# Задать исследуемую функцию
# Построить линейный интерполянт
# Численно посчитать градиент
# Численно посчитать интеграл
# Посчитать L2 норму для разностей функций и градиентов
# Написать функцию минимизации функционала
