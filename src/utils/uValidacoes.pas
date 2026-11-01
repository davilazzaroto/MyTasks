
unit uValidacoes;

interface

// Verifica se um campo de texto foi preenchido.
function TextoObrigatorio(const ATexto: string): Boolean;

// Verifica se o valor informado é um número inteiro maior que zero.
function InteiroPositivoValido(const ATexto: string): Boolean;

// Verifica se o texto respeita o limite de caracteres informado.
function TextoDentroLimite(const ATexto: string; ALimite: Integer): Boolean;

implementation

uses
  System.SysUtils;

function TextoObrigatorio(const ATexto: string): Boolean;
begin
  // Desconsidera espaços em branco antes de validar.
  Result := Trim(ATexto) <> '';
end;

function InteiroPositivoValido(const ATexto: string): Boolean;
var
  Numero: Integer;
begin
  // Tenta converter o texto para inteiro sem gerar exceção.
  Result := TryStrToInt(Trim(ATexto), Numero);

  // Se a conversão funcionou, verifica se o número é positivo.
  if Result then
    Result := Numero > 0;
end;

function TextoDentroLimite(const ATexto: string; ALimite: Integer): Boolean;
begin
  // Compara a quantidade de caracteres com o limite permitido.
  Result := Length(ATexto) <= ALimite;
end;

end.

