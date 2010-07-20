void ButtonSms()
 {
 }

void Sms()
{
}

void DisableSms()
{
}



/*

void ButtonSms()
 {
  BtnSms.update();
  if (BtnSms.released)
  {
    if(SmsFlag==true)
    {
      SmsFlag=false;
    }
    else
    {
      SmsFlag=true;
    }
  }
  //BtnSms.display();
 }
 


void Sms()
{
    if (SmsFlag)
    {//Sudden Motion Sensor
      DesSpeed = vals[1]*3;     
      InputSpeed.setValue(nf(DesSpeed,3));
      controlP5.controller("bar").setValue(DesSpeed);
      TxIntValue[0] = DesSpeed;
      TxData(0, 'S', 1, 1);
    }
}




void DisableSms()
{
    vals = Unimotion.getSMSArray(); 
   if(-vals[2] > 400 || -vals[2] < 190) // disable SMS if shocked
   {
     Halt();
   }
}

*/

