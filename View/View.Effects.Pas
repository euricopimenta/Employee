unit View.Effects;

interface
Uses
  Vcl.StdCtrls,
  Vcl.Graphics,
  SysUtils,
  System.Math;

procedure hoverEffect(Sender: TObject); // Transparência dos Labels
procedure GrowTextEffect(Sender: TObject); // Oscila Tamanho do Texto
procedure ColorTextEffect(Sender: TObject; Original:String; New:String); //Alterna Cores do Texto

implementation

procedure hoverEffect(Sender: TObject);
begin
  if Sender.ClassType = TLabel then
    With TLabel(Sender) do
      if Transparent then
        Transparent := False
      Else
        Transparent := True
End;


procedure GrowTextEffect(Sender: TObject);
Begin
  if Sender.ClassType = TLabel then
    With TLabel(Sender) do
      if Font.Size Mod 2 = 0 then
        Font.Size := Font.Size + 1
      Else
        Font.Size := Font.Size - 1

End;

procedure ColorTextEffect(Sender: TObject; Original:String; New:String);
Begin
  if Sender.ClassType = TLabel then
    With TLabel(Sender) do
      if Font.Color = StringToColor(Original) then
        Font.Color := StringToColor(New)
      Else
        Font.Color := StringToColor(Original)

End;



end.
