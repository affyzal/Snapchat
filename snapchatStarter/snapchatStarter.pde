/**
Creative Interactions - Assignment 2
Snapchat starter sketch
To be edited for submission
*/

//class design for line, currentposition function. influenced line drawing features https://forum.processing.org/two/discussion/16728/when-right-click-shape-is-created-and-then-disappeared

import processing.sound.*;

SoundFile file;


// Flags 
boolean bflag = false; 
boolean hflag = false;
 
boolean hflag2 = false;
boolean bflag2 = false;

// ArrayList - one to store lines for the drawing, the other for storing the starts, needed for displaying
ArrayList<Line> lines;
ArrayList<Star> stars;
 
// line Width
int lineWidth = 4;
 
// array of colors
color [] myNiceColors = { 
  color (255, 0, 0), //red
  color (0, 255, 0), //green
  color (0, 0, 255), //blue
  color (255, 0, 255), //pink
  color (255, 255, 255), //white
  color (0, 255, 255),  //teal
  color (220, 20, 60),  //crimson
  color (255, 165, 0),    //orange
  color(149, 198, 13),
  color(128,0,128)
};
 
// current color 
int colorPointer = 2; 


//rectangle variables
int x = 10;
int y = 10;
int w = 40;
int h = 40;

//for text input
String result="";
String stay="off";
String type="no";

//set variables to check if pressed or not
Boolean pgup_pressed = false;
Boolean pgdn_pressed = false;
Boolean b_pressed = false; 
Boolean one_pressed = false;
Boolean two_pressed = false;
Boolean three_pressed = false;
Boolean four_pressed = false;
Boolean five_pressed = false;
Boolean six_pressed = false;
Boolean seven_pressed = false;
Boolean eight_pressed = false;
Boolean s_pressed = false;


//main var for input and duplicate for display
String content = "";
String contents = content;

//image variable
PImage bg;
int numA = 1000;


void setup() {
  size(1920, 640);
  // The background image must be the same size as the parameters
  // in the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("planets.png");
  noCursor();  //make curser invisible
  //initialise array
  lines = new ArrayList();
  stars = new ArrayList();
  //file = new SoundFile(this, "Space.mp3");
  //file.play();
}


void draw() {
  background(bg);
  fill(255);
  textSize(24);
  
  //while button is pressed let user input text to screen
  if (pgup_pressed) {
    rect(x,y,h,w);
    text(content, 0, 500, 1920, 340);
  }
  
  //when one is pressed reveal number 1 name - mercury
  if (one_pressed){
    rect(x,y,h,w);
    text("Mercury", 180, 350);
  }
  
  //when pressed reveal number 2 name - venus
  if (two_pressed){
    rect(x,y,h,w);
    text("Venus", 285, 350);
  }
  //reveal 3 - earth
  if (three_pressed){
    rect(x,y,h,w);
    text("Earth", 435, 350);
  }
  //reveal 4 - mars
  if (four_pressed){
    rect(x,y,h,w);
    text("Mars", 575, 350);
  }
  //reveal 5 - jupiter
  if (five_pressed){
    rect(x,y,h,w);
    text("Jupiter", 810, 350);
  }
  //reveal 6 - saturn
  if (six_pressed){
    rect(x,y,h,w);
    text("Saturn", 1175, 350);
  }
  //reveal 7 - neptune
  if (seven_pressed){
    rect(x,y,h,w);
    text("Neptune", 1450, 350);
  }
  //reveal 8 - uranus
  if (eight_pressed){
    rect(x,y,h,w);
    text("Uranus", 1670, 350);
  }
  
  //keeps text on screen after user stops inputting
  if (stay=="on"){
    text(contents, 0, 500,1920, 340);
  }
  
  //display numbers
  text("1.", 210, 330);  //96
  text("2.", 310, 330);  //97
  text("3.", 460, 330);  //98
  text("4.", 595, 330);  //99
  text("5.", 840, 330);  //100
  text("6.", 1200, 330); //101
  text("7.", 1480, 330); //102
  text("8.", 1700, 330); //103
  
  noFill();
  stroke(0); 
 
  addNewLine();      //take user input and draw

  drawLines();       //read input saved into arraylist and display user drawing
 
  // red circle 
  fill(255, 2, 2);
  noStroke(); 
  ellipse(mouseX, mouseY, 22, 22);  //custom cursor
  
  if(s_pressed){  //when s is pressed duplicate save is made, keeping the original photo clean
    save("edit.jpg");
  }
  
  
  if (keyPressed) {    //add stars feature, when m is pressed 
    if (key=='m' || key == 'M') {
     fill(245, 255, 139);
     noStroke();
     ellipse(pmouseX, pmouseY, 5, 5);
     stars.add(new Star(pmouseX, pmouseY, 5, 5));  //add star to array
    }
  }
  drawStars(); //display array of stars

  
}

//inputting text to textbox cont
void keyTyped(){
  if(type=="yes"){
    content += key;
  }
}



void keyPressed(){
  if(keyCode == 33){ //pageup
    type="yes";
    pgup_pressed = true; 
  }
  if(keyCode == 49){ //1
    one_pressed = true;  
  }
  if(keyCode == 50){     //2
    two_pressed = true;
  }
  if(keyCode == 51){    //3
    three_pressed = true;
  }
  if(keyCode == 52){    //4
    four_pressed = true;
  }
  if(keyCode == 53){    //5
    five_pressed = true;
  }
  if(keyCode == 54){   //6
    six_pressed = true;
  }
  if(keyCode == 55){   //7
    seven_pressed = true;
  }
  if(keyCode == 56){  //8
    eight_pressed = true;
  }
  if(key == 's'){    //s
    s_pressed = true;
  }
  if (key == CODED) {
    if (keyCode == SHIFT) {
      //link to the sound file: https://freesound.org/people/celestino.anthony/sounds/172457/
      file = new SoundFile(this,"Space.wav");
      file.play();
    }
  }
}

void keyReleased(){
  if(keyCode == 33){ //pageup
    pgup_pressed = false;
    stay="on";
    type="no";
    contents=content;
   }
  if(keyCode == 49){ //1
    one_pressed = false;
  }
  if(keyCode == 50){ //2
    two_pressed = false;
  }
  if(keyCode == 51){ //3
    three_pressed = false;
  }
  if(keyCode == 52){ //4
    four_pressed = false;
  }
  if(keyCode == 53){ //5
    five_pressed = false;
  }
  if(keyCode == 54){ //6
    six_pressed = false;
  }
  if(keyCode == 55){ //7
    seven_pressed = false;
  }
  if(keyCode == 56){  //8
    eight_pressed = false;
  }
  if(key == 's'){    //s for saving
    s_pressed = false;
  }
  
  if (key == 'r' || key == 'R') { //clear entire drawing
    // delete all
    lines.clear();
  } else if (key == BACKSPACE) {
    int lastOne = lines.size()-1;  // undo/remove last item in arraylist
    if (lastOne>=0) {
      lines.remove(lastOne);
    }
  } else if (key == '+') {  //make line bigger
    lineWidth++;
  } else if (key == '-') {  //make line smaller
    lineWidth--;
    if (lineWidth<=1) {    //error check to prevent negative width
      lineWidth=1;
    }
  } else if (key == '0' || key == '1' || key == '2'  || key == '3'  || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9') {
    int val1 = int(key);
    colorPointer = val1-48;
    println(colorPointer);
  }

}


void mousePressed() {
  hflag = true;
}


void mouseReleased() {
  //boolean done = false; 
  if (bflag) {
    bflag=false;         
    hflag=false;
  } 
  else{
    hflag=false;
  }
} 

 
 
// tab for lines when drawing free hand 
// Lines in the right segment 
 
void addNewLine () {  //add new linw to drawing/arraylist
  // add new 
  if (hflag) {    
    if (currentPositionIsNew()) {
      lines.add(new Line(pmouseX, pmouseY, mouseX, mouseY, lineWidth, myNiceColors [colorPointer] ));
    }
  }
}

//
 
void drawLines () {
  // show all lines to show user drawing
  for (int x = lines.size()-1; x >= 0; x--) {
    Line temp = (Line) lines.get(x);  //set temp object to indexed object then display
    temp.display();
  }
}

void drawStars(){
  for(int x = stars.size()-1; x >= 0; x--){    //show all stars on canvas
    Star temp = (Star) stars.get(x);
    temp.display();
  }
}


// 
 
boolean currentPositionIsNew() {
 
  // default assumption: it's new line
  boolean bBuffer = true; 
  // get index of last line
  int i = lines.size() - 1; // size - 1
  // when empty
  if (i==-1) {
    // arrayList is empty, it's new; quit func
    return(true);
  }
  // get the last line from index i:
  // An ArrayList doesn't know what it is storing so we have to cast the object coming out
  Line line = (Line) lines.get(i);
  // check whether it's the same line as the one you're about to paint 
  if ( line.x == pmouseX && line.y == pmouseY && 
    line.x2 == mouseX && line.y2 == mouseY && 
    line.w == lineWidth ) {
    // not new
    bBuffer=false; // set value
  }
  // return the value
  return(bBuffer);
} // func
  
 
//class declaration to allow for display of user entred drawing

class Line {
   //set fields for drawing line
  float x;
  float y;
  float x2;
  float y2;
  color col;
  float w;
 
 //constructor 
  Line(float X, float Y, float X2, float Y2, float W, color col1) {
    x = X;
    y = Y;
    x2 = X2;
    y2 = Y2;
    w = W;
    col=col1;
  }
 //display function
  void display() {
    stroke (col); //line colour
    strokeWeight (w); //thickness
    line (x, y, x2, y2); //draw line using info read from arraylist
   }
}


//class declaration to for daring stars feature
class Star {
  float x;
  float y;
  float w;
  float h;
  
  //constructor
  Star(float x, float y, float w, float h){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
  }
  
  //display star
  void display(){
    fill(245, 255, 139);
    noStroke();
    ellipse(x,y,w,h);
  }
}
