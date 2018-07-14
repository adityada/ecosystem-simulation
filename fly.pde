class Fly {
 PVector loc = new PVector(random(width), random(height));
 PVector acc = new PVector(0, 0);
 PVector vel = new PVector(0,0);
 float mass = 1;
 
 void applyForce(PVector f) {
   PVector force = PVector.div(f, mass);
   acc.add(force);
 }
 
 void move() {
   PVector dir = new PVector(randomGaussian(), randomGaussian());
   applyForce(dir);
   acc.mult(random(1, 4));
   
    if(loc.x < 0 || loc.x > width) {
     vel.x *= -1; 
    } else if(loc.y < 0 || loc.y > height) {
     vel.y *= -1; 
    }
    vel.add(acc);
    loc.add(vel);
    vel.limit(10);
    acc.mult(0);
 }
 
 void draw() {
   fill(11, 11, 51);
   ellipse(loc.x, loc.y, 15, 15);
 }
 
}
