class Fly {
 PVector loc = new PVector(random(width), random(height));
 PVector acc = new PVector(0, 0);
 PVector vel = new PVector(0,0);
 
 void move() {
   PVector dir = new PVector(randomGaussian(), randomGaussian());
   acc = dir.normalize();
   acc.mult(random(1,3));
   
    if(loc.x < 0 || loc.x > width) {
     vel.x *= -1; 
    } else if(loc.y < 0 || loc.y > height) {
     vel.y *= -1; 
    }
    vel.add(acc);
    loc.add(vel);
    vel.limit(10);
 }
 
 void draw() {
   fill(11, 11, 51);
   ellipse(loc.x, loc.y, 15, 15);
 }
 
}
