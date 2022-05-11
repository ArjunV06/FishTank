import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FWCD_Fish_Tank_2022_Starter extends PApplet {

PImage mhs;
ArrayList<AnimatedObject> objs = new ArrayList<AnimatedObject>();

int SAND_HEIGHT = 120;

public void setup() {
  mhs = loadImage("capitol.jpg"); 
  
  mhs.resize(width, height-SAND_HEIGHT);
  

  ArjunVasudevanFish test = new ArjunVasudevanFish(width/2,height/2);
  //put your object in fish tank list named objs using the model below.
 // objs.add( new YOUROBJECT() );
  objs.add(test);
  
   
}


//DO NOT CHANGE CODE BELOW!!!!!!!
//DO NOT CHANGE CODE BELOW!!!!!!!
//DO NOT CHANGE CODE BELOW!!!!!!!
//DO NOT CHANGE CODE BELOW!!!!!!!
//EVER. PERIOD. END OF STORY.
public void draw() {

  drawTankBackground();                    
 
  PVector[] locations = new PVector[objs.size()];
  for (int i=0; i<objs.size(); i++) {
      AnimatedObject obj = objs.get(i);
      locations[i] = new PVector(obj.getX(), obj.getY());
  }

  for (AnimatedObject ao: objs) {
      ao.display();
      ao.move(locations);
      resetMatrix();           
    }
  
}

public void drawTankBackground() {
    
  rectMode(CORNER);
  tint(0,130,237);
  image(mhs,0,0);
  //background(50, 50, 255);
  int topColor = color(168, 168, 50);
  int bottomColor = color(68,68,0);
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

 
}
/** An abstract class for animated objects */
abstract class AnimatedObject {

  //PIVs?  
  
  //Constructors??

  public abstract void display(); //method used to draw object on screen.

  //move() will advance object by one frame, but ignores locations of other objects in 
  //fish tank.
  public void move() {
    
  }

  //move(PVector []) will advance object by one frame, but has an array, locs, with
  //the location of each of the other object's locations stored as a PVector
  
  public void move(PVector[] locs) { 
    move();
    
  }

  //accessor method returning obj's x position
  public abstract int getX();
  //accessor method returning obj's y position
  public abstract int getY();
}
class ArjunVasudevanFish extends AnimatedObject
{
    int xPos, yPos;
    Seekers seekers;
    //int angle,radius;
    ArjunVasudevanFish(int xPos_, int yPos_)
    {
        xPos=xPos_;
        yPos=yPos_;
        //angle=0;
        //radius=80;
        seekers = new Seekers(30,150,width/2,height/2,8);
        
    }

    public void display()
    {
        
        rectMode(CENTER);
        rect(xPos,yPos,50,50);
        //angle+=3;
        xPos=mouseX;
        yPos=mouseY;
        //float circleX=cos(radians(angle));
        //float circleY=sin(radians(angle));
        //circleX*=radius;
        //circleY*=radius;
        //circleX+=xPos;
        //circleY+=yPos;
        //ellipse(circleX,circleY,30,30);
        //println(angle,circleX,circleY);
        seekers.display();

    }
    public int getX()
    {
        return xPos;
    }
    public int getY()
    {
        return yPos;
    }
}
class Seeker
{
    
    int size;
    float xPos;
    float yPos;
    int xOffset;
    int yOffset;
    int radius;
    int angle;
    
    int r, g, b;

    Seeker(int size_, int angle_, int radius_, int xOffset_, int yOffset_, int r_, int g_, int b_)
    {
        size = size_;
        radius=radius_;
        xPos=cos(radians(angle_));
        yPos=sin(radians(angle_));
        xPos*=radius_;
        yPos*=radius_;
        xOffset=xOffset_;
        yOffset=yOffset_;
        angle = angle_;
        r=r_;
        g=g_;
        b=b_;
        

    }

    public void display()
    {
        pushStyle();
        fill(r,g,b);
        ellipse(xPos,yPos,size,size);
        popStyle();
    }

    public void update(int angle_, int xOffset_, int yOffset_)
    {
        xOffset=xOffset_;
        yOffset=yOffset_;
        xPos=cos(radians(angle));
        yPos=sin(radians(angle));
        xPos*=radius;
        yPos*=radius;
        xPos+=xOffset;
        yPos+=yOffset;
        angle+=angle_;
        
    }

    public int getAngle()
    {
        return angle;
    }


}
class Seekers
{
    ArrayList<Seeker> seekers;
    int angle=0, xOffset, yOffset;

    Seekers(int size_, int radius_, int xOffset_, int yOffset_, int amount)
    {
        seekers = new ArrayList<Seeker>();
        int angleOffset=360/amount;
        xOffset=xOffset_;
        yOffset=yOffset_;
        for(int i = 0; i<amount; i++)
        {
            seekers.add(new Seeker(size_, i*angleOffset, radius_, xOffset_, yOffset_, PApplet.parseInt(random(170,242)),PApplet.parseInt(random(10)),PApplet.parseInt(random(10))));
         
        }
        for (int i = seekers.size() - 1; i>= 0; i--)
        {   
            Seeker quick = seekers.get(i);
                
            quick.update(angle, xOffset, yOffset);
        }
    }

    public void display()
    {
        for (int i = seekers.size() - 1; i>= 0; i--)
        {
            Seeker quick = seekers.get(i);
            quick.display();
            quick.update(angle, xOffset, yOffset);
        }
        angle++;
    }
}
  public void settings() {  fullScreen(P2D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FWCD_Fish_Tank_2022_Starter" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
