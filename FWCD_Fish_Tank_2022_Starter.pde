PImage mhs;
ArrayList<AnimatedObject> objs = new ArrayList<AnimatedObject>();

int SAND_HEIGHT = 120;
PVector[] locations;
void setup() {
  mhs = loadImage("capitol.jpg"); 
  size(1920,1080,P2D);
  mhs.resize(width, height-SAND_HEIGHT);
  smooth(8);
  DummyClass dum1 = new DummyClass(int(random(300,1600)),int(random(200,800)));
  DummyClass dum2 = new DummyClass(int(random(300,1600)),int(random(200,800)));
  DummyClass dum3 = new DummyClass(int(random(300,1600)),int(random(200,800)));
  DummyClass dum4 = new DummyClass(int(random(300,1600)),int(random(200,800)));
  DummyClass dum5 = new DummyClass(int(random(300,1600)),int(random(200,800)));
  DummyClass dum6 = new DummyClass(int(random(300,1600)),int(random(200,800)));
  ArjunVasudevanFish test = new ArjunVasudevanFish(width/2,height/2,int(6*PI),60,width/2,height/2,15);
  //put your object in fish tank list named objs using the model below.
 // objs.add( new YOUROBJECT() );
  objs.add(test);
  objs.add(dum1);
  objs.add(dum2);
  objs.add(dum3);
  objs.add(dum4);
  objs.add(dum5);
  objs.add(dum6);
  
  
}
//DO NOT CHANGE CODE BELOW!!!!!!!
//DO NOT CHANGE CODE BELOW!!!!!!!
//DO NOT CHANGE CODE BELOW!!!!!!!
//DO NOT CHANGE CODE BELOW!!!!!!!
//EVER. PERIOD. END OF STORY.
void draw() {

  drawTankBackground();                    
  //proposal to change
  locations = new PVector[objs.size()];
  for (int i=0; i<objs.size(); i++) 
  {
    AnimatedObject obj = objs.get(i);
    locations[i] = new PVector(obj.getX(), obj.getY());
  }

  for (AnimatedObject ao: objs) {
      ao.display();
      ao.move(locations);
      resetMatrix();           
  }
  
}

void drawTankBackground() {
    
  rectMode(CORNER);
  tint(0,130,237);
  image(mhs,0,0);
  //background(50, 50, 255);
  color topColor = color(168, 168, 50);
  color bottomColor = color(68,68,0);
  float rDiff = red(topColor) - red(bottomColor);
  float gDiff = green(topColor) - green(bottomColor);
  float bDiff = blue(topColor) - blue(bottomColor);
  rDiff /= SAND_HEIGHT;
  gDiff /= SAND_HEIGHT;
  bDiff /= SAND_HEIGHT;
  for(int i =0; i<SAND_HEIGHT; i++)
  {
      stroke(red(topColor)-i*rDiff,green(topColor)-i*gDiff, blue(topColor)-i*bDiff);
      line(0, height-SAND_HEIGHT+i, width, height-SAND_HEIGHT+i);
  }
  //test
 
}
