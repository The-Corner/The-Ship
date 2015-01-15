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

