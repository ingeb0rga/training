#
# Example file for working with classes
# LinkedIn Learning Python course by Joe Marini
#

# class my_class():
#     def method1(self):
#         print("my_class method1")

#     def method2(self, some_string):
#         print("my_class method2 " + some_string)

# class another_class(my_class):
#     def method1(self):
#         my_class.method1(self)
#         print("another_class method1")

#     def method2(self, some_string):
#         my_class.method2(self, some_string)
#         print("another_class method2 " + some_string)

# def main():
#     my_class().method1()
#     my_class().method2("Just a string")

#     another_class().method1()
#     another_class().method2("Just another string")

class Vehicle():
    def __init__(self, bodystyle):
        self.bodystyle = bodystyle

    def drive(self, speed):
        self.mode = "driving"
        self.speed = speed

class Car(Vehicle):
    def __init__(self, enginetype):
        super().__init__("Car")
        self.wheels = 4
        self.doors = 4
        self.enginetype = enginetype

    def drive(self, speed):
        super().drive(speed)
        print("Driving my", self.enginetype, "car at", self.speed, "km/h")

class Motorcycle(Vehicle):
    def __init__(self, enginetype, hassidecar):
        super().__init__("Motorcycle")
        if (hassidecar):
            self.wheels = 3
        else:
            self.wheels = 2
        self.doors = 0
        self.enginetype = enginetype

    def drive(self, speed):
        super().drive(speed)
        print("Driving my", self.enginetype, "motorcycle at", self.speed, "km/h")

car1 = Car("gas")
car2 = Car("diesel")
car3 = Car("electric")
mc1 = Motorcycle("gas", True)
mc2 = Motorcycle("gas", False)
mc3 = Motorcycle("electric", True)

print(mc1.wheels)
print(car1.enginetype)
print(car2.doors)
print(mc3.wheels)

car1.drive(30)
car3.drive(40)
mc1.drive(60)
mc3.drive(100)

# if __name__ == "__main__":
#     Vehicle()