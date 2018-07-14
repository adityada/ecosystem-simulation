class BabyBee {
  PVector loc = new PVector(random(width), random(height));
  PVector acc = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  float mass = 1;
  
  void applyForce(PVector f) {
   acc.add(f); 
  }
  
  void update() {
   PVector dir = new PVector(randomGaussian(), randomGaussian());
   applyForce(dir);
   acc.mult(random(.1, 1));
   vel.add(acc);
   loc.add(vel);
   vel.limit(10);
   acc.mult(0);
  }
  
  void draw() {
   fill(255, 233, 35);
   stroke(0);
   strokeWeight(2);
   ellipse(loc.x, loc.y, 16, 16);
  }
  
}
