class Pessoa:
    def __init__(self, cpf, nome, sexo, idade):
        self.__cpf = cpf
        self.__nome = nome
        self.__sexo = sexo
        self.__idade = idade
    
    def __repr__(self):
        return f'CPF: {self.__cpf}\nNome: {self.__nome}\nSexo: {self.__sexo}\nIdade: {self.__idade}'
    
def menu():
    opition = input(f'Menu:\n1-Criar Pessoa\n2-Mostrar Pessoa\n3-Sair\n-->')
    return opition

lista_pessoas = []
while True:
    opit = menu()
    if opit == '1':
        cpf = input('Digite o CPF: ')
        nome = input('Digite o Nome: ')
        sexo = input('Digite o Sexo: ')
        idade = input('Digite a Idade: ')
        temp = Pessoa(cpf, nome, sexo, idade)
        lista_pessoas.append(temp)
    elif opit == '2':
        for pessoa in lista_pessoas:
            print(pessoa)
            print('\n')
    elif opit == '3':
        break
    else:
        print('Digite uma opção correta.')