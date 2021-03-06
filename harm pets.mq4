//================== harm_pets.mq4 ==================================/

//================== Declarations ===================================/

//+------------------------------------------------------------------+
//|                                                    harm_pets.mq4 |
//|                                Copyright 2019 github.com/alexvin8|
//+------------------------------------------------------------------+
#property copyright "github.com/alexvin8"
#property link      "https://github.com/alexvin8"
#property version   "1.10"
#property indicator_chart_window
//----
extern   int      Complect=0;
extern   color    test01=clrRoyalBlue; //Color
extern   bool     show_pC        =  false;
extern   bool     show_gartley   =  true;
extern   bool     show_igartley  =  true;
extern   bool     show_bat       =  true;
extern   bool     show_ibat      =  true;
extern   bool     show_butterfly =  true;
extern   bool     show_crab      =  true;
extern   bool     show_deepcrab  =  true;
extern   bool     show_cypher    =  true;
extern   bool     show_shark     =  true;
extern   bool     show_fibo      =  false;
extern   int      x              =  200;
extern   int      y              =  100;
extern   bool     handycode      =  false;
extern   int      code           =  109;
//----   
int
nP1,nP2,nP3,nP4,nH,nL,
pointcode,point_X,point_A,point_B,point_C,
k,m,n,step,
size_fi_1=19,size_fi_2=10,size_fi_3=10;
double
p_X,p_A,p_B,p_C,p_D,
XAB,ABC,BCD,
h_11,h_12,h_21,h_22;
long x_distance,y_distance;
bool up;
datetime Date1,Date2,Date3,Date4;
double
fi_1[]={0,0.382,0.5,0.618,0.786,0.886,1,1.13,1.272,1.38,1.41,1.618,2,2.24,2.618,3,3.14,3.618,4},
fi_2[]={0,0.382,0.5,0.618,0.786,0.886,1,1.13,1.41,1.618},
fi_3[]={1,1.272,1.38,1.618,2,2.24,2.618,3,3.14,3.618};
string
fi_txt_1[]={"0","38","50","62","78","88","100","113","127","138","141","162","200","224","262","300","314","362","400"},
fi_txt_2[]={"0","38","50","62","78","88","100","113","141","162"},
fi_txt_3[]={"1","1.27","1.38","1.62","2","2.24","2.62","3","3.14","3.62"};
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
   Deletion();return(0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int deinit()
  {
   Deletion();return(0);
   Comment("");
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int start()
  {
   int error=GetLastError();
//---- 
   Deletion();
   if(show_pC==false){ObjectDelete("Point4 Complect№"+Complect);}
//----
   if(handycode) pointcode=code;
   else
     {
      switch(Complect)
        {
         case  0: pointcode = 139; break;
         case  1: pointcode = 140; break;
         case  2: pointcode = 141; break;
         case  3: pointcode = 142; break;
         case  4: pointcode = 143; break;
         case  5: pointcode = 144; break;
         case  6: pointcode = 145; break;
         case  7: pointcode = 146; break;
         case  8: pointcode = 147; break;
         case  9: pointcode = 148; break;
         case 10: pointcode = 149; break;
         case 11: pointcode = 128; break;
         case 12: pointcode = 129; break;
         case 13: pointcode = 130; break;
         case 14: pointcode = 131; break;
         case 15: pointcode = 132; break;
         case 16: pointcode = 133; break;
         case 17: pointcode = 134; break;
         case 18: pointcode = 135; break;
         case 19: pointcode = 136; break;
         case 20: pointcode = 137; break;
         case 21: pointcode = 138; break;
         default: pointcode = code;
        }
     }
//----
   datetime dt_1=0,dt_2=0,dt_3=0,dt_4=0;
   double price_1=0,price_2=0,price_3=0,price_4=0;
   int window=0;
   step=20;
   ChartXYToTimePrice(0,x,y,window,dt_1,price_1);
   ChartXYToTimePrice(0,x+step,y,window,dt_2,price_2);
   ChartXYToTimePrice(0,x+2*step,y,window,dt_3,price_3);
   ChartXYToTimePrice(0,x+3*step,y,window,dt_4,price_4);
//----
   if(ObjectFind("Point1 Complect№"+Complect)!=0) ObjectCreate("Point1 Complect№"+Complect, OBJ_ARROW, 0, dt_1, price_1);
   if(ObjectFind("Point2 Complect№"+Complect)!=0) ObjectCreate("Point2 Complect№"+Complect, OBJ_ARROW, 0, dt_2, price_2);
   if(ObjectFind("Point3 Complect№"+Complect)!=0) ObjectCreate("Point3 Complect№"+Complect, OBJ_ARROW, 0, dt_3, price_3);
   if(show_pC){if(ObjectFind("Point4 Complect№"+Complect)!=0) ObjectCreate("Point4 Complect№"+Complect,OBJ_ARROW,0,dt_4,price_4);}
//----   
   ObjectSet("Point1 Complect№"+Complect,OBJPROP_ARROWCODE,pointcode);
   ObjectSet("Point1 Complect№"+Complect,OBJPROP_COLOR,test01);
   ObjectSet("Point1 Complect№"+Complect,OBJPROP_WIDTH,1);
   ObjectSet("Point1 Complect№"+Complect,OBJPROP_BACK,false);
//----   
   ObjectSet("Point2 Complect№"+Complect,OBJPROP_ARROWCODE,pointcode);
   ObjectSet("Point2 Complect№"+Complect,OBJPROP_COLOR,test01);
   ObjectSet("Point2 Complect№"+Complect,OBJPROP_WIDTH,1);
   ObjectSet("Point2 Complect№"+Complect,OBJPROP_BACK,false);
//----   
   ObjectSet("Point3 Complect№"+Complect,OBJPROP_ARROWCODE,pointcode);
   ObjectSet("Point3 Complect№"+Complect,OBJPROP_COLOR,test01);
   ObjectSet("Point3 Complect№"+Complect,OBJPROP_WIDTH,1);
   ObjectSet("Point3 Complect№"+Complect,OBJPROP_BACK,false);
//----   
   if(show_pC)
     {
      ObjectSet("Point4 Complect№"+Complect,OBJPROP_ARROWCODE,pointcode);
      ObjectSet("Point4 Complect№"+Complect,OBJPROP_COLOR,test01);
      ObjectSet("Point4 Complect№"+Complect,OBJPROP_WIDTH,1);
      ObjectSet("Point4 Complect№"+Complect,OBJPROP_BACK,false);
     }
//----      
   Date1=ObjectGet("Point1 Complect№"+Complect,OBJPROP_TIME1);
   Date2=ObjectGet("Point2 Complect№"+Complect,OBJPROP_TIME1);
   Date3=ObjectGet("Point3 Complect№"+Complect,OBJPROP_TIME1);
   if(show_pC){Date4=ObjectGet("Point4 Complect№"+Complect,OBJPROP_TIME1);}
//---- 
   nP1=iBarShift(NULL,0,Date1,false);
   nP2=iBarShift(NULL,0,Date2,false);
   nP3=iBarShift(NULL,0,Date3,false);
   if(show_pC){nP4=iBarShift(NULL,0,Date4,false);}
//----
   nH=iHighest(NULL,0,MODE_HIGH,nP1-nP2+1,nP2);
   nL=iLowest(NULL,0,MODE_LOW,nP1-nP2+1,nP2);
   if(nH>nL){up=true;}else{if(nL>nH){up=false;}}
   if(up)
     {
      point_X=nH;
      point_A=nL;
      point_B=iHighest(NULL,0,MODE_HIGH,nP2-nP3+1,nP3);
      if(show_pC){point_C=iLowest(NULL,0,MODE_LOW,nP3-nP4+1,nP4);}
      else{point_C=iLowest(NULL,0,MODE_LOW,nP3+1,0);}
      p_X=High[point_X];
      p_A=Low[point_A];
      p_B=High[point_B];
      p_C=Low[point_C];
     }
   else
     {
      point_X=nL;
      point_A=nH;
      point_B=iLowest(NULL,0,MODE_LOW,nP2-nP3+1,nP3);
      if(show_pC){point_C=iHighest(NULL,0,MODE_HIGH,nP3-nP4+1,nP4);}
      else{point_C=iHighest(NULL,0,MODE_HIGH,nP3+1,0);}
      p_X=Low[point_X];
      p_A=High[point_A];
      p_B=Low[point_B];
      p_C=High[point_C];
     }
//----
   if(show_fibo)
     {
      FiboLevelsCreate(0,"Fibo1_№"+Complect,0,Time[point_X],p_X,Time[point_X],p_A,clrLightGray,STYLE_SOLID,
                       1,false,false,false,false,0);
      ObjectSet("Fibo1_№"+Complect,OBJPROP_LEVELCOLOR,clrLightGray);
      ObjectSet("Fibo1_№"+Complect,OBJPROP_STYLE,2);
      ObjectSet("Fibo1_№"+Complect,OBJPROP_FIBOLEVELS,size_fi_1);
      for(k=0;k<size_fi_1;k++)
        {
         ObjectSet("Fibo1_№"+Complect,OBJPROP_FIRSTLEVEL+k,fi_1[k]);
         ObjectSetFiboDescription("Fibo1_№"+Complect,k,fi_txt_1[k]);
        }
      if((((p_B-p_C)/(p_B-p_A))>0.382) || (((p_B-p_C)/(p_B-p_A))==0.382))
        {
         FiboLevelsCreate(0,"Fibo2_№"+Complect,0,Time[point_B],p_B,Time[point_B],p_C,clrLightGray,STYLE_SOLID,
                          1,false,false,false,false,0);
         ObjectSet("Fibo2_№"+Complect,OBJPROP_LEVELCOLOR,clrLightGray);
         ObjectSet("Fibo2_№"+Complect,OBJPROP_STYLE,2);
         ObjectSet("Fibo2_№"+Complect,OBJPROP_FIBOLEVELS,size_fi_1);
         for(m=0;m<size_fi_1;m++)
           {
            ObjectSet("Fibo2_№"+Complect,OBJPROP_FIRSTLEVEL+m,fi_1[m]);
            ObjectSetFiboDescription("Fibo2_№"+Complect,m,fi_txt_1[m]);
           }
        }
      FiboLevelsCreate(0,"Fibo3_№"+Complect,0,Time[point_A],p_A,Time[point_A],p_B,clrLightGray,STYLE_SOLID,
                       1,false,false,false,false,0);
      ObjectSet("Fibo3_№"+Complect,OBJPROP_LEVELCOLOR,clrLightGray);
      ObjectSet("Fibo3_№"+Complect,OBJPROP_STYLE,2);
      ObjectSet("Fibo3_№"+Complect,OBJPROP_FIBOLEVELS,size_fi_2);
      for(n=0;n<size_fi_2;n++)
        {
         ObjectSet("Fibo3_№"+Complect,OBJPROP_FIRSTLEVEL+n,fi_2[n]);
         ObjectSetFiboDescription("Fibo3_№"+Complect,n,fi_txt_2[n]);
        }
     }
//----
   TriangleCreate(0,"Tri1_№"+Complect,0,Time[point_X],p_X,Time[point_A],p_A,Time[point_B],p_B,
                  test01,STYLE_DOT,0,false,false,false,false,0);
//----
   XAB=((p_B-p_A)/(p_X-p_A));
   ABC=((p_B-p_C)/(p_B-p_A));
   if(((XAB==0.786) || (XAB>0.786)) && (XAB<0.886)){if(show_butterfly){Butterfly();}}
   if(((XAB==0.382) || (XAB>0.382)) && (XAB<0.618)){if(show_bat)      {Bat();}}
   if(((XAB==0.382) || (XAB>0.382)) && (XAB<0.786)){if(show_crab)     {Crab();}if(show_cypher){Cypher();}}
   if(((XAB==0.886) || (XAB>0.886)) && (XAB<1))    {if(show_deepcrab) {DeepCrab();}}
   if(((XAB==0.618) || (XAB>0.618)) && (XAB<0.786)){if(show_gartley)  {Gartley();}if(show_igartley){IdealGartley();}}
   if(((XAB==0.5)   || (XAB>0.5))   && (XAB<0.618)){if(show_ibat)     {IdealBat();}}
   if((                (XAB>0))     && (XAB<1))    {if(show_shark)    {Shark();}}
//----
   return(0);
  }
//+------------------------------------------------------------------+ 
//| Butterfly pattern                                                |
//+------------------------------------------------------------------+ 
void Butterfly()
  {
   h_11=(p_X-p_A)*0.272+p_X;
   h_12=(p_X-p_A)*0.41+p_X;
   h_21=(p_B-p_C)*0.618+p_B;
   h_22=(p_B-p_C)*0.24+p_B-(p_C-p_B);
//----
   if(((ABC==0.382) || (ABC>0.382)) && (ABC<1))
     {
      if(((h_11>h_21) && (h_11<h_22) && (h_12>h_21) && (h_12<h_22) && (up==true)) ||
         ((h_11<h_21) && (h_11>h_22) && (h_12<h_21) && (h_12>h_22) && (up==false)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec1_№"+Complect,0,Time[point_C],h_11,Time[nP4],h_12,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri21_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text1_№"+Complect,0,Time[nP4],h_11,"butterfly","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text1_№"+Complect,0,Time[nP4],h_11,"butterfly","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec1_№"+Complect,0,Time[point_C],h_11,Time[0],h_12,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri21_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text1_№"+Complect,0,Time[0],h_11," butterfly","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text1_№"+Complect,0,Time[0],h_11," butterfly","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
      if(((h_21>h_11) && (h_21<h_12) && (h_22>h_11) && (h_22<h_12) && (up==true)) ||
         ((h_21<h_11) && (h_21>h_12) && (h_22<h_11) && (h_22>h_12) && (up==false)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec1_№"+Complect,0,Time[point_C],h_21,Time[nP4],h_22,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri21_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text1_№"+Complect,0,Time[nP4],h_21,"butterfly","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text1_№"+Complect,0,Time[nP4],h_21,"butterfly","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec1_№"+Complect,0,Time[point_C],h_21,Time[0],h_22,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri21_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text1_№"+Complect,0,Time[0],h_21," butterfly","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text1_№"+Complect,0,Time[0],h_21," butterfly","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
      if(((h_22<h_12) && (h_22>h_11) && (h_21<h_11) && (up==true)) ||
         ((h_22>h_12) && (h_22<h_11) && (h_21>h_11) && (up==false)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec1_№"+Complect,0,Time[point_C],h_11,Time[nP4],h_22,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri21_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text1_№"+Complect,0,Time[nP4],h_11,"butterfly","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text1_№"+Complect,0,Time[nP4],h_11,"butterfly","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec1_№"+Complect,0,Time[point_C],h_11,Time[0],h_22,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri21_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text1_№"+Complect,0,Time[0],h_11," butterfly","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text1_№"+Complect,0,Time[0],h_11," butterfly","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
      if(((h_21<h_12) && (h_21>h_11) && (h_22>h_12) && (up==true)) ||
         ((h_21>h_12) && (h_21<h_11) && (h_22<h_12) && (up==false)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec1_№"+Complect,0,Time[point_C],h_21,Time[nP4],h_12,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri21_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text1_№"+Complect,0,Time[nP4],h_21,"butterfly","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text1_№"+Complect,0,Time[nP4],h_21,"butterfly","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec1_№"+Complect,0,Time[point_C],h_21,Time[0],h_12,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri21_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text1_№"+Complect,0,Time[0],h_21," butterfly","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text1_№"+Complect,0,Time[0],h_21," butterfly","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
     }
  }
//+------------------------------------------------------------------+ 
//| Bat pattern                                                      |
//+------------------------------------------------------------------+ 
void Bat()
  {
   h_11=(p_X-p_A)*0.886+p_A;
   h_12=p_X;
   h_21=(p_B-p_C)*0.618+p_B;
   h_22=(p_B-p_C)*0.618+2*p_B-p_C;
//----
   if(((ABC==0.382) || (ABC>0.382)) && (ABC<1))
     {
      if(((h_11>h_21) && (h_11<h_22) && (h_12>h_21) && (h_12<h_22)) || 
         ((h_11<h_21) && (h_11>h_22) && (h_12<h_21) && (h_12>h_22)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec2_№"+Complect,0,Time[point_C],h_11,Time[nP4],h_12,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri22_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text2_№"+Complect,0,Time[nP4],h_11,"bat","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text2_№"+Complect,0,Time[nP4],h_11,"bat","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec2_№"+Complect,0,Time[point_C],h_11,Time[0],h_12,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri22_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text2_№"+Complect,0,Time[0],h_11," bat","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text2_№"+Complect,0,Time[0],h_11," bat","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
      if(((h_21>h_11) && (h_21<h_12) && (h_22>h_11) && (h_22<h_12)) || 
         ((h_21<h_11) && (h_21>h_12) && (h_22<h_11) && (h_22>h_12)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec2_№"+Complect,0,Time[point_C],h_21,Time[nP4],h_22,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri22_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text2_№"+Complect,0,Time[nP4],h_21,"bat","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text2_№"+Complect,0,Time[nP4],h_21,"bat","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec2_№"+Complect,0,Time[point_C],h_21,Time[0],h_22,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri22_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text2_№"+Complect,0,Time[0],h_21," bat","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text2_№"+Complect,0,Time[0],h_21," bat","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
      if(((h_22<h_12) && (h_22>h_11) && (h_21<h_11)) || 
         ((h_22>h_12) && (h_22<h_11) && (h_21>h_11)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec2_№"+Complect,0,Time[point_C],h_11,Time[nP4],h_22,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri22_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text2_№"+Complect,0,Time[nP4],h_11,"bat","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text2_№"+Complect,0,Time[nP4],h_11,"bat","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec2_№"+Complect,0,Time[point_C],h_11,Time[0],h_22,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri22_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text2_№"+Complect,0,Time[0],h_11," bat","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text2_№"+Complect,0,Time[0],h_11," bat","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
      if(((h_21<h_12) && (h_21>h_11) && (h_22>h_12)) || 
         ((h_21>h_12) && (h_21<h_11) && (h_22<h_12)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec2_№"+Complect,0,Time[point_C],h_21,Time[nP4],h_12,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri22_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text2_№"+Complect,0,Time[nP4],h_21,"bat","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text2_№"+Complect,0,Time[nP4],h_21,"bat","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec2_№"+Complect,0,Time[point_C],h_21,Time[0],h_12,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri22_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text2_№"+Complect,0,Time[0],h_21," bat","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text2_№"+Complect,0,Time[0],h_21," bat","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
     }
  }
//+------------------------------------------------------------------+ 
//| Crab pattern                                                     |
//+------------------------------------------------------------------+ 
void Crab()
  {
   h_11=(p_X-p_A)*0.618+p_X;
   h_21=(p_B-p_C)*0.618+2*p_B-p_C;
   h_22=(p_B-p_C)*0.618+2*(p_B-p_C)+p_B;
//----
   if(((ABC==0.382) || (ABC>0.382)) && (ABC<1))
     {
      if((((h_11>h_21) || (h_11==h_21)) && ((h_11<h_22) || (h_11==h_22))) ||
         (((h_11<h_21) || (h_11==h_21)) && ((h_11>h_22) || (h_11==h_22))))
        {
         if(show_pC)
           {
            TrendCreate(0,"TL3_№"+Complect,0,Time[point_C],h_11,Time[nP4],h_11,test01,STYLE_SOLID,3,false,false,false,false,false,0);
            TriangleCreate(0,"Tri23_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text3_№"+Complect,0,Time[nP4],h_11,"crab","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text3_№"+Complect,0,Time[nP4],h_11,"crab","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            TrendCreate(0,"TL3_№"+Complect,0,Time[point_C],h_11,Time[0],h_11,test01,STYLE_SOLID,3,false,false,false,false,false,0);
            TriangleCreate(0,"Tri23_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text3_№"+Complect,0,Time[0],h_11," crab","Arial",6,test01,0.0,ANCHOR_LEFT,false,false,false,0);}
            else  {TextCreate(0,"Text3_№"+Complect,0,Time[0],h_11," crab","Arial",6,test01,0.0,ANCHOR_LEFT,false,false,false,0);}
            FiboExpansion();
           }
        }
     }
  }
//+------------------------------------------------------------------+ 
//|  Deep crab pattern                                               |
//+------------------------------------------------------------------+ 
void DeepCrab()
  {
   h_11=(p_X-p_A)*0.618+p_X;
   h_21=2*p_B-p_C;
   h_22=(p_B-p_C)*0.618+2*(p_B-p_C)+p_B;
//----
   if(((ABC==0.382) || (ABC>0.382)) && (ABC<1))
     {
      if((((h_11>h_21) || (h_11==h_21)) && ((h_11<h_22) || (h_11==h_22))) ||
         (((h_11<h_21) || (h_11==h_21)) && ((h_11>h_22) || (h_11==h_22))))
        {
         if(show_pC)
           {
            TrendCreate(0,"TL4_№"+Complect,0,Time[point_C],h_11,Time[nP4],h_11,test01,STYLE_SOLID,3,false,false,false,false,false,0);
            TriangleCreate(0,"Tri24_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text4_№"+Complect,0,Time[nP4],h_11,"deepcrab","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text4_№"+Complect,0,Time[nP4],h_11,"deepcrab","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            TrendCreate(0,"TL4_№"+Complect,0,Time[point_C],h_11,Time[0],h_11,test01,STYLE_SOLID,3,false,false,false,false,false,0);
            TriangleCreate(0,"Tri24_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text4_№"+Complect,0,Time[0],h_11," deepcrab","Arial",6,test01,0.0,ANCHOR_LEFT,false,false,false,0);}
            else  {TextCreate(0,"Text4_№"+Complect,0,Time[0],h_11," deepcrab","Arial",6,test01,0.0,ANCHOR_LEFT,false,false,false,0);}
            FiboExpansion();
           }
        }
     }
  }
//+------------------------------------------------------------------+ 
//|  Gartley pattern                                                 |
//+------------------------------------------------------------------+ 
void Gartley()
  {
   h_11=(p_X-p_A)*0.786+p_A;
   h_12=(p_X-p_A)*0.886+p_A;
   h_21=(p_B-p_C)*0.13+p_B;
   h_22=(p_B-p_C)*0.618+2*p_B-p_C;
//----
   if(((ABC==0.382) || (ABC>0.382)) && (ABC<1))
     {
      if(((h_11>h_21) && (h_11<h_22) && (h_12>h_21) && (h_12<h_22)) || 
         ((h_11<h_21) && (h_11>h_22) && (h_12<h_21) && (h_12>h_22)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec5_№"+Complect,0,Time[point_C],h_11,Time[nP4],h_12,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri25_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text5_№"+Complect,0,Time[nP4],h_11,"gartley","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text5_№"+Complect,0,Time[nP4],h_11,"gartley","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec5_№"+Complect,0,Time[point_C],h_11,Time[0],h_12,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri25_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text5_№"+Complect,0,Time[0],h_11," gartley","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text5_№"+Complect,0,Time[0],h_11," gartley","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
      if(((h_21>h_11) && (h_21<h_12) && (h_22>h_11) && (h_22<h_12)) || 
         ((h_21<h_11) && (h_21>h_12) && (h_22<h_11) && (h_22>h_12)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec5_№"+Complect,0,Time[point_C],h_21,Time[nP4],h_22,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri25_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text5_№"+Complect,0,Time[nP4],h_21,"gartley","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text5_№"+Complect,0,Time[nP4],h_21,"gartley","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec5_№"+Complect,0,Time[point_C],h_21,Time[0],h_22,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri25_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text5_№"+Complect,0,Time[0],h_21," gartley","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text5_№"+Complect,0,Time[0],h_21," gartley","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
      if(((h_22<h_12) && (h_22>h_11) && (h_21<h_11)) || 
         ((h_22>h_12) && (h_22<h_11) && (h_21>h_11)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec5_№"+Complect,0,Time[point_C],h_11,Time[nP4],h_22,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri25_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text5_№"+Complect,0,Time[nP4],h_11,"gartley","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text5_№"+Complect,0,Time[nP4],h_11,"gartley","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec5_№"+Complect,0,Time[point_C],h_11,Time[0],h_22,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri25_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text5_№"+Complect,0,Time[0],h_11," gartley","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text5_№"+Complect,0,Time[0],h_11," gartley","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
      if(((h_21<h_12) && (h_21>h_11) && (h_22>h_12)) || 
         ((h_21>h_12) && (h_21<h_11) && (h_22<h_12)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec5_№"+Complect,0,Time[point_C],h_21,Time[nP4],h_12,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri25_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text5_№"+Complect,0,Time[nP4],h_21,"gartley","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text5_№"+Complect,0,Time[nP4],h_21,"gartley","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec5_№"+Complect,0,Time[point_C],h_21,Time[0],h_12,test01,STYLE_SOLID,1,true,true,false,false,0);
            TriangleCreate(0,"Tri25_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text5_№"+Complect,0,Time[0],h_21," gartley","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text5_№"+Complect,0,Time[0],h_21," gartley","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
     }
  }
//+------------------------------------------------------------------+ 
//|  Ideal Gartley pattern                                           |
//+------------------------------------------------------------------+ 
void IdealGartley()
  {
   h_11=(p_X-p_A)*0.786+p_A;
   h_12=(p_X-p_A)*0.886+p_A;
   h_22=(p_B-p_C)*0.618+2*p_B-p_C;
//----
   if(((ABC==0.618) || (ABC>0.618)) && (ABC<0.786))
     {
      if(((h_22>h_11) && (h_22<h_12)) || 
         ((h_22<h_11) && (h_22>h_12)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec6_№"+Complect,0,Time[point_C],h_11,Time[nP4],h_12,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri26_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_22,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text6_№"+Complect,0,Time[nP4],h_22,"gartley(i)","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text6_№"+Complect,0,Time[nP4],h_22,"gartley(i)","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec6_№"+Complect,0,Time[point_C],h_11,Time[0],h_12,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri26_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_22,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text6_№"+Complect,0,Time[0],h_22," gartley(i)","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text6_№"+Complect,0,Time[0],h_22," gartley(i)","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
     }
  }
//+------------------------------------------------------------------+ 
//|  Ideal Bat pattern                                               |
//+------------------------------------------------------------------+ 
void IdealBat()
  {
   h_11=(p_X-p_A)*0.886+p_A;
   h_12=p_X;
   h_22=2*p_B-p_C;
//----
   if(((ABC==0.5) || (ABC>0.5)) && (ABC<0.786))
     {
      if(((h_22>h_11) && (h_22<h_12)) || 
         ((h_22<h_11) && (h_22>h_12)))
        {
         if(show_pC)
           {
            //RectangleCreate(0,"Rec7_№"+Complect,0,Time[point_C],h_11,Time[nP4],h_12,test01,STYLE_SOLID,1,true,false,false,false,0);
            TrendCreate(0,"TL7_№"+Complect,0,Time[point_C],h_22,Time[nP4],h_22,test01,STYLE_SOLID,3,false,false,false,false,false,0);
            TriangleCreate(0,"Tri27_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_22,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text7_№"+Complect,0,Time[nP4],h_22,"bat(i)","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text7_№"+Complect,0,Time[nP4],h_22,"bat(i)","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            //RectangleCreate(0,"Rec7_№"+Complect,0,Time[point_C],h_11,Time[0],h_12,test01,STYLE_SOLID,1,false,false,false,false,0);
            TrendCreate(0,"TL7_№"+Complect,0,Time[point_C],h_22,Time[nP4],h_22,test01,STYLE_SOLID,3,false,false,false,false,false,0);
            TriangleCreate(0,"Tri27_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_22,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text7_№"+Complect,0,Time[0],h_22," bat(i)","Arial",6,test01,0.0,ANCHOR_LEFT,false,false,false,0);}
            else  {TextCreate(0,"Text7_№"+Complect,0,Time[0],h_22," bat(i)","Arial",6,test01,0.0,ANCHOR_LEFT,false,false,false,0);}
            FiboExpansion();
           }
        }
     }
  }
//+------------------------------------------------------------------+ 
//|  Cypher pattern                                                  |
//+------------------------------------------------------------------+ 
void Cypher()
  {
   h_11=(p_X-p_C)*0.786+p_C;
   h_12=(p_X-p_C)*0.886+p_C;
   h_21=(p_B-p_C)*0.272+p_B;
   h_22=2*p_B-p_C;
//----
   if(((ABC==1.13) || (ABC>1.13)) && (ABC<1.41))
     {
      if(((h_11>h_21) && (h_11<h_22) && (h_12>h_21) && (h_12<h_22)) || 
         ((h_11<h_21) && (h_11>h_22) && (h_12<h_21) && (h_12>h_22)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec8_№"+Complect,0,Time[point_C],h_11,Time[nP4],h_12,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri28_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text8_№"+Complect,0,Time[nP4],h_11,"cypher","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text8_№"+Complect,0,Time[nP4],h_11,"cypher","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec8_№"+Complect,0,Time[point_C],h_11,Time[0],h_12,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri28_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text8_№"+Complect,0,Time[0],h_11," cypher","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text8_№"+Complect,0,Time[0],h_11," cypher","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
      if(((h_21>h_11) && (h_21<h_12) && (h_22>h_11) && (h_22<h_12)) || 
         ((h_21<h_11) && (h_21>h_12) && (h_22<h_11) && (h_22>h_12)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec8_№"+Complect,0,Time[point_C],h_21,Time[nP4],h_22,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri28_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text8_№"+Complect,0,Time[nP4],h_21,"cypher","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text8_№"+Complect,0,Time[nP4],h_21,"cypher","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec8_№"+Complect,0,Time[point_C],h_21,Time[0],h_22,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri28_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text8_№"+Complect,0,Time[0],h_21," cypher","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text8_№"+Complect,0,Time[0],h_21," cypher","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
      if(((h_22<h_12) && (h_22>h_11) && (h_21<h_11)) || 
         ((h_22>h_12) && (h_22<h_11) && (h_21>h_11)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec8_№"+Complect,0,Time[point_C],h_11,Time[nP4],h_22,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri28_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text8_№"+Complect,0,Time[nP4],h_11,"cypher","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text8_№"+Complect,0,Time[nP4],h_11,"cypher","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec8_№"+Complect,0,Time[point_C],h_11,Time[0],h_22,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri28_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_11,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text8_№"+Complect,0,Time[0],h_11," cypher","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text8_№"+Complect,0,Time[0],h_11," cypher","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
      if(((h_21<h_12) && (h_21>h_11) && (h_22>h_12)) || 
         ((h_21>h_12) && (h_21<h_11) && (h_22<h_12)))
        {
         if(show_pC)
           {
            RectangleCreate(0,"Rec8_№"+Complect,0,Time[point_C],h_21,Time[nP4],h_12,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri28_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text8_№"+Complect,0,Time[nP4],h_21,"cypher","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text8_№"+Complect,0,Time[nP4],h_21,"cypher","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            RectangleCreate(0,"Rec8_№"+Complect,0,Time[point_C],h_21,Time[0],h_12,test01,STYLE_SOLID,1,true,false,false,false,0);
            TriangleCreate(0,"Tri28_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text8_№"+Complect,0,Time[0],h_21," cypher","Arial",6,test01,0.0,ANCHOR_LEFT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text8_№"+Complect,0,Time[0],h_21," cypher","Arial",6,test01,0.0,ANCHOR_LEFT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
        }
     }
  }
//+------------------------------------------------------------------+ 
//|  Shark pattern                                                   |
//+------------------------------------------------------------------+ 
void Shark()
  {
   double h_13;
   h_11=(p_X-p_C)*0.886+p_C;
   h_12=p_X;
   h_13=(p_X-p_C)*0.13+p_X;
   h_21=(p_B-p_C)*0.618+p_B;
   h_22=(p_B-p_C)*0.24+p_B-(p_C-p_B);
//----
   if(((ABC==1.13) || (ABC>1.13)) && (ABC<1.618))
     {

      if((((h_21>h_11)||(h_21==h_11)) && ((h_21<h_12)||(h_21==h_12))) ||
         (((h_21<h_11)||(h_21==h_11)) && ((h_21>h_12)||(h_21==h_12))))
        {
         if(show_pC)
           {
            TrendCreate(0,"TL9_№"+Complect,0,Time[point_C],h_21,Time[nP4],h_21,test01,STYLE_SOLID,3,false,false,false,false,false,0);
            TriangleCreate(0,"Tri29_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text9_№"+Complect,0,Time[nP4],h_21,"shark","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text9_№"+Complect,0,Time[nP4],h_21,"shark","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            TrendCreate(0,"TL9_№"+Complect,0,Time[point_C],h_21,Time[0],h_21,test01,STYLE_SOLID,3,false,false,false,false,false,0);
            TriangleCreate(0,"Tri29_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_21,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text9_№"+Complect,0,Time[0],h_21," shark","Arial",6,test01,0.0,ANCHOR_LEFT,false,false,false,0);}
            else  {TextCreate(0,"Text9_№"+Complect,0,Time[0],h_21," shark","Arial",6,test01,0.0,ANCHOR_LEFT,false,false,false,0);}
            FiboExpansion();
           }
        }
      if(((h_22>h_12) && (h_22<h_13)) || 
         ((h_22<h_12) && (h_22>h_13)))
        {
         if(show_pC)
           {
            TrendCreate(0,"TL9_№"+Complect,0,Time[point_C],h_22,Time[nP4],h_22,test01,STYLE_SOLID,3,false,false,false,false,false,0);
            TriangleCreate(0,"Tri29_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[nP4],h_22,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text9_№"+Complect,0,Time[nP4],h_22,"shark","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_LOWER,false,false,false,0);}
            else  {TextCreate(0,"Text9_№"+Complect,0,Time[nP4],h_22,"shark","Arial",6,clrBlack,0.0,ANCHOR_RIGHT_UPPER,false,false,false,0);}
            FiboExpansion();
           }
         else
           {
            TrendCreate(0,"TL9_№"+Complect,0,Time[point_C],h_22,Time[0],h_22,test01,STYLE_SOLID,3,false,false,false,false,false,0);
            TriangleCreate(0,"Tri29_№"+Complect,0,Time[point_B],p_B,Time[point_C],p_C,Time[0],h_22,test01,STYLE_DOT,0,false,false,false,false,0);
            if(up){TextCreate(0,"Text9_№"+Complect,0,Time[0],h_22," shark","Arial",6,test01,0.0,ANCHOR_LEFT,false,false,false,0);}
            else  {TextCreate(0,"Text9_№"+Complect,0,Time[0],h_22," shark","Arial",6,test01,0.0,ANCHOR_LEFT,false,false,false,0);}
            FiboExpansion();
           }
        }
     }
  }
//+------------------------------------------------------------------+ 
//|  Fibo Expansion from point C                                     |
//+------------------------------------------------------------------+ 
void FiboExpansion()
  {
   FiboLevelsCreate(0,"Fibo4_№"+Complect,0,Time[point_C],p_C-p_A+p_B,Time[point_C],
                    p_C,clrNONE,STYLE_DOT,1,false,false,false,false,0);
   ObjectSet("Fibo4_№"+Complect,OBJPROP_LEVELCOLOR,test01);
   ObjectSet("Fibo4_№"+Complect,OBJPROP_STYLE,2);
   ObjectSet("Fibo4_№"+Complect,OBJPROP_FIBOLEVELS,size_fi_3);
   for(k=0;k<size_fi_3;k++)
     {
      ObjectSet("Fibo4_№"+Complect,OBJPROP_FIRSTLEVEL+k,fi_3[k]);
      ObjectSetFiboDescription("Fibo4_№"+Complect,k,fi_txt_3[k]);
     }
  }
//+------------------------------------------------------------------+ 
//|  Delete objects                                                  |
//+------------------------------------------------------------------+ 
void Deletion()
  {
   ObjectDelete("Fibo1_№"+Complect);
   ObjectDelete("Fibo2_№"+Complect);
   ObjectDelete("Fibo3_№"+Complect);
   ObjectDelete("Fibo4_№"+Complect);
   ObjectDelete("Tri1_№"+Complect);
   ObjectDelete("Tri21_№"+Complect);
   ObjectDelete("Tri22_№"+Complect);
   ObjectDelete("Tri23_№"+Complect);
   ObjectDelete("Tri24_№"+Complect);
   ObjectDelete("Tri25_№"+Complect);
   ObjectDelete("Tri26_№"+Complect);
   ObjectDelete("Tri27_№"+Complect);
   ObjectDelete("Tri28_№"+Complect);
   ObjectDelete("Tri29_№"+Complect);
   ObjectDelete("Rec1_№"+Complect);
   ObjectDelete("Rec2_№"+Complect);
   ObjectDelete("Rec3_№"+Complect);
   ObjectDelete("Rec4_№"+Complect);
   ObjectDelete("Rec5_№"+Complect);
   ObjectDelete("Rec6_№"+Complect);
   ObjectDelete("Rec7_№"+Complect);
   ObjectDelete("Rec8_№"+Complect);
   ObjectDelete("TL3_№"+Complect);
   ObjectDelete("TL4_№"+Complect);
   ObjectDelete("TL6_№"+Complect);
   ObjectDelete("TL7_№"+Complect);
   ObjectDelete("TL9_№"+Complect);
   ObjectDelete("Text1_№"+Complect);
   ObjectDelete("Text2_№"+Complect);
   ObjectDelete("Text3_№"+Complect);
   ObjectDelete("Text4_№"+Complect);
   ObjectDelete("Text5_№"+Complect);
   ObjectDelete("Text6_№"+Complect);
   ObjectDelete("Text7_№"+Complect);
   ObjectDelete("Text8_№"+Complect);
   ObjectDelete("Text9_№"+Complect);

  }
//+------------------------------------------------------------------+
//| Cоздает прямоугольник по заданным координатам                    |
//+------------------------------------------------------------------+
bool RectangleCreate(const long            chart_ID=0,        // ID графика
                     const string          name="Rectangle",  // имя прямоугольника
                     const int             sub_window=0,      // номер подокна 
                     datetime              time1=0,           // время первой точки
                     double                price1=0,          // цена первой точки
                     datetime              time2=0,           // время второй точки
                     double                price2=0,          // цена второй точки
                     const color           clr=clrRed,        // цвет прямоугольника
                     const ENUM_LINE_STYLE style=STYLE_SOLID, // стиль линий прямоугольника
                     const int             width=1,           // толщина линий прямоугольника
                     const bool            fill=false,        // заливка прямоугольника цветом
                     const bool            back=false,        // на заднем плане
                     const bool            selection=true,    // выделить для перемещений
                     const bool            hidden=true,       // скрыт в списке объектов
                     const long            z_order=0)         // приоритет на нажатие мышью
  {

   ResetLastError();//--- сбросим значение ошибки
   if(ObjectFind(name)==-1)//--- создадим прямоугольник по заданным координатам
      ObjectCreate(chart_ID,name,OBJ_RECTANGLE,sub_window,time1,price1,time2,price2);
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);             //--- установим цвет прямоугольника
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);           //--- установим стиль линий прямоугольника
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);           //--- установим толщину линий прямоугольника
   ObjectSetInteger(chart_ID,name,OBJPROP_FILL,fill);             //--- включим (true) или отключим (false) режим заливки прямоугольника
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);             //--- отобразим на переднем (false) или заднем (true) плане 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);  //--- включим (true) или отключим (false) режим выделения прямоугольника для перемещений
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);    //--- при создании графического объекта функцией ObjectCreate, по умолчанию объект
//--- нельзя выделить и перемещать. Внутри же этого метода параметр selection
//--- по умолчанию равен true, что позволяет выделять и перемещать этот объект
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);         //--- скроем (true) или отобразим (false) имя графического объекта в списке объектов
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);        //--- установим приоритет на получение события нажатия мыши на графике
   return(true);
  }
//+------------------------------------------------------------------+ 
//| Create triangle by the given coordinates                         | 
//+------------------------------------------------------------------+ 
bool TriangleCreate(const long            chart_ID=0,        // chart's ID 
                    const string          name="Triangle",   // triangle name 
                    const int             sub_window=0,      // subwindow index  
                    datetime              time1=0,           // first point time 
                    double                price1=0,          // first point price 
                    datetime              time2=0,           // second point time 
                    double                price2=0,          // second point price 
                    datetime              time3=0,           // third point time 
                    double                price3=0,          // third point price 
                    const color           clr=clrRed,        // triangle color 
                    const ENUM_LINE_STYLE style=STYLE_SOLID, // style of triangle lines 
                    const int             width=1,           // width of triangle lines 
                    const bool            fill=false,        // filling triangle with color 
                    const bool            back=false,        // in the background 
                    const bool            selection=true,    // highlight to move 
                    const bool            hidden=true,       // hidden in the object list 
                    const long            z_order=0)         // priority for mouse click 
  {

//ChangeTriangleEmptyPoints(time1,price1,time2,price2,time3,price3); //--- set anchor points' coordinates if they are not set 
   ResetLastError();//--- reset the error value 
   if(!ObjectCreate(chart_ID,name,OBJ_TRIANGLE,sub_window,time1,price1,time2,price2,time3,price3))//--- create triangle by the given coordinates 
     {
      Print(__FUNCTION__,
            ": failed to create a triangle! Error code = ",GetLastError());
      return(false);
     }
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);//--- set triangle color 
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);//--- set style of triangle lines 
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);//--- set width of triangle lines 
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);//--- display in the foreground (false) or background (true) 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);//--- enable (true) or disable (false) the mode of highlighting the triangle for moving 
//--- when creating a graphical object using ObjectCreate function, the object cannot be 
//--- highlighted and moved by default. Inside this method, selection parameter 
//--- is true by default making it possible to highlight and move the object    
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);//--- hide (true) or display (false) graphical object name in the object list 
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);//--- set the priority for receiving the event of a mouse click in the chart 
   return(true);//--- successful execution 
  }
//+------------------------------------------------------------------+ 
//| Create Fibonacci Retracement by the given coordinates            | 
//+------------------------------------------------------------------+ 
bool FiboLevelsCreate(const long            chart_ID=0,        // chart's ID 
                      const string          name="FiboLevels", // object name 
                      const int             sub_window=0,      // subwindow index  
                      datetime              time1=0,           // first point time 
                      double                price1=0,          // first point price 
                      datetime              time2=0,           // second point time 
                      double                price2=0,          // second point price 
                      const color           clr=clrRed,        // object color 
                      const ENUM_LINE_STYLE style=STYLE_SOLID, // object line style 
                      const int             width=1,           // object line width 
                      const bool            back=false,        // in the background 
                      const bool            selection=true,    // highlight to move 
                      const bool            ray_right=false,   // object's continuation to the right 
                      const bool            hidden=true,       // hidden in the object list 
                      const long            z_order=0)         // priority for mouse click 
  {
// ChangeFiboLevelsEmptyPoints(time1,price1,time2,price2); //--- set anchor points' coordinates if they are not set 
   ResetLastError();//--- reset the error value 
   if(!ObjectCreate(chart_ID,name,OBJ_FIBO,sub_window,time1,price1,time2,price2))//--- Create Fibonacci Retracement by the given coordinates 
     {
      Print(__FUNCTION__,
            ": failed to create \"Fibonacci Retracement\"! Error code = ",GetLastError());
      return(false);
     }
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);//--- set color 
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);//--- set line style 
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);//--- set line width 
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);//--- display in the foreground (false) or background (true) 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);//--- enable (true) or disable (false) the mode of highlighting the channel for moving 
//--- when creating a graphical object using ObjectCreate function, the object cannot be 
//--- highlighted and moved by default. Inside this method, selection parameter 
//--- is true by default making it possible to highlight and move the object    
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);//--- enable (true) or disable (false) the mode of continuation of the object's display to the right 
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);//--- hide (true) or display (false) graphical object name in the object list 
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);//--- set the priority for receiving the event of a mouse click in the chart 
   return(true);//--- successful execution 
  }
//+------------------------------------------------------------------+ 
//| Set number of levels and their parameters                        | 
//+------------------------------------------------------------------+ 
bool FiboLevelsSet(int             levels,            // number of level lines 
                   double          &values[],         // values of level lines 
                   color           &colors[],         // color of level lines 
                   ENUM_LINE_STYLE &styles[],         // style of level lines 
                   int             &widths[],         // width of level lines 
                   const long      chart_ID=0,        // chart's ID 
                   const string    name="FiboLevels") // object name 
  {
   if(levels!=ArraySize(colors) || levels!=ArraySize(styles) || //--- check array sizes 
      levels!=ArraySize(widths) || levels!=ArraySize(widths))
     {
      Print(__FUNCTION__,": array length does not correspond to the number of levels, error!");
      return(false);
     }
   ObjectSetInteger(chart_ID,name,OBJPROP_LEVELS,levels);//--- set the number of levels 
   for(int i=0;i<levels;i++)//--- set the properties of levels in the loop 
     {
      ObjectSetDouble(chart_ID,name,OBJPROP_LEVELVALUE,i,values[i]);   //--- level value 
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELCOLOR,i,colors[i]);  //--- level color 
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELSTYLE,i,styles[i]);   //--- level style 
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELWIDTH,i,widths[i]);  //--- level width 
      ObjectSetString(chart_ID,name,OBJPROP_LEVELTEXT,i,DoubleToString(100*values[i],1));    //--- level description 
     }
   return(true);//--- successful execution 
  }
//+------------------------------------------------------------------+
//| Создает линию тренда по заданным координатам                     |
//+------------------------------------------------------------------+
bool TrendCreate(const long            chart_ID=0,        // ID графика
                 const string          name="TrendLine",  // имя линии
                 const int             sub_window=0,      // номер подокна
                 datetime              time1=0,           // время первой точки
                 double                price1=0,          // цена первой точки
                 datetime              time2=0,           // время второй точки
                 double                price2=0,          // цена второй точки
                 const color           clr=clrRed,        // цвет линии
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // стиль линии
                 const int             width=1,           // толщина линии
                 const bool            back=false,        // на заднем плане
                 const bool            selection=true,    // выделить для перемещений
                 const bool            ray_left=false,    // продолжение линии влево
                 const bool            ray_right=false,   // продолжение линии вправо
                 const bool            hidden=true,       // скрыт в списке объектов
                 const long            z_order=0)         // приоритет на нажатие мышью
  {
   ResetLastError();//--- сбросим значение ошибки
   if(ObjectFind(name)==-1)//--- создадим трендовую линию по заданным координатам
      ObjectCreate(chart_ID,name,OBJ_TREND,sub_window,time1,price1,time2,price2);
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);             //--- установим цвет линии
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);           //--- установим стиль отображения линии
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);           //--- установим толщину линии
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);             //--- отобразим на переднем (false) или заднем (true) плане
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);  //--- включим (true) или отключим (false) режим перемещения линии мышью
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);    //--- при создании графического объекта функцией ObjectCreate, по умолчанию объект
//--- нельзя выделить и перемещать. Внутри же этого метода параметр selection
//--- по умолчанию равен true, что позволяет выделять и перемещать этот объект
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_LEFT,ray_left);     //--- включим (true) или отключим (false) режим продолжения отображения линии влево
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);   //--- включим (true) или отключим (false) режим продолжения отображения линии вправо
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);         //--- скроем (true) или отобразим (false) имя графического объекта в списке объектов
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);        //--- установим приоритет на получение события нажатия мыши на графике
   return(true);
  }
//+------------------------------------------------------------------+ 
//| Creating Text object                                             | 
//+------------------------------------------------------------------+ 
bool TextCreate(const long              chart_ID=0,               // chart's ID 
                const string            name="Text",              // object name 
                const int               sub_window=0,             // subwindow index 
                datetime                time=0,                   // anchor point time 
                double                  price=0,                  // anchor point price 
                const string            text="Text",              // the text itself 
                const string            font="Arial",             // font 
                const int               font_size=10,             // font size 
                const color             clr=clrRed,               // color 
                const double            angle=0.0,                // text slope 
                const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // anchor type 
                const bool              back=false,               // in the background 
                const bool              selection=false,          // highlight to move 
                const bool              hidden=true,              // hidden in the object list 
                const long              z_order=0)                // priority for mouse click 
  {
//ChangeTextEmptyPoint(time,price); //--- set anchor point coordinates if they are not set 
   ResetLastError();//--- reset the error value 
   if(!ObjectCreate(chart_ID,name,OBJ_TEXT,sub_window,time,price))//--- create Text object 
     {
      Print(__FUNCTION__,
            ": failed to create \"Text\" object! Error code = ",GetLastError());
      return(false);
     }
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);//--- set the text 
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);//--- set text font 
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);//--- set font size 
   ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);//--- set the slope angle of the text 
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);//--- set anchor type 
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);//--- set color 
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);//--- display in the foreground (false) or background (true) 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);//--- enable (true) or disable (false) the mode of moving the object by mouse 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);//--- hide (true) or display (false) graphical object name in the object list 
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);//--- set the priority for receiving the event of a mouse click in the chart 
   return(true);//--- successful execution 
  }
//+------------------------------------------------------------------+
