class CircleSpeed{
 
 float xspeed;
 float yspeed;
 float xaccel;
 float yaccel;
 float xpos;
 float ypos;
 float radius;
 
 //color
 color circleColor;
 float R,G,B;
 float alpha;
 float minHUE;
 float maxHUE;
 float minSAT;
 float maxSAT;
 float minBRIGHT;
 float maxBRIGHT;
 

 CircleSpeed(int rad)
 {
   if (ypos==xpos){
     ypos = 240f;
     xpos = 240f;
   }
   xspeed = random(-2,2);
   yspeed = random(-2,2);
   xaccel = random (-.5, 1); //lopsided pull "gravity?"
   yaccel = random (-1,1);
   radius = (float) rad;
   
   minHUE = 0;
   minSAT = 0;
   minBRIGHT = 0;
   maxHUE = 360;
   maxSAT = 100;
   maxBRIGHT = 100;
   
   R = random (255);
   G = random (255);
   B = random (255);
   circleColor = color(R,G,B,76);
   radius += 2* sqrt(xspeed*xspeed + yspeed*yspeed);
 } 
 
 CircleSpeed(int rad, float xstem, float ystem){
   this(rad);
   xpos = xstem;
   ypos = ystem;
   
 }
 
 float[] getCoords()
 {
   float[] out = {xpos,ypos} ;
   return out;
 }

 void setAlpha(float A){//should be 0-255
   alpha = A;
   circleColor = color(R,G,B,alpha);
 }
 
 void setHues(float min, float max){
   colorMode(HSB);
   float tempHUE = hue(circleColor);
   float tempSAT = saturation(circleColor);
   float tempBright = brightness(circleColor);
   minHUE = min;
   maxHUE = max;
   if (tempHUE < minHUE || tempHUE > maxHUE)  //then recolor the thing
       circleColor = color(random(minHUE, maxHUE) , tempSAT, tempBright); 
   
   colorMode(RGB);
 }
 
 
 void setSats (float min, float max){
    colorMode(HSB);
    float tempHUE = hue(circleColor);
    float tempSAT = saturation(circleColor);
    float tempBright = brightness(circleColor);
    float percentSAT = ((tempSAT -minSAT )/ (maxSAT - minSAT) );
    float newSAT = ((max-min) * percentSAT) + min ;
    minSAT = min;
    maxSAT = max;
   
    circleColor = color(tempHUE, newSAT, tempBright);
    colorMode(RGB);
 }
 
 void setBright (float min, float max){
   colorMode(HSB);
   float tempHUE = hue(circleColor);
   float tempSAT = saturation(circleColor);
   float tempBright = brightness(circleColor);
   float percentBright = (tempBright - minBRIGHT) / (maxBRIGHT - minBRIGHT) ;
   float newBright = ((max-min * percentBright) + min) ;  
   minBRIGHT = min;
   maxBRIGHT = max;
   
   circleColor = color(tempHUE, tempSAT, newBright); 
   colorMode(RGB);
   
 }
 
 void setColorsAtStart(float minHUE, float maxHUE,
                   float minSAT, float maxSAT,
                   float minBright, float maxBright){
   colorMode(HSB);
   this.minHUE = minHUE;
   this.maxHUE = maxHUE; 
   this.minSAT = minSAT;
   this.maxSAT = maxSAT;
   this.minBRIGHT = minBright;
   this.maxBRIGHT = maxBright;
   
   float H_color = random(minHUE, maxHUE);
   float S_color = random(minSAT, maxSAT);
   float B_color = random(minBRIGHT, maxBRIGHT);
   
   circleColor = color(H_color, S_color, B_color);
   colorMode(RGB);
 }
 
 
 
 void update(){
 
  xpos += xspeed;
  ypos += yspeed;
  xspeed += xaccel*.05;
  yspeed += yaccel*.05;
  //radius = 20* sqrt(xspeed*xspeed + yspeed*yspeed);
 }
 
 void draw(){
   stroke(12);
   fill(circleColor);
   ellipse(xpos,ypos,radius,radius);
 }
 
 boolean isInFrame(float Xdim, float Ydim){
   
  if (xpos + radius < 0 || ypos+radius < 0)
    return false;
  if (xpos-radius > Xdim || ypos-radius > Ydim)
    return false;

  return true;
 }
}
