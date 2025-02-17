import re

# verifca o tamanho da tenha
def check_tamanho(senha):
    return len(senha) >= 8

# verifica se a senha possui numeros
def check_numero(senha):
    return re.search("\d", senha) != None

# verifica se a senha possui pelo menos uma maiuscula
def check_maiuscula(senha):
    return re.search("[A-Z]", senha) != None

senha = input("Entre com a senha: ").strip()
tamanho_ok = check_tamanho(senha)
numero_ok = check_numero(senha)
maiuscula_ok = check_maiuscula(senha)

msg = "Senha insegura! "

if not tamanho_ok:
    msg += "Senha com menos de 8 caracteres"
elif not numero_ok:
    msg += "Senha deve ter pelo menos um numero"
elif not maiuscula_ok:
    msg += "Senha deve ter pelo menos uma maiuscula"
else:
    msg = "Senha segura! :)"

print(msg)
