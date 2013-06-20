
/*-----------------------USER------------------------------

This should make the little name tiles for a user. 
It should be a photo then a placard with information.
If one is clicked, it should be somewhat centered and maximized to show more infor mation
Clicking a maximized placard will select it
User Image is a square

*///----------------------------------------------------------

class User_Panel {

  private final int USER_IMAGE_SIDE = 40;	//16 pixels
  private final int PADDING = 9; //5px
  private final int minimized_HEIGHT = USER_IMAGE_SIDE + (PADDING * 2) ; 
  private final int maximized_HEIGHT = 200; 
  private final int minimized_WIDTH = 250;
  private final int maximized_WIDTH = 350;

  private color slateColor;
  private color userImageColor;
  private color nameFontColor;

  PFont userFont;
  float xposition;
  float yposition;
  boolean expanded;
  boolean UIblink; 
 
  User_Panel()
  {
       userFont = createFont("SegoeUI-Light", 15);
	   //textFont(userFont);
	   //textAlign(CENTER, CENTER);
	   //text("!@#$%", width/2, height/2);

        xposition = 100;
        yposition = 200;
     expanded = false;
     slateColor = color(26,181,167,140);
     userImageColor = color(4,30,56);
     nameFontColor = color(9);
	   this.draw();
   }

  public void draw() {

    this.draw(this.xposition, this.yposition);
     
   }


  public void draw(float xposIn, float yposIn){

      if (!expanded) //WHEN it is not expanded
        {
        //Set BG tranparent slate
      	fill(slateColor);
      	stroke(0,17,54,100);
      	rect(xposIn, yposIn , 250, minimized_HEIGHT);
        	
        
        //User Image
      	fill(userImageColor);
      	//stroke(20,150);
        noStroke();
      	rect(xposIn+PADDING,  yposIn+PADDING , USER_IMAGE_SIDE,  USER_IMAGE_SIDE,1.5);

      	//Draw name tab
      	fill(userImageColor);
      	noStroke();
      	textFont(userFont);
  	   textAlign(LEFT, BOTTOM);
  	   text("FirstName LastName", xposIn + minimized_HEIGHT , yposIn + PADDING + (USER_IMAGE_SIDE * 0.8f));
     }


    }

    public float getWidth(){

      return (expanded)? maximized_WIDTH : minimized_WIDTH ; 
    }

    public float getHeight(){
      return (expanded)? maximized_WIDTH : minimized_WIDTH ; 
    }

    public boolean isMaximized(){
      return expanded;
    }

    public boolean containsPoint(int xpnt, int ypnt){

      int curH = (expanded)? maximized_HEIGHT : minimized_HEIGHT ;
      int curW = (expanded)? maximized_WIDTH : minimized_WIDTH ; 

      if  ((xpnt >= xposition && xpnt <= xposition + curW )
        && (ypnt >= yposition && ypnt <= yposition + curW ) )
        return true;

      else 
        return false;
    }


    public void selectPanel(){
      //TODO
      expanded = true;
     // this.quickUIBlink();
      this.animateExpansion();

    }

    private void quickUIBlink(){
      //todo ADD CODE TO BIRGHTEN FOR A so many frames
      //to let the user know that the touch was sensed
      //draws a whiteish rectangle over the object
      float highlightAlpha = 0; 
      int animationFrameLength = 32;
      int startFrameNumber = frameCount; 
      int endFrameNumber = frameCount + animationFrameLength;
      int midframeNumber = (startFrameNumber + endFrameNumber) / 2 ;       

          
      }

    private void animateExpansion(){
      //MORE WORK!
    }





  
	


}

