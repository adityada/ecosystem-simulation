class Dragonfly {
 PVector acc = new PVector(0, 0);
 PVector vel = new PVector(0, 0);
 PVector loc = new PVector(width/2 + random(-100, 100), height/2 + random(-100, 100));
 float t = random(0, 100000);
 float inc = 0.01;
 int bwidth = 50;
 int bheight = 16;
 int wingwidth = 15;
 int wingheight = 60;
 float mass = 1;
 
 void applyForce(PVector f) {
   PVector force = PVector.div(f, mass);
   acc.add(f);
 }
 
 void move() {
  PVector force = new PVector(0, 0);
  force.x = random(-noise(t), noise(t));
  force.y = random(-noise(t), noise(t));
  t += inc;
  applyForce(force);
  
  vel.add(acc);
  loc.add(vel);
  acc.mult(random(0.2, 0.5));
  vel.limit(5);
  
  if(loc.x - bwidth/2 < 0 || loc.x  - bwidth/2 > width) {
   vel.x *= -1; 
  } else if(loc.y - bheight/2 < 0 || loc.y - bheight/2 > height) {
   vel.y *= -1; 
  }
 }
 
 void draw() { 
  noStroke();
  fill(7, 181, 108);
  rect(-bwidth + loc.x, -bheight + loc.y, bwidth, bheight);
  fill(61, 61, 61, 90);
  ellipse(loc.x - bwidth/2, loc.y - wingheight/2 - bheight, wingwidth, wingheight); 
  ellipse(loc.x - bwidth/2, loc.y + wingheight/2, wingwidth, wingheight);
 }
 
}
