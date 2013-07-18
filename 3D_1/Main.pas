unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  m_Direct9;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if(g_isInitialize)then
  begin

  end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = 'b' then
  begin
    if InitD3D(self.Handle) = S_OK then
    begin
       g_IsInitialize := True;
      Caption := 'D3D初始化成功';
    end
    else
    begin
      Caption := 'D3D初始化失败';
    end;
  end;


  if (Key = 'n') then
  begin
    if (g_pD3D <> NIl) then
    begin
      try
        CleanUp();
        Caption := '释放D3D成功';
      except

      end;
    end;

  end;

end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  if g_IsInitialize then
  begin
    Render();
  end;
end;

end.
