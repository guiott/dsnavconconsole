/*-----------------------------------------------------------------------------*/
void SimulationDrawing()
{// just for simulation
    DeltaDist = (MesSpeed * CyclePeriod) / 1000; 
    Distance += DeltaDist;
    DeltaX = DeltaDist * (sin(MesAngle + HALF_PI));
    DeltaY = DeltaDist * (cos(MesAngle + HALF_PI));
    Graph(DeltaX+PrevXtmp,DeltaY+PrevYtmp);
    Xpos=DeltaX+PrevXtmp;
    Ypos=DeltaY+PrevYtmp;
    PrevXtmp = DeltaX+PrevXtmp;
    PrevYtmp = DeltaY+PrevYtmp;
}

void SimulationRxAll()
{
// just for simulation      
      RxBuff[0] = '@';
      RxBuff[1] = 0;
      RxBuff[2] = 'A';
      RxBuff[3] = 11;
      RxBuff[4] = 0;
      RxBuff[5] = 0;
      RxBuff[6] = 0;
      RxBuff[7] = 0;
      RxBuff[8] = 0;
      RxBuff[9] = 0;
      RxBuff[10] = 0;
      RxBuff[11] = 0;
      RxBuff[12] = 0;
      RxBuff[13] = 0;
      RxBuff[14] = -116;
}

void SimulationRxVer()
{
// just for simulation      
      RxBuff[0] = '@';
      RxBuff[1] = 0;
      RxBuff[2] = 'R';
      RxBuff[3] = 28;
      RxBuff[4] = 'd';
      RxBuff[5] = 's';
      RxBuff[6] = 'O';
      RxBuff[7] = 'D';
      RxBuff[8] = 'O';
      RxBuff[9] = ' ';
      RxBuff[10] ='1';
      RxBuff[11] ='.';
      RxBuff[12] ='0';
      RxBuff[13] ='.';
      RxBuff[14] ='0';
      RxBuff[15] =' ';
      RxBuff[16] ='b';
      RxBuff[17] ='y';
      RxBuff[18] =' ';
      RxBuff[19] ='G';
      RxBuff[20] ='u';
      RxBuff[21] ='i';
      RxBuff[22] ='o';
      RxBuff[23] ='t';
      RxBuff[24] ='t';
      RxBuff[25] =' ';
      RxBuff[26] ='0';
      RxBuff[27] ='2';
      RxBuff[28] ='-';
      RxBuff[29] ='0';
      RxBuff[30] ='8';
      RxBuff[31] =116;
}

void ButtonSim()
 {
  BtnSim.update();
  if (BtnSim.released)
  {
    if(SimulationDrawFlag==true)
    {
      SimulationDrawFlag = false;
      SimulationRS232Flag = false;
      Sim=(" ");
    }
    else
    {
      SimulationDrawFlag = true;
      SimulationRS232Flag = true;
      Sim=("SIMULATION");
    }
  }
   // BtnSim.display();
 }

