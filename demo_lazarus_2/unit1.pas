unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  attabs;

type

  { TForm1 }

  TForm1 = class(TForm)
    chkFullColor: TCheckBox;
    chkFlat: TCheckBox;
    chkEmptyBtns: TCheckBox;
    chkPosTop: TRadioButton;
    chkPosBottom: TRadioButton;
    chkPosLeft: TRadioButton;
    chkPosRight: TRadioButton;
    procedure chkEmptyBtnsChange(Sender: TObject);
    procedure chkFlatChange(Sender: TObject);
    procedure chkFullColorChange(Sender: TObject);
    procedure chkPosBottomChange(Sender: TObject);
    procedure chkPosLeftChange(Sender: TObject);
    procedure chkPosRightChange(Sender: TObject);
    procedure chkPosTopChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure TabPlusClick(Sender: TObject);

  public
    t: TATTabs;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

const
  cSizeX = 160;
  cSizeY = 33;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  t:= TATTabs.Create(Self);
  t.Parent:= Self;
  t.Align:= alTop;

  t.OptMouseDragEnabled:= true;
  t.DragMode:= dmAutomatic;
  t.OnTabPlusClick:= @TabPlusClick;

  t.AddTab(-1, 'tab0', nil, true, clGreen);
  t.AddTab(-1, 'tab1', nil, true, clYellow);
  t.AddTab(-1, 'tab2');
end;

procedure TForm1.TabPlusClick(Sender: TObject);
begin
  t.AddTab(-1, 'tab'+IntToStr(t.TabCount));
end;

procedure TForm1.chkPosTopChange(Sender: TObject);
begin
  t.Align:= alTop;
  t.OptPosition:= tabPositionTop;
  t.Height:= cSizeY;
  t.Invalidate;
end;

procedure TForm1.chkPosBottomChange(Sender: TObject);
begin
  t.Align:= alBottom;
  t.OptPosition:= tabPositionBottom;
  t.Height:= cSizeY;
  t.Invalidate;
end;

procedure TForm1.chkEmptyBtnsChange(Sender: TObject);
begin
  if chkEmptyBtns.Checked then
    t.OptButtonLayout:= ''
  else
    t.OptButtonLayout:= '<>,v';
  t.Invalidate;
end;

procedure TForm1.chkFlatChange(Sender: TObject);
begin
  t.OptShowFlat:= chkFlat.Checked;
  t.Invalidate;
end;

procedure TForm1.chkFullColorChange(Sender: TObject);
begin
  t.OptShowEntireColor:= chkFullColor.Checked;
  t.Invalidate;
end;

procedure TForm1.chkPosLeftChange(Sender: TObject);
begin
  t.Align:= alLeft;
  t.OptPosition:= tabPositionLeft;
  t.Width:= cSizeX;
  t.Invalidate;
end;

procedure TForm1.chkPosRightChange(Sender: TObject);
begin
  t.Align:= alRight;
  t.OptPosition:= tabPositionRight;
  t.Width:= cSizeX;
  t.Invalidate;
end;

end.

