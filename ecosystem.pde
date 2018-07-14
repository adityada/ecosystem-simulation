static int width = 1280;
static int height = 720;

Fly[] flies = new Fly[11];
Dragonfly[] dragonflies = new Dragonfly[3];
Bee[] bees = new Bee[2];
BabyBee[] babybees = new BabyBee[12];

void settings() {
 size(width, height); 
 for(int i = 0; i < flies.length; i++) {
  flies[i] = new Fly(); 
 }
 for(int i = 0; i < dragonflies.length; i++) {
  dragonflies[i] = new Dragonfly(); 
 }
 for(int i = 0; i < bees.length; i++) {
  bees[i] = new Bee(); 
 }
 for(int i = 0; i < babybees.length; i++) {
  babybees[i] = new BabyBee(); 
 }
}

void draw() {
  smooth(10);
 background(255);
 for(int i = 0; i < flies.length; i++) {
  flies[i].move();
  flies[i].draw();
 }
 for(int i = 0; i < dragonflies.length; i++) {
  dragonflies[i].move();
  dragonflies[i].draw();
 }
 for(int i = 0; i < bees.length; i++) {
  bees[i].move();
  bees[i].draw();
 }
  for(int i = 0; i < babybees.length; i++) {
  for(int j = 0; j < bees.length; j++) {
   PVector force = bees[j].attract(babybees[i]);
   babybees[i].applyForce(force);
  }
  babybees[i].update();
  babybees[i].draw();
 }
}
