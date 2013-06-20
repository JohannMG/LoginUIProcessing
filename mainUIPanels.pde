User_Panel upTest ; 
drawBG _BG; 


void setup(){
  //runs at startup
  size(500, 500);
  frameRate(24);
  _BG = new drawBG();
  //upTest = new User_Panel(); 
  
}
  
void draw(){

  
  background(200);
  //Runs every frame 
  _BG.draw();
  fill(158,170,196,200);
  noStroke();
  rect(0,0,width,height); 
  
  fill(25,20);
  rect (12,12,30,30);
  this.update();  


}

void update(){
 //runs in draw 
 //background(255);
  upTest = new User_Panel(); 
  
}

void mousePressed(){
  
}
