Rocketship r;
ArrayList<Fire> bullets = new ArrayList<Fire>();

void setup() {
  size(500, 500);
  //Initialize a new rocketship and a new fireball
  r = new Rocketship();
}
void draw() {
  frameRate(100);
  background(255);
  for (int i = 0; i < bullets.size (); i++) {
    Fire f = bullets.get(i);
    f.display();
  }
  r.display();
  //Update the rotation of the rocketship every frame
  r.update();
}
void mousePressed() { 
  bullets.add(new Fire(r));
}
class Rocketship {
  //Declare the location, velocity, size, and image for the rocketship
  PVector loc, vel;
  float sz;
  PImage rocketship;
  //Declare the variable for the angle
  float theta;
  Rocketship() {
    //Initialize the location, velocity, size, and image for the rocketship
    loc = new PVector(width/2, height/2);
    sz = 100;
    rocketship = loadImage("rocketship.png");
    //Change rectangle mode to rotate around the center
    imageMode(CENTER);
    //Initialize the variable for the angle
  }  
  void display() {
    //Set rocketship location to the mouse location
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    image(rocketship, 0, 0, sz, sz);
    popMatrix();
  }

  void update() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        theta-=radians(.5);
      } else if (keyCode == RIGHT) {
        theta+=radians(.5);
      }
    }
  }
}
class Fire {
  PVector loc, vel;
  float sz = 10;
  PImage bulletbill;
  float theta;
  Fire(Rocketship r) {
    bulletbill = loadImage("bulletbill.png");
    loc = r.loc.get();
    vel = PVector.fromAngle(r.theta);
    theta = r.theta;
  }
  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    image(bulletbill, 0, 0, sz*2, sz*2);
    loc.add(vel);
    popMatrix();
  }
}

