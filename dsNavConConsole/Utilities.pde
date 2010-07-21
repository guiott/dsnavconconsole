/*-----------------------------------------------------------------------------*/
int Z(float Coord)
{
  // Zoom the graphics 
  float Zoom = 0.8;
  return (int)(Coord * Zoom);
}
/*-----------------------------------------------------------------------------*/
void StandardFont()
{
  fill(255,255,255);
  textFont(CharFont, 15); 
  textAlign(CENTER);
}

/*-----------------------------------------------------------------------------*/
void Delay(int Bytes)
{
   /* wait for data to be received for a time (in ms) proportional to 
      num of bytes: data bytes + TX overhead + RX overhead (Bytes+5+5)
   */
   Bytes += 10;
   int Del= (int)((CharTime * Bytes) + 0.5);
   int StartDelay = millis();
   while ((millis()-StartDelay) < Del);
}

/*-----------------------------------------------------------------------------*/
void LedBlink()
{
  if (BlinkFlag)  // blink green (cycle) led
  {
   image(LedGreenOn,1200,700);
  }
  else
  {
   image(LedGreenOff,1200,700);
  }
    
  if (TxFlag)  // blink red (TX) led
  {
    image(LedRedOn,1230,700);
  }
  else
  {
    image(LedRedOff,1230,700);
    TxTimer = millis();
  }
  if ((millis() - TxTimer) >= TxPeriod)
  {
    TxTimer = millis();
    TxFlag = false;
  }
}

/*-----------------------------------------------------------------------------*/  
int RangeCheckInt(String Data, int Min, int Max)
{
    int IntNum = 0;
    if (Data.length() != 0)
    {
      IntNum = Integer.parseInt(Data);
      if (IntNum < Min) IntNum = Min;
      if (IntNum > Max) IntNum = Max;
    }
    return IntNum;
}

/*-----------------------------------------------------------------------------*/  
float RangeCheckFloat(String Data, float Min, float Max)
{
    float FloatNum = 0;
    if (Data.length() != 0)
    {
      FloatNum = Float.parseFloat(Data);
      if (FloatNum < Min) FloatNum = Min;
      if (FloatNum > Max) FloatNum = Max;
      TxFlag = true;
    }
    return FloatNum;
}

/*-----------------------------------------------------------------------------*/
int Int16toint32 (int Int16)
{
// data coming from micro are in 16 bit int, needs to be converted in 32 bit int
        if (Int16 > 32768)
        {
          Int16 -= 65536;  
        }
        
        return Int16;
}

/*-----------------------------------------------------------------------------*/
void bar(float SlideVel) 
{
  int IntSlideVel=(int)(SlideVel);
  InputSpeed.setValue(nf(IntSlideVel,3));
  controlP5.controller("bar").setValueLabel("");
  TxIntValue[0] = IntSlideVel;
  TxData(0, 'S', 1, 1);
}
