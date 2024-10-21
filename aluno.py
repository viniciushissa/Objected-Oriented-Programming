class Aluno:
    def __init__(self):
        self.__ra = None
        self.__nome = None
        self.__ac1 = None
        self.__ac2 = None
        self.__ag = None
        self.__af = None
        self.__media = None
        self.__situacao = None
    
    def __repr__(self):
        return f'RA: {self.__ra}  Nome: {self.__nome}  AC1: {self.__ac1}  AC2: {self.__ac2}  ' \
               f'AG: {self.__ag}  AF: {self.__af}\nMedia: {self.__media}  Situação: {self.__situacao}\n'

    def menu(cls):
        opition = input(f'Menu:\n1-Criar Aluno\n2-Mostrar Aluno\n3-Sair\n-->')
        if opition == '1':
            cls.criar_aluno()
            return True
        elif opition == '2':
            cls.mostrar_aluno()
            return True
        elif opition == '3':
            cls.sair()
            return False
        else:
            print('Opção não encontrada!')
            return True
            
    def criar_aluno(self):
        self.__ra = input('Digite o RA do aluno: ')
        self.__nome = input('Digite o Nome do aluno: ')
        self.__ac1 = int(input('Digite o AC1: '))
        self.__ac2 = int(input('Digite a AC2: '))
        self.__ag = int(input('Digite a AG: '))
        self.__af = int(input('Digite a AF: '))

    def mostrar_aluno(cls):
        if cls.__ac1 and cls.__ac2 and cls.__ag and cls.__af:
            cls.calcular_media()
            cls.verificar_aprovacao()
            print(cls)
        else:
            print(cls)

    def sair(cls):
        print('Saindo.')

    def calcular_media(self):
        self.__media = self.__ac1*0.15 + self.__ac2*0.3 + self.__ag*0.1 + self.__af*0.45
    
    def verificar_aprovacao(self):
        if self.__media >= 5:
            self.__situacao = 'Aprovado'
        else:
            self.__situacao = 'Reprovado'

aluno1 = Aluno()

while aluno1.menu():
    pass