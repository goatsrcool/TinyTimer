unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, Menus, Clipbrd, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabeledEdit1: TLabeledEdit;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    PopupMenu1: TPopupMenu;
    SpeedButton1: TSpeedButton;
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TimeEdit1Change(Sender: TObject);
    procedure Timer1StartTimer(Sender: TObject);
    procedure Timer1StopTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  timer: String;
  myTime: TDateTime;
  savedTime: TDateTime;
  showAbout: Boolean;

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.Button1Click(Sender: TObject);
begin
   if not Timer1.enabled then
   begin                                                 ;
      myTime := Now;
      Timer1.enabled := True;
      Button1.Caption:= 'Stop';
   end
   else
     begin
       savedTime := savedTime + (Now - myTime);
       Timer1.enabled := False;
       Button1.Caption:= 'Start';
     end
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    Timer1.enabled := False;
    Button1.Caption:= 'Start';
    LabeledEdit1.Text:= '00:00:00';
    savedTime := Now - Now;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   //this is to fix an issue where unselecting always on top
   //would reset the window position.
  Position := poDefaultSizeOnly;

  savedTime := now - now;
  showAbout := False;
end;

procedure TForm1.FormWindowStateChange(Sender: TObject);
begin
  //hide instead of minimize
    if WindowState = wsMinimized then
    begin
       WindowState := wsNormal;
       Visible := not Visible;
    end;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.LabeledEdit1Change(Sender: TObject);
begin

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  //show or hide (taskbar)
      if showAbout = True then
          begin
             showabout := False;
             //Form2.Position := poDefaultSizeOnly;
             Form2.Visible := True;
          end;
  Visible := not Visible;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
   //quit (taskbar)
    halt(0);
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
    //always on top (taskbar)
   if MenuItem3.Checked = False then
   begin
      MenuItem3.Checked := True;
      MenuItem6.Checked := True;
      FormStyle := fsSystemStayOnTop;
   end
   else
   begin
         if Form2.Visible = True then
         begin
            showAbout := True;
            Form2.Visible := False;
         end;
         MenuItem3.Checked := False;
         MenuItem6.Checked := False;
         FormStyle := fsNormal;
         if showAbout = True then
         begin
            showabout := False;
            Form2.Position := poDefaultSizeOnly;
            Form2.Visible := True;
         end;
   end;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
     //always on top (main menu)
    if MenuItem6.Checked = False then
    begin
       MenuItem3.Checked := True;
       MenuItem6.Checked := True;
       FormStyle := fsSystemStayOnTop;
    end
    else
    begin
          //The about page can disappear but still show up as visible if you
          //select 'Always on Top' back and forth. This will keep the state
          //correct and make sure the about page's position won't move when you
          //select 'Always on Top'
          if Form2.Visible = True then
          begin
             showAbout := True;
             Form2.Visible := False;
          end;
          MenuItem3.Checked := False;
          MenuItem6.Checked := False;
          FormStyle := fsNormal;
          if showAbout = True then
          begin
             showabout := False;
             Form2.Position := poDefaultSizeOnly;
             Form2.Visible := True;
          end;
    end;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
   //show or hide (main menu)
   if showAbout = True then
          begin
             showabout := False;
             //Form2.Position := poDefaultSizeOnly;
             Form2.Visible := True;
          end;
   Visible := not Visible;
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
    //quit (main menu)
    halt(0);
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  //about page (main menu)
  showAbout := True;
  Form2.Position := poOwnerFormCenter;
  Form2.Visible := True;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Clipboard.AsText := LabeledEdit1.Text;
end;

procedure TForm1.TimeEdit1Change(Sender: TObject);
begin

end;

procedure TForm1.Timer1StartTimer(Sender: TObject);
begin
end;

procedure TForm1.Timer1StopTimer(Sender: TObject);
begin
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   timer := FormatDateTime('hh:nn:ss', (Now - myTime) + savedTime);
    LabeledEdit1.Text := timer;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin

end;

procedure TForm1.TrayIcon1Click(Sender: TObject);
begin

end;

end.

