/*
In order to create a new button using the common image already loaded:
- define a new button in global definitions area
      ImageButtons YourButtonName;
- Create the button in DefineButtons() function
      YourButtonName = new ImageButtons(YourButtonXposition, YourButtonYposition, "YourButtonLabel", YourButtonColor);
- Use your button
       YourButtonName.update();
        if (YourButtonName.released)
        {
              put here the code to be executed when 
              the button is pressed and released
        }
        BtnSendSpeed.display();

*/
/*-----------------------------------------------------------------------------*/
void DefineButtons()
{  
 // Define and create image button for Main panel *************************
  BtnConfig = new ImageButtons(845, 772, "Config", 1);
  BtnQuit = new ImageButtons(945, 772, "Quit", 1);
  BtnRun = new ImageButtons(845, 772, "Main", 1);
  BtnSendSpeed = new ImageButtons(1170, 500, "Send", 1);
  BtnSendDist = new ImageButtons(1170, 550, "Send", 1);
  BtnSendXY = new ImageButtons(1170, 600, "Send", 1);
  BtnSendVersion = new ImageButtons(1170, 650, "Version", 1);
  BtnSendHalt = new ImageButtons(845, 685, "Halt", 1);
  BtnSendReset = new ImageButtons(945, 685, "Reset", 1);
  BtnStartSeq = new ImageButtons(845, 500, "Start Seq", 1);
  BtnDebugOff = new ImageButtons(845, 738, "Debug On", 1);
  BtnDebugOn = new ImageButtons(845, 738, "Debug Off", 0);
  BtnStopOff = new ImageButtons(945, 738, "Rx Stop", 1);
  BtnStopOn = new ImageButtons(945, 738, "Rx Go", 0);
  BtnSms = new ImageButtons(0, 0, "SMS", 1);  
  BtnSim = new ImageButtons(0, 785, "Sim", 1);  
  BtnMap = new ImageButtons(845, 550, "Map", 1);  
    
  // Define and create image button for Config panel *************************
  BtnDet = new ImageButtons(945, 772, "Details", 1);
  BtnSendCfgKSpeed1 = new ImageButtons(1190, 59, "Send", 1);
  BtnSendCfgKSpeed2 = new ImageButtons(1190, 69, "Send", 1);
  BtnSendCfgKAngle = new ImageButtons(1190, 172, "Send", 1);
  BtnSendCfgKDist = new ImageButtons(1190, 229, "Send", 1);
  BtnSendCfgWheels = new ImageButtons(1190, 285, "Send", 1);
  BtnSendCfgKvel = new ImageButtons(1190, 340, "Send", 1);
  BtnSendCfgRS232 = new ImageButtons(1190, 400, "Send", 1);
  BtnSendError = new ImageButtons(1190, 456, "Error", 1);
  BtnSendCfgLoad = new ImageButtons(845, 738, "Load", 1);
  BtnSendCfgSave = new ImageButtons(945, 738, "Save", 1);
  BtnSendMainGrid = new ImageButtons(35, 59, "Send", 1);
  BtnSendMainSet = new ImageButtons(35, 172, "Send", 1);
  BtnSendDetailGrid = new ImageButtons(35, 229, "Send", 1);
  BtnSendDetailSet = new ImageButtons(35, 342, "Send", 1);
  BtnSendCycle = new ImageButtons(35, 399, "Send", 1);
    
  // Define and create image button for Sequencer panel **********************  
  BtnSeqL = new ImageButtons(945, 772, "Sequencer", 1);
  BtnSeqR = new ImageButtons(845, 772, "Sequencer", 1);
  BtnSendSeq = new ImageButtons(35, 59, "Send", 1);
}

/*-----------------------------------------------------------------------------*/
void mouseReleased()
{      
  ReleasedFlag = true;
}

/*-----------------------------------------------------------------------------*/
class Button 
{
  int x, y;
  int w, h;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;   
  boolean released = false;   
    
  void pressed() {
    if(over && mousePressed) {
      pressed = true;
    } else {
      pressed = false;
    }    
  }
    
  void released() {
    if(over && ReleasedFlag) {
      released = true;
      ReleasedFlag = false;
    } else {
      released = false;
    }    
  }

  boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
}

class ImageButtons extends Button 
{
  /* two sets of images are defined for buttons, the main and an alternative one
     sometime used to show a toggle button.
     Three images are needed for each set:
     Normal viewing
     Mouse over viewing
     Pressed viewing
     Each button will be customized with text passed to this function
  */
  
  PImage currentimage;
  PImage Nimage;
  PImage Oimage;
  PImage Pimage;
    
  int w = bN.width;
  int h = bN.height;
  String bLabel;
  int Color;

  ImageButtons(int ix, int iy, String ibLabel, int iColor) 
  {
    x = ix;
    y = iy;
    bLabel = ibLabel;
    Color = iColor;
    if (Color == 1)
    {
      Nimage = bN;
      Oimage = bO;
      Pimage = bP;
    }
    else
    {
      Nimage = bNr;
      Oimage = bOr;
      Pimage = bPr;

    }
    currentimage = Nimage;
  }
  
  void update() 
  {
    over();
    pressed();
    released();
      if(pressed) 
      {
        currentimage = Pimage;
      } 
      else if (over)
      {
        currentimage = Oimage;
      } 
      else 
      {
        currentimage = Nimage;
      }
  }
  
  void over() 
  {
    if( overRect(x, y, w, h) ) {
      over = true;
    } else {
      over = false;
    }
  }
  
  void display() 
  {
    image(currentimage, x, y);
    textFont(CharFont, 14); 
    textAlign(CENTER,CENTER);
    // customization label for the specific button written at the center of the image
    text(bLabel,x+w/2,y+h/2);
    StandardFont();
  }
}


