class Usuario:
    def __init__(self, nome: str, sobrenome: str, telefone: str, endereco: str) -> None:
        self.nome = nome
        self.sobrenome = sobrenome
        self.telefone = telefone
        self.endereco = endereco
    
    def __repr__(self) -> str:
        return f'Nome completo: {self.nome} {self.sobrenome}\nTelefone: {self.telefone}\nEndereço: {self.endereco}'
    
    def alterar_cadastro(self, chave, valor):
        if chave == 'nome':
            self.nome = valor
        elif chave == 'sobrenome':
            self.sobrenome = valor
        elif chave == 'telefone':
            self.telefone = valor
        elif chave == 'endereco':
            self.endereco = valor
        else:
            print('Digite a chave correta')

    def cadastrar_livro(self, book):
        livros.append(book)
        print(f'({book})\ncadastrado!\n')

    def retirar_livro(self, book_name):
        i = -1
        for livro in livros:
            i += 1
            if book_name == livros[i].nome:
                livros_retirados.append(livro)
                del livros[i]
                break
        else:
            f'Livro {book_name} não encontrado'
    
    def devolver_livro(self, book_name):
        i = -1
        for livro in livros_retirados:
            i += 1
            if book_name == livros_retirados[i].nome:
                livros.append(livro)
                del livros_retirados[i]
                break
        else:
            return f'Livro {book_name} não foi retirado.'
        

class Professor(Usuario):
    def __init__(self, nome: str, sobrenome: str, telefone: str, endereco: str, departamento: str) -> None:
        super().__init__(nome, sobrenome, telefone, endereco)
        self.departamento = departamento
    
    def __repr__(self) -> str:
        return f'{__class__.__name__}\n' + super().__repr__() + f'\nDepartamento: {self.departamento}\n'


class Aluno(Usuario):
    def __init__(self, nome: str, sobrenome: str, telefone: str, endereco: str, curso: str) -> None:
        super().__init__(nome, sobrenome, telefone, endereco)
        self.curso = curso
    
    def __repr__(self) -> str:
        return f'{__class__.__name__}\n' + super().__repr__() + f'\nCurso: {self.curso}\n'


class Funcionario(Usuario):
    def __init__(self, nome: str, sobrenome: str, telefone: str, endereco: str, departamento: str) -> None:
        super().__init__(nome, sobrenome, telefone, endereco)
        self.departamento = departamento
    
    def __repr__(self) -> str:
        return f'{__class__.__name__}\n' + super().__repr__() + f'\nDepartamento: {self.departamento}\n'


class Livro:
    def __init__(self, tipo, nome, lingua, midia, autores, nacionalidades, editoras, ano_de_edicao) -> None:
        self.tipo = tipo
        self.nome = nome
        self.lingua = lingua
        self.midia = midia
        self.autores = autores
        self.nacionalidades = nacionalidades
        self.editoras = editoras
        self.ano_de_edicao = ano_de_edicao
    
    def __repr__(self) -> str:
        return f'{__class__.__name__}\nTipo: {self.tipo}\nNome: {self.nome}\nLíngua: {self.lingua}\n' \
               f'Midia: {self.midia}\nAutores: {self.autores}\nNacionalidades: {self.nacionalidades}\n' \
               f'Editoras: {self.editoras}\nAno de Edição: {self.ano_de_edicao}'

def print_livros(livros, key):
    if key == 'bib':
        print('-----Livros da biblioteca-----')
        for livro in livros:
            print(livro, '\n')
    elif key == 'retired':
        print('-----Livros retirados-----')
        for livro in livros:
            print(livro, '\n')
        

livros = []
livros_retirados = []

aluno1 = Aluno('Vinicius', 'Hissa', '22998552767', 'Rua Jose II', 'Computacao')
prof1 = Professor('Raimundo', 'Nunes', '22999999988', 'Rua Travessa', 'LCMAT')
func1 = Funcionario('Maria', 'Joaquina', '22999112233', 'Rua Pão de Queijo', 'Limpeza')

print(aluno1, '\n', prof1, '\n', func1)

prof1.alterar_cadastro('nome', 'Girafales')
print(prof1)

aluno1.cadastrar_livro(Livro('Entretenimento', 'John Wick 4', 'Tupi Guarani', '909090', ['John Wick', 'Kriskov Smirnoff'],
               ['Britânico', 'Russo'], 'Livro Verde', '1990'))

func1.cadastrar_livro(Livro('Científico', 'The Big Bang', 'English', '717273', ['Serjao Foguetes', 'Elon Musk'],
               ['Brasileiro', 'Africano'], 'NASA', '2050'))

print_livros(livros, 'bib')
print_livros(livros_retirados, 'retired')

func1.retirar_livro('John Wick 4')

print_livros(livros, 'bib')
print_livros(livros_retirados, 'retired')

func1.devolver_livro('John Wick 4')

print_livros(livros, 'bib')
print_livros(livros_retirados, 'retired')