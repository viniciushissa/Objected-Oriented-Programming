class Pessoa:
    def __init__(self):
        self.__cpf = None
        self.__nome = None
        self.__sexo = None
        self.__idade = None

    def __repr__(self):
        return f'CPF: {self.__cpf}\nNome: {self.__nome}\nSexo: {self.__sexo}\nIdade: {self.__idade}\n'

    def menu(cls):
        opition = input(f'Menu:\n1-Criar Pessoa\n2-Mostrar Pessoas\n3-Sair\n-->')
        if opition == '1':
            cls.criar_pessoa()
            return True
        elif opition == '2':
            cls.mostrar_pessoa()
            return True
        elif opition == '3':
            cls.sair()
            return False
        else:
            print('Opção não encontrada!')
            return True
            
    def criar_pessoa(self):
        self.__cpf = input('Digite o CPF: ')
        self.__nome = input('Digite o Nome: ')
        self.__sexo = input('Digite o Sexo: ')
        self.__idade = input('Digite a Idade: ')

    def mostrar_pessoa(cls):
        print(cls)

    def sair(cls):
        print('Saindo.')

pessoa1 = Pessoa()

while pessoa1.menu():
    pass