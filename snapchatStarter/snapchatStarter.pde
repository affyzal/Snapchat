/**
Creative Interactions - Assignment 2
Snapchat starter sketch
To be edited for submission
*/
int x = 10;
int y = 10;
int w = 40;
int h = 40;
int state = 0;
String result="";
String stay="off";
String type="no";


//set variables to check if pressed or not
Boolean pgup_pressed = false;
Boolean b_pressed = false; 
Boolean one_pressed = false;
Boolean two_pressed = false;
Boolean three_pressed = false;
Boolean four_pressed = false;
Boolean five_pressed = false;
Boolean six_pressed = false;
Boolean seven_pressed = false;
Boolean eight_pressed = false;


//main var for input and duplicate for display
String content = "";
String contents = content;

PImage bg;

void setup() {
  size(1920, 640);
  // The background image must be the same size as the parameters
  // in the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("planets.png");
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
  
  rect(x,y,h,w);
  if(mousePressed){
    if(mouseX>x && mouseX <x+w && mouseY > y && mouseY < y+h){
      text("TTTTTTTTTTTTTTTTTTT", 0, 0);
    }
  }

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

}
