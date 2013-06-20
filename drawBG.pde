import java.util.ArrayList;

class drawBG{
  ArrayList circles;
  int counter;
  PFont f;
  //UI_Control ui_c; 
  int NEW_CIRCLE_INTERVAL;
  int X_DISPLAY;
  int Y_DISPLAY;
  int Y_UI;
  final int Circle_RAD = 90;

 public drawBG() {
    X_DISPLAY = 500;
    Y_DISPLAY = 500;
    Y_UI = 100; 
    NEW_CIRCLE_INTERVAL = 20;  //usually 10
    //size(X_DISPLAY,Y_DISPLAY+Y_UI);
    circles = new ArrayList();
    counter = 0;  
    f = createFont("Arial Bold",16,true);
    //ui_c = new UI_Control(X_DISPLAY, Y_DISPLAY, Y_UI);
    this.update();
  }

  void draw() {
    
    //background(200);//Clear Screen
    ////Draw the Circles.
    for (int i = 0; i < circles.size(); i++){
      CircleSpeed c = (CircleSpeed) circles.get(i);
      c.draw();
    }
    /*  ---REMOVE TEXT
    ////Show String Data
    String display = makeDispString();
    textFont(f,16);                 // STEP 4 Specify font to be used
    fill(0);                        // STEP 5 Specify font color 
    text(display,10,100);  // STEP 6 Display Text
    */
    update();
    //ui_c.drawUI();
  }

  void update(){
   counter ++;
   
   
   if ( counter % NEW_CIRCLE_INTERVAL == 0){ //Make another circle every X frames
     if (circles.size() > 1){ //if there is one, use it as a stem
       CircleSpeed c = (CircleSpeed) circles.get(circles.size()-1);
       float[] coords = c.getCoords();
       circles.add(new CircleSpeed(Circle_RAD,coords[0],coords[1]));
     }
     else //make a new one
       circles.add(new CircleSpeed(Circle_RAD));
   }
   //reset counter every now and then
   if (counter > 23492)
     counter = 0;
    
    //Update ALL the circles! Remove is out of frame. 
    for (int i = 0; i < circles.size(); i++){
      CircleSpeed c = (CircleSpeed) circles.get(i);
      if (! c.isInFrame(X_DISPLAY, Y_DISPLAY))
        circles.remove(i);
       c.update();
    }
    
   //Lets draw some triangles! (or lines if they are lonely) 
   if (circles.size() == 2){
     CircleSpeed c1 = (CircleSpeed) circles.get(0);
     CircleSpeed c2 = (CircleSpeed) circles.get(1);
     float[] c1Loc = c1.getCoords();
     float[] c2Loc = c2.getCoords();
     fill (255);
     line (c1Loc[0], c1Loc[1], c2Loc[0], c2Loc[1]);
   }
   
   else if (circles.size() > 2){
     for (int i = 0; i < circles.size(); i++){
       CircleSpeed cFocus = (CircleSpeed) circles.get(i);
       float[] locFocus = cFocus.getCoords();
       CircleSpeed c1 = null; 
       CircleSpeed c2 = null;
       float c1Dist = -1;
       float c2Dist = -1;
       
       for (int j = 0; j < circles.size(); j++){
         if (j==i)
           continue;
         CircleSpeed temp1 = (CircleSpeed) circles.get(j);
         float[] loc_temp1 =  temp1.getCoords();
         
         float xdiff = locFocus[0] - loc_temp1[0];
         float ydiff = locFocus[1] - loc_temp1[1];
         float dist_temp1 = sqrt((xdiff*xdiff) + (ydiff*ydiff));
         
         if (c1==null || c1Dist > dist_temp1){
           c1=temp1;
           c1Dist = dist_temp1;
         }
         else if (c2 == null ||c2Dist > dist_temp1){
           c2 = temp1;
           c2Dist = dist_temp1;
         }
       }
       //should end draing two lines
       //later implement fading with distance? not that hard
       
       if (c1 != null) //draw nearest one if there is one 
       {
         float[] loc_c1 = c1.getCoords();
         fill(255);
         line(locFocus[0], locFocus[1],loc_c1[0], loc_c1[1]);
         
       }
       if (c2 != null){ //draw second nearest if there is one
         float[] loc_c2 = c2.getCoords();
         fill(255);
         line(locFocus[0], locFocus[1],loc_c2[0], loc_c2[1]);
       }
       
       
     }///END DRAWING LINES 
     
   }
   
   
  }
   
   String makeDispString(){
     String out = "";
     out += "Circles Active: " + circles.size();
     return out;
   }
   
   
}
