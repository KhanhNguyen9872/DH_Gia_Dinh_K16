import math

class Shape:
    def __init__(self, color = 'red'):
        self.color = color
        
    def __repr__(self):
        return f"Shape(color={self.color!r})"
    
    def __str__(self):
        return f"Shape with color {self.color}"

class Circle(Shape):
    def __init__(self, radius, color):
        super().__init__(color)
        self.radius = radius
        
    def __repr__(self):
        return f"Circle(radius={self.radius}, color={self.color!r})"
    
    def __str__(self):
        return f"Circle with radius {self.radius} and color {self.color}"
    
    def get_area(self):
        return round(math.pi * self.radius ** 2, 2)

class Rectangle(Shape):
    def __init__(self, length, width, color):
        super().__init__(color)
        self.length = length
        self.width = width
        
    def __repr__(self):
        return f"Rectangle(length={self.length}, width={self.width}, color={self.color!r})"
    
    def __str__(self):
        return f"Rectangle with length {self.length}, width {self.width}, and color {self.color}"
    
    def get_area(self):
        return self.length * self.width

class Square(Rectangle):
    def __init__(self, side, color):
        super().__init__(side, side, color)
        
    def __repr__(self):
        return f"Square(side={self.length}, color={self.color!r})"
    
    def __str__(self):
        return f"Square with side {self.length} and color {self.color}"
    
    def get_area(self):
        return self.length ** 2

circle = Circle(1.0, "red")
rectangle = Rectangle(1.0, 1.0, "blue")
square = Square(3, "green")

print(repr(circle))
print("Circle area:", circle.get_area())
print()

print(repr(rectangle))
print("Rectangle area:", rectangle.get_area())
print()

print(repr(square))
print("Square area:", square.get_area())
print()