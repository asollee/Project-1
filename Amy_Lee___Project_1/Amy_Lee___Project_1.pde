// Project 1: arcane, serene, surreal, AWE-INSPIRING

/* 
 dark background, mimicking the night sky
 set up vertical lines (like an aurora borealis) that are colored in a gradient
 set up ellipses in multiple colors
 have each color ellipse sets "blink" randomly
 */

int x = 0;
int y = 0;
color random;


void setup() {
  fullScreen();
  //background(10, 8, 41);
  frameRate(20);  // or = 5?
}

void draw() {

  /*
  if (mousePressed){
   space(color(170, 6, 0));
   } else {  */
  space(color(18, 8, mouseX + 50));
  // } // if mousepress BB
  // ^^ 38 OR random(0, 170) OR mouseX + 50
  // Is it because my framerate is 5? Do I need to make it faster in order
  // for thesystem to keep up with my mouse? It won't really change color...

  stars(color(242, 227, 0));

  stars2(color(random(0, 255)), random(2, 4));

  perspective();

  blueFlecks();  // having trouble with the blueflecks, won't show up

  random = color(random(0, 255), random(0, 255), random(0, 255), 200);

  // HUMAN TOUCH --> CHAOS
  if (mousePressed) {
    //frameRate(50);  <-- how do I return it to the regular frameRate when not pressed?
    random = color(0, 0, 0, 200);
    stars2(0, random(2, 4));
    stars(0);
    space(color(170, 6, 0));
  }  // if mousepress BB
  // ^^^ how come only the auroras and the stars are affected by this?

  aurora(random(0, width), random(0, height/2), random);

/*
  if (mouseX < width/2){
   shootingStar(random(width/2, width), 0, height);
   }  // shootingStar if BB
   if (mouseX > width/2){
   shootingStar(random(0, width/2), 0, height);
   }  // shootingStar if BB #2
*/

  pushMatrix();
  if (keyPressed) {
    planets(mouseX, mouseY);
  }
  popMatrix();
  // ^^ how do I revert back to original? original everything? screen and frameRate?
  
}  // draw BB








void stars (color c) {
  int a = 0;
  int speed = 50;
  for (int x = 0; x <= width; x += 100) {
    for (int y = 7; y <= height; y += 150) {
      stroke(random(0, 255));
      strokeWeight(1);
      fill(c, a);
      a = a + speed;
      if (a == 255 || a == 0) {
        speed *= -1;
      }  // if BB
      ellipse(x, y, 10, 10);
    }  // for loop y BB
  }  // for loop x BB
}  // star function BB


void stars2(color c, float size) {
  int a = 0;
  int speed = 50;

  for (int x = 0; x <= width; x += random(10, 50)) {
    for (int y = 7; y <= height; y += random(15, 45)) {
      noStroke();
      fill (c, a);
      a = a + speed;
      if (a == 255 || a == 0) {
        speed *= -1;
      }  // if BB
      ellipse(x, y, size, size);
      x += random(10, 50);
      y += random(15, 45);
    }  // for loop y BB
  }  // for loop x BB
}  // stars2 function BB


void space(color c) {
  while (x <= width + 500) {
    frameRate(1);
    fill(c, 20);
    noStroke();
    ellipse(width/2, height/2, x, y);
    x = x + 30;
    y = y + 30;
  }  // while loop BB
}  // space function BB


void blueFlecks() {
  while (x <= width + 500) {
    stroke(18, 8, 94);  // blue flecks
    strokeWeight(5);
    noFill();
    ellipse(width/2, height/2, x, y);
    x += 100;
    y += 100;
  }  // while loop BB
}  // blueFlecks BB


void perspective() {
  stroke(155, 150);
  strokeWeight(1);
  noFill();
  rectMode(CENTER);
  rect (width/2, height/2, width/2, height/2);
  line(0, 0, width/4, height/4);
  line(width, 0, 3*width/4, height/4);
  line(0, height, width/4, 3*height/4);
  line(width, height, 3*width/4, 3*height/4);
}  // persepective BB


void aurora(float Ax, float Ay, color c) {
  stroke(c);
  strokeWeight(5);
  line(Ax, 0, Ax, Ay);

  /*
//   (the working "constrain" to keep the auroras from running into the "box"
   //   but do I want it..?)
   
   if (Ax >= width/4 && Ax <= 3*width/4) {
   line(Ax, 0, Ax, height/4);
   } else {
   line(Ax, 0, Ax, Ay);
   } // if loop BB
   */
}  // aurora function BB


void shootingStar (float x, float y1, float y2) {
  stroke(242, 255, 124);
  strokeWeight(15);
  line(x, y1, x, y2);
  y2 = y2 - 50;
  /*
  while (y1 > 0){
   y1 = y1 - 50;
   y2 = height;
   } 
   if (y1 == 0){
   y1 = 0;
   y2 = y2 - 50;
   }  // if BB
   */
  // ^^^ why is this not working. I wanted it to streak across the screen from
  // bottom to top
}  // shootingStar function BB


void planets (float x, float y) {
  //background(color(18, 8, (mouseX + 50)*2));
  //frameRate(60);
  // planet 1
  noStroke();
  fill(45, 77, 125);
  ellipse(x, y, 100, 100);
  // planet 2
  fill(70, 40, 125);
  ellipse(x + 25, y + 25, 75, 75);
  //planet 3
  fill(217, 8, 0);
  ellipse(x + 50, y + 50, 50, 50);
}