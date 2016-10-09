// Project 1: arcane, serene, surreal

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
  //size(windowWidth, windowHeight);
  //background(10, 8, 41);
  frameRate(5);
}

void draw() {
  space(color(18, 8, mouseX + 50));
  // ^^ 38 OR random(0, 170) OR mouseX + 50
  // Is it because my framerate is 5? Do I need to make it faster in order
  // for thesystem to keep up with my mouse? It won't really change color...
  stars();
  stars2(color(random(0, 255)), random(2, 4));
  perspective();
  blueFlecks();
  /*
  if (x >= width/4 && x <= 3*width/4) {
   aurora(random(0, width), random(0, height/4));
   } else {
   aurora(random(0, width), random(0, height/2));
   } // if loop BB
  /* ^^ ???????
   I was trying not to make the lines run into the rectangle/box I had 
   set up for my "perspective". I don't understand why my constraint didn't work
   */
   
  random = color(random(0, 255), random(0, 255), random(0, 255), 200);
  aurora(random(0, width), random(0, height/2), random);
  if (mousePressed) {
    random = color(0, 0, 0, 200);
  }  // if mousepress BB
  /* ^^^ ?????
  AND i was trying to make all the drawn and potentially drawn lines/auroras
  to turn black with a mouse press. What am I doing wrong here? What am I missing?
  */
}


void stars () {
  int a = 0;
  int speed = 50;
  for (int x = 0; x <= width; x += 100) {
    for (int y = 7; y <= height; y += 150) {
      stroke(random(0, 255));
      strokeWeight(1);
      //fill(255, 239, 67, a);  // lighter yellow?
      fill(242, 227, 0, a);  // darker yellow?
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
      //stroke(random(0, 255));
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

  /*
  fill (255, a);
   a = a + speed;
   if (a == 255 || a == 0) {
   speed *= -1;
   }  // if BB
   ellipse(x, y, 5, 5);
   x += random(10, 50);
   y += random(15, 45);
   */
}  // stars2 function BB
/* ?????
 how do I stop a for loop again? These stars go on forever and I want them to stop...
 */




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
}  // persepctive BB


void aurora(float Ax, float Ay, color c) {
  //stroke(random(0, 255), random(0, 255), random(0, 255), 200);
  stroke(c);
  strokeWeight(5);
  line(Ax, 0, Ax, Ay);
  //while(x>
  Ax += 50;
  /*  
   if (mousePressed){
   stroke(0, 0, 0, 200);
   }  // if mousepress BB
   */
}  // aurora dunction BB