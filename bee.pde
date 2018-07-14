class Bee {
  PVector acc = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector loc = new PVector(width/2 + random(-100, 100), height/2 + random(-100, 100));
  int bwidth = 40;
  int bheight = 40;
  float mass = 60;
  
  void applyForce(PVector f) {
    PVector force = PVector.div(f, mass);
   acc.add(force); 
  }
  
  void move() {
    PVector dir = PVector.random2D();
    applyForce(dir);
    acc.mult(random(-50, 50));
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    vel.limit(10);
    
    if (loc.x + bwidth < 0 || loc.x  - bwidth > width) {
      vel.x *= -1;
      dir = new PVector(width/2, height/2);
    } else if (loc.y + bheight < 0 || loc.y - bheight > height) {
      vel.y *= -1;
      dir = new PVector(width/2, height/2);
    }
    
  }
  
  PVector attract(BabyBee fly) {
   PVector force = PVector.sub(loc, fly.loc);
   float dis = force.magSq();
   dis = constrain(dis, 2, 40);
   force.normalize();
   float strength = (mass * fly.mass) / dis;
   force.mult(strength);
   return force;
  }

  void draw() {
    fill(250, 220, 85);
    ellipse(loc.x + bwidth/1.3, loc.y, bwidth/1.5, bheight/1.5);
    fill(250, 220, 85);
    ellipse(loc.x - bwidth, loc.y, bwidth, bheight);
    fill(0);
    ellipse(loc.x, loc.y, 40, 40);

    //Wings
    fill(111, 111, 111, 80);
    ellipse(loc.x - bwidth/2, loc.y - bheight/2, 15, 50);
    ellipse(loc.x - bwidth/2, loc.y + bheight/2, 15, 50);
  }
}
