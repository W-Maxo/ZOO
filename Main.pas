unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, RzPanel, Buttons;

 type
   TPoint     = record
                X : longint;
                Y : longint;
   end;

   TTile      = record
                TerrType : byte;
                Status   : byte;
                value    : real;
                gval     : real;
                hval     : real;
                fval     : real;
                Prev     : TPoint;
   end;

  TPredVictim = record
    TagPred, TagVictim : integer;
  end;

  TMap     = array[0..101,0..101] of TTile;

  TxDraw   = procedure(oldcordX, oldcordY, cordX, cordY, rType : integer) of object;
  TSimpAnimal = class
  protected
    FOnTmrAdd     : TxDraw;
  public
    oldcord,
    cord          : TPoint;

    Tag           : integer;

    Map           : TMap;

    name,
    colour        : string;

		weight,
    growth        : double;

		strength,
    agiliti,
    reticence,
    intelligence  : double;

  published
    property OnTmrAdd : TxDraw read FOnTmrAdd write FOnTmrAdd;
 end;

 TAnimal = class(TSimpAnimal)
 public
    xType         : integer;
    procedure Move;
 constructor Create(rType : integer);
 end;

  TMyZoo = class
    ListBox1,
    ListBox2,
    ListBox3    : TListBox;
    idcnt       : integer;
    xTimer      : TTimer;
    xZoo        : Array of TAnimal;
    Count       : integer;

    Map         : TMap;
    TypeAction  : byte;
    Src,Dst     : TPoint;
    Mode        : byte;
    Modify      : boolean;

    xHolst      : TImage;

    procedure OnTimer(Sender : TObject);
    procedure ReDrawMapXY(i,j: integer);
    procedure xReDrawMapXY(oldcordX, oldcordY, cordX, cordY, rType : integer);

    public
      procedure DrawMap;
      procedure Add(rType : integer);
      procedure Kill(pos : integer);

      procedure DoAction(MapX, MapY: integer);
    constructor Create(Holst : TImage; List1, List2, List3 : TlistBox);
  end;

  TForm1 = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    GroupBox2: TGroupBox;
    ListBox2: TListBox;
    GroupBox3: TGroupBox;
    ListBox3: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private

  public

    Zoo : TMyZoo;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  ttWall        = 0;
  ttType1       = 1;
  ttType2       = 2;
  ttType3       = 3;
  ttType4       = 4;
  ttType5       = 5;
  ttClear       = 6;

  MaxX          = 56;
  MaxY          = 56;

  Start         = 1;
  Finish        = 2;
  Wall          = 3;
  Erase         = 6;

  Type1         = 1;
  Type2         = 2;
  Type3         = 3;
  Type4         = 4;
  Type5         = 5;


  mPlace        = 1;
  mNone         = 2;

  NullPoint : TPoint = (X:0;Y:0);

  TerrColors : array [0..6] of TColor = (clHighlight, clLime, $000080FF, clHotLight, $CCCCCC, $DDDDDD, clWhite);

  StatusColors : array [1..6] of TColor = (clGreen, clBlack, clRed, $00BB00, clGreen, clWhite);

  Courses : array [1..8] of TPoint=((X:0;Y:-1),(X:1;Y:-1),(X:1;Y:0 ),(X:1;Y:1),
                                    (X:0;Y:1 ),(X:-1;Y:1),(X:-1;Y:0),(X:-1;Y:-1));

function MyRandom(x : integer) : integer;
var
  i   : integer;

  rnd : array[0..99] of integer;
begin
  Randomize;

  for i := 0 to 99 do
    begin
      rnd[i]:=0;
      while rnd[i] = 0 do rnd[i]:=Random(x * 10) mod 10;
    end;

   Result:=rnd[Random(99)];
end;

constructor TMyZoo.Create(Holst : TImage; List1, List2, List3 : TlistBox);
var
  i, j : integer;
begin
  xHolst  :=Holst;

  ListBox1:=List1;
  ListBox2:=List2;
  ListBox3:=List3;

  Modify  :=False;
  Src     :=NullPoint;
  Dst     :=NullPoint;

  for i:=1 to MaxX do
    for j:=1 to MaxY do
      begin
        Map[i, j].TerrType:=ttClear;
        Map[i, j].Value:=1;
      end;

  for i:=0 to MaxX+1 do
    begin
      Map[i, 0].TerrType:=ttWall;
      Map[0, i].TerrType:=ttWall;
      Map[i, MaxY + 1].TerrType:=ttWall;
      Map[MaxX + 1, i].TerrType:=ttWall;
    end;

  DrawMap;

  xTimer:=TTimer.Create(Application);
  xTimer.OnTimer:=onTimer;
  xTimer.Interval:=50;
  xTimer.Enabled:=True;
end;

function CmpTpoint(a, b : TPoint) : boolean;
begin
  if (a.X = b.X) and (a.Y = b.Y) then Result :=True
      else Result :=False;
end;

procedure TMyZoo.OnTimer(Sender : TObject);
var
  i, j, Tm, c, v          : integer;
  ForKill, DestForKill    : Array of TPredvictim;
  LnList                  : TListBox;
begin
  for i := 0 to Count - 1 do xZoo[i].Move;

  for i := 0 to Count - 1 do
    begin
      if (Map[xZoo[i].cord.X, xZoo[i].cord.Y].TerrType = Type1) and ((xZoo[i].xType = 0) or (xZoo[i].xType = 1)) then
        begin
          xZoo[i].weight:=xZoo[i].weight + (xZoo[i].weight * 0.005) + 0.001;
          xZoo[i].strength:=xZoo[i].strength + (xZoo[i].strength * 0.005) + 0.001;
        end;

      if (Map[xZoo[i].cord.X, xZoo[i].cord.Y].TerrType = Type2) then
        begin
          xZoo[i].agiliti:=xZoo[i].agiliti + (xZoo[i].agiliti * 0.006) + 0.001;
          xZoo[i].intelligence:=xZoo[i].intelligence + (xZoo[i].intelligence * 0.004) + 0.001;
          xZoo[i].reticence:=xZoo[i].reticence + (xZoo[i].reticence * 0.003) + 0.001;
        end;

      if (Map[xZoo[i].cord.X, xZoo[i].cord.Y].TerrType = Type3) then
        begin
          xZoo[i].growth:=xZoo[i].growth + (xZoo[i].growth * 0.002) + 0.001;
        end;

      xZoo[i].weight:=xZoo[i].weight - (MyRandom(9) / 1000);
      if xZoo[i].weight <=0 then Kill(i);
    end;

  for i := 0 to Count - 1 do
    for j := 0 to Count - 1 do
      begin
        if CmpTpoint(xZoo[i].cord, xZoo[j].cord) and (i <> j) then
          begin
            if (((xZoo[i].xType <> 0) and
                ((xZoo[j].xType = 0) or
                 (xZoo[j].xType = 2))) and
                 (xZoo[i].xType <> xZoo[j].xType)) or
                ((xZoo[j].xType = 1) and
                 (xZoo[i].xType = 1)) then
              begin
                if (MyRandom(9) > 5) then
                    begin
                      SetLength(ForKill, Length(ForKill) + 1);
                      ForKill[Length(ForKill) - 1].TagVictim:=xZoo[j].Tag;
                      ForKill[Length(ForKill) - 1].TagPred:=xZoo[i].Tag;
                    end
                  else
                    begin
                      xZoo[j].intelligence:=xZoo[i].intelligence + (xZoo[i].intelligence * 0.2);
                      xZoo[j].weight:=xZoo[i].weight - (xZoo[i].weight * 0.5);

                      xZoo[i].intelligence:=xZoo[i].intelligence - (xZoo[i].intelligence * 0.05);
                      xZoo[i].weight:=xZoo[i].weight - (xZoo[i].weight * 0.5);
                      xZoo[i].agiliti:=xZoo[j].agiliti + (xZoo[j].agiliti * 0.1);
                      xZoo[i].reticence:=xZoo[j].reticence + (xZoo[j].reticence * 0.15);
                    end;
              end;
            if (((xZoo[j].xType <> 0) and
                ((xZoo[i].xType = 0) or
                 (xZoo[i].xType = 2))) and
                 (xZoo[j].xType <> xZoo[i].xType)) or
                ((xZoo[j].xType = 1) and
                 (xZoo[i].xType = 1)) then
              begin
                if (MyRandom(9) > 5) then
                    begin
                      SetLength(ForKill, Length(ForKill) + 1);
                      ForKill[Length(ForKill) - 1].TagVictim:=xZoo[i].Tag;
                      ForKill[Length(ForKill) - 1].TagPred:=xZoo[j].Tag;
                    end
                  else
                    begin
                      xZoo[i].intelligence:=xZoo[i].intelligence + (xZoo[i].intelligence * 0.2);
                      xZoo[i].weight:=xZoo[i].weight - (xZoo[i].weight * 0.5);

                      xZoo[j].intelligence:=xZoo[i].intelligence - (xZoo[i].intelligence * 0.05);
                      xZoo[j].weight:=xZoo[i].weight - (xZoo[i].weight * 0.5);
                      xZoo[j].agiliti:=xZoo[j].agiliti + (xZoo[j].agiliti * 0.1);
                      xZoo[j].reticence:=xZoo[j].reticence + (xZoo[j].reticence * 0.15);
                    end;
              end;
          end;
      end;

  if Length(ForKill) > 0 then
      begin
        Beep;

       for i := 0 to Length(ForKill)- 1 do
        for j := 0 to Count - 1 do
          begin
            if ForKill[i].TagVictim = xZoo[j].Tag then
              begin

                for c := 0 to Length(ForKill)- 1 do
                  for v := 0 to Count - 1 do
                    begin
                      if ForKill[c].TagPred = xZoo[v].Tag then
                          begin
                            xZoo[v].weight:=xZoo[v].weight + (xZoo[j].weight * 0.05);
                            xZoo[v].strength:=xZoo[v].strength + (xZoo[j].strength * 0.1);
                          end;
                    end;
                Kill(j);
                break;
              end;
          end;
      end;

  Form1.ListBox1.Items.BeginUpdate;
  Form1.ListBox2.Items.BeginUpdate;
  Form1.ListBox3.Items.BeginUpdate;

  Form1.ListBox1.Clear;
  Form1.ListBox2.Clear;
  Form1.ListBox3.Clear;

  for i := 0 to Count - 1 do
    begin
      case xZoo[i].xType of
        0: LnList:=ListBox1;
        1: LnList:=ListBox2;
        2: LnList:=ListBox3;
      end;

      LnList.AddItem('Вес: ' + FloatToStrF(xZoo[i].weight, ffFixed, 6, 2) +
                     ' Инт: ' + FloatToStrF(xZoo[i].intelligence, ffFixed, 6, 2) +
                     ' Ловк: ' + FloatToStrF(xZoo[i].agiliti, ffFixed, 6, 2) +
                     ' Сила: ' + FloatToStrF(xZoo[i].strength, ffFixed, 6, 2) +
                     ' Рост: ' + FloatToStrF(xZoo[i].growth, ffFixed, 6, 2), self);
    end;

  Form1.ListBox1.Items.EndUpdate;
  Form1.ListBox2.Items.EndUpdate;
  Form1.ListBox3.Items.EndUpdate;
end;

procedure TMyZoo.Kill(pos : integer);
var
  i : integer;
begin
  Map[xZoo[pos].oldcord.X, xZoo[pos].oldcord.Y].Status:=6;
  ReDrawMapXY(xZoo[pos].oldcord.X, xZoo[pos].oldcord.Y);

  Map[xZoo[pos].cord.X, xZoo[pos].cord.Y].Status:=6;
  Modify:=True;

  ReDrawMapXY(xZoo[pos].cord.X, xZoo[pos].cord.Y);

  xZoo[pos].Free;

  for i := pos to Count - 2 do
    xZoo[i]:=xZoo[i + 1];

  Count:=Count - 1;
  SetLength(xZoo, Count);
end;

procedure TMyZoo.ReDrawMapXY(i,j: integer);
var  A : TRect;

begin
  A.Left    :=(i - 1) * 10 + 1;
  A.Top     :=(j - 1) * 10 + 1;
  A.Right   :=i * 10;
  A.Bottom  :=j * 10;

  xHolst.Canvas.Brush.Color:=TerrColors[Map[i, j].TerrType];
  xHolst.Canvas.Brush.Style:=bsSolid;
  xHolst.Canvas.FillRect(A);

  xHolst.Canvas.Pen.Width:=2;
  xHolst.Canvas.Pen.Color:=StatusColors[Map[i, j].Status];
  xHolst.Canvas.Brush.Color:=StatusColors[Map[i, j].Status];
  xHolst.Canvas.Ellipse(A.Left + 2, A.Top + 2, A.Right - 2,A.Bottom - 2);
end;

procedure TMyZoo.xReDrawMapXY(oldcordX, oldcordY, cordX, cordY, rType : integer);
begin
  Map[oldcordX, oldcordY].Status:=6;
  ReDrawMapXY(oldcordX,oldcordY);

  Map[cordX, cordY].Status:=rType + 1;

  ReDrawMapXY(cordX, cordY);
end;

procedure TMyZoo.Add(rType : integer);
begin
  inc(Count);
  SetLength(xZoo, Count);

  xZoo[Count - 1]:=TAnimal.Create(rType);
  xZoo[Count - 1].OnTmrAdd:=xReDrawMapXY;

  inc(idcnt);

  xZoo[Count - 1].Tag:=idcnt;
end;

constructor TAnimal.Create(rType : integer);
begin
  Randomize;

  xType:=rType;

  cord.X:=Random(MaxX);
  cord.Y:=Random(MaxY);

  if xType = 0 then
      begin
        weight        :=45 + MyRandom(9);
        agiliti       :=10 + MyRandom(3);
        strength      :=50 + MyRandom(8);
        intelligence  :=10 + MyRandom(5);
        growth        :=35 + MyRandom(5);
      end
    else
      begin
        weight        :=20 + MyRandom(9);
        agiliti       :=20 + MyRandom(5);
        strength      :=10 + MyRandom(6);
        intelligence  :=30 + MyRandom(5);
        growth        :=25 + MyRandom(5);
      end;
end;

procedure TAnimal.Move;
var
  rch, i: integer;

  rnd : array[0..99] of integer;

  label xd;
begin
  oldcord:=cord;

   xd:
   rch:=MyRandom(8);

   cord.X:=oldcord.X + Courses[rch].X;
   cord.Y:=oldcord.Y + Courses[rch].Y;

   if MaxX + 1 <= cord.X then GoTo xd;
   if MaxY + 1 <= cord.Y then GoTo xd;

   if 0 >= cord.X then GoTo xd;
   if 0 >= cord.Y then GoTo xd;

  if Assigned(FOnTmrAdd) then
   begin
     OnTmrAdd(oldcord.X,oldcord.Y, cord.X, cord.Y, xType);
   end;
end;


procedure TMyZoo.DrawMap;
var i,j : byte;
begin
 for i:=1 to MaxX do
  for j:=1 to MaxY do ReDrawMapXY(i, j);
 xHolst.Canvas.Pen.Width:=1;
 xHolst.Canvas.Pen.Color:=clBlack;
 for i:=0 to MaxX + 1 do
  begin
   //xHolst.Canvas.MoveTo(0, i * 10);
   //xHolst.Canvas.LineTo(560, i * 10);
   //xHolst.Canvas.MoveTo(i * 10, 0);
   //xHolst.Canvas.LineTo(i * 10, 560);
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Zoo.TypeAction:=Erase;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Zoo.TypeAction:=Type1;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  Zoo.TypeAction:=Type2;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  Zoo.TypeAction:=Type3;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i,j : byte;
begin
  Zoo:=TMyZoo.Create(Image1, ListBox1, ListBox2, ListBox3);
end;

procedure TMyZoo.DoAction(MapX, MapY: integer);
begin
    case TypeAction of
     Erase  : begin
               if (MapX <> Src.x) or (MapY <> Src.y) or
                  (MapX <> Dst.x) or (MapY <> Dst.y)
                then
                 Map[MapX,MapY].TerrType:=ttClear;

               Map[MapX, MapY].value:=1;
               ReDrawMapXY(MapX, MapY);
              end;
     Type1:
              begin
                Map[MapX, MapY].TerrType:=ttType1;
                Map[MapX, MapY].value:=20;
                Modify:=True;
              end;
     Type2:
              begin
                Map[MapX, MapY].TerrType:=ttType2;
                Map[MapX, MapY].value:=15;
                Modify:=True;
              end;
     Type3:
              begin
                Map[MapX, MapY].TerrType:=ttType3;
                Map[MapX, MapY].value:=10;
                Modify:=True;
              end;
    end;
    ReDrawMapXY(MapX, MapY);
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  MapX, MapY: integer;
begin
  MapX:=X div 10 + 1;
  MapY:=Y div 10 + 1;
  if (MapX > 0) and (MapY > 0) and (MapX <= MaxX) and (MapY <= MaxY) then
   if Button = mbLeft then
    begin
      Zoo.DoAction(MapX, MapY);
  end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  MapX, MapY: integer;
begin
  MapX:=X div 10 + 1;
  MapY:=Y div 10 + 1;
  if (MapX > 0) and (MapY > 0) and (MapX <= MaxX) and (MapY <= MaxY) then
   if ssLeft in Shift then
    begin
      Zoo.DoAction(MapX, MapY);
    end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Zoo.Add(0);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  Zoo.Add(1);
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  Zoo.Add(2);
end;

end.
