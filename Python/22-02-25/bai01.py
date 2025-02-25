from math import pi

class Circle:
    def __init__(self, radius = 1.0):
        self.radius = radius

    def __str__(self):
        return 'Day la hinh tron voi ban kinh {:2f}'.format(self.radius)

    def __repr__(self):
        return 'Circle(radius={})'.format(self.radius)
    
    def get_area(self):
        return self.radius * self.radius * pi

circle = Circle()
print(circle)
print("Dien tich hinh tron: ", round(circle.get_area(), 1))