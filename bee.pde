class Bee {
 PVector acc = new PVector(0, 0);
 PVector vel = new PVector(0, 0);
 PVector loc = new PVector(width/2 + random(-100, 100), height/2 + random(-100, 100));
 int bwidth = 40;
 int bheight = 40;
 
 void move() {
  PVector dir = new PVector(random(width), random(height));
  acc = dir.normalize();
  acc.mult(random(-1, 1));
  vel.add(acc);
  loc.add(vel);
  acc.limit(10);
  vel.limit(20);
if(loc.x - bwidth/2 < 0 || loc.x  - bwidth/2 > width) {
   vel.x *= -1; 
  } else if(loc.y - bheight/2 < 0 || loc.y - bheight/2 > height) {
   vel.y *= -1; 
  }
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
   ellipse(loc.x - bwidth/2, loc.y - bheight/2, 15,50);
   ellipse(loc.x - bwidth/2, loc.y + bheight/2, 15,50);
 }
 
}
