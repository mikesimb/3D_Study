unit m_Direct9;

interface

uses
  winapi.windows,Winapi.Direct3D9,Winapi.Direct3D;


  function InitD3D(hwnd :HWND):HRESULT;
  procedure CleanUp();
  procedure Render();

var
  //����3D������Ҫ��2������
  g_pD3D :IDirect3D9 = nil;
  //�豸����
  g_pD3DDevice:IDirect3DDevice9 = nil;
  g_IsInitialize:Boolean = false;
implementation

procedure Render();
begin
  g_pD3dDevice.Clear(0,nil,D3DClear_Target,D3DColor_XRGB(0,0,0),1.0,0);
  if(S_OK =g_pD3DDevice.BeginScene) then
  begin
    g_pD3DDevice.EndScene;
  end;
  g_pD3DDevice.Present(nil,nil,0,nil);
end;

function InitD3D(hwnd :HWND):HRESULT;
var
  d3dpp :D3DPRESENT_PARAMETERS;
  res :Integer;
begin
  //����DIRECT3D
  g_pD3D := Direct3DCreate9(D3D_SDK_VERSION);
  if (g_pD3D = nil) then
  begin
     Result := E_FAIL;
     exit;
  end;
  //�������
  //FillChar(d3dpp, 0,SizeOf(d3dpp));
  //MD����ط����췸���ˣ�FILLCHAR�ڶ���������ָ��ȣ�������������ָ��ֵ
  fillchar(d3dpp,sizeof(d3dpp),0);
  d3dpp.Windowed := true;
  d3dpp.SwapEffect := D3DSWAPEFFECT_DISCARD;
  d3dpp.BackBufferFormat := D3DFMT_UNKNOWN;


  res := g_pD3D.CreateDevice(D3DADAPTER_DEFAULT,D3DDEVTYPE_HAL,hwnd,D3DCREATE_HARDWARE_VERTEXPROCESSING,@d3dpp,g_pD3DDevice);
  
  if Winapi.windows.Failed(res) then
  begin
    Result := E_FAIL;
    exit;

  end;
  Result := S_OK;
  


end;

procedure CleanUp();
begin
  if (g_pD3DDevice <> nil) then
  begin
    g_pD3DDevice := nil;
  end;

  if(g_pD3D <> nil) then
  begin
    g_pD3D := nil;
  end;
  
end;
end.
