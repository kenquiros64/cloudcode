class Estudiante:

            def __init__(self, nombre, carnet):
                self.nombre = nombre
                self.carnet = carnet
            def set_nombre(self,nombre):
                self.nombre = nombre
            def set_carnet(self,carnet):
                self.carnet = carnet
            def imprimir():
                print (">Estudiantes<")
                for i in range (0, len(estudiantes)):
                    nombre = estudiantes[i].nombre
                    carnet = estudiantes[i].carnet
                    print ("--------------------")
                    print ("Nombre: " + nombre)
                    print ("Carnet: " + carnet)

estudiantes = []

def main():
    i = 0
    print ("¿Desea ingresar estudiantes?")
    x = input("¿si o no?: ")
    while x == "si":
                i = 0
                nombre = input("Introduzca Nombre de la persona: ")
                carnet = input("Introduzca número de carnet: ")
                nuevo_estudiante = Estudiante(nombre, carnet)
                #print ("¿Desea seguir ingresando estudiantes?")
                estudiantes.append(nuevo_estudiante)
                #carnet.append(carnet)
                #print (estudiantes,carnet)
                print ("¿Desea seguir ingresando estudiantes?")
                x = input("¿si o no?: ")
                if x == "si":
                    i = 0
                if i != 0:
                    print ("fin de programa")
                    x = "no"
    else:
        print ("¿Desea revisar estudiantes?")
        y = input("¿si o no?: ")
        if y == "si":
            Estudiante.imprimir()
        else:
            print ("fin de programa")

main()
