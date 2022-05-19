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
PVector[] locations;
public void setup() {
  mhs = loadImage("capitol.jpg"); 
  
  mhs.resize(width, height-SAND_HEIGHT);
  
  DummyClass dum1 = new DummyClass(PApplet.parseInt(random(300,1600)),PApplet.parseInt(random(200,800)));
  DummyClass dum2 = new DummyClass(PApplet.parseInt(random(300,1600)),PApplet.parseInt(random(200,800)));
  DummyClass dum3 = new DummyClass(PApplet.parseInt(random(300,1600)),PApplet.parseInt(random(200,800)));
  DummyClass dum4 = new DummyClass(PApplet.parseInt(random(300,1600)),PApplet.parseInt(random(200,800)));
  DummyClass dum5 = new DummyClass(PApplet.parseInt(random(300,1600)),PApplet.parseInt(random(200,800)));
  DummyClass dum6 = new DummyClass(PApplet.parseInt(random(300,1600)),PApplet.parseInt(random(200,800)));
  ArjunVasudevanFish test = new ArjunVasudevanFish(width/2,height/2,PApplet.parseInt(6*PI),60,width/2,height/2,15);
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
public void draw() {

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
  //test
 
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
    Seeker control;
    int smallest,largest;
    int currentBreathe=0;
    boolean shrinking=true, active=true; //getting smaller
    int radius;
    boolean seeking=false;
    //int angle,radius;


    float beginX;  // Initial x-coordinate
    float beginY;  // Initial y-coordinate
    float endX;   // Final x-coordinate
    float endY;  // Final y-coordinate
    float distX;          // X-axis distance to move
    float distY;          // Y-axis distance to move
    float exponent = 3;   // Determines the curve
           // Current y-coordinate
    float step = 0.005f;    // Size of each step along the path
    float pct = 0.0f;      // Percentage traveled (0.0 to 1.0)

    ArjunVasudevanFish(int xPos_, int yPos_, int size_, int radius_, int xOffset_, int yOffset_, int amount)
    {
        xPos=xPos_;
        yPos=yPos_;
        radius=radius_;
        //angle=0;
        //radius=80;
        
        beginX=xPos_;
        beginY=yPos_;
        seekers = new Seekers(size_, radius_, xOffset_, yOffset_ ,amount);
        control = new Seeker(PApplet.parseInt(6*PI),100,width/2,height/2,15,0,0,0);
        
        
        
        
        
        //formula for max amnt
        //(radius*2/(SIZE/PI)) = max for when size is 30
        smallest=(radius)/(size_/amount);
        smallest=60;
        largest=radius+50;
        
        
        
    }
    int startTime=0;
    int startTime2=0;
    int currentTime=millis();
    public void move()
    {
        if(currentTime-startTime2>6000)
        {
            
            startTime2=millis();
            pct = 0.0f;
            beginX = xPos;
            beginY = yPos;
            endX = random(100,1800);
            endY = random(100,800);
            distX = endX - beginX;
            distY = endY - beginY;
        }
        pct += step;
        if (pct < 1.0f) 
        {
            xPos = PApplet.parseInt(beginX + (pct * distX));
            yPos = PApplet.parseInt(beginY + (pow(pct, exponent) * distY));
        }
    }
    public void display()
    {
        
        rectMode(CENTER);
        //ellipse(xPos,yPos,20,20);
        
        control.update(seekers.getAngle(),this.getX(),this.getY());
        control.updateRadius(control.breathe(smallest,largest));
        //angle+=3;
       
        //float circleX=cos(radians(angle));
        //float circleY=sin(radians(angle));
        //circleX*=radius;
        //circleY*=radius;
        //circleX+=xPos;
        //circleY+=yPos;
        //ellipse(circleX,circleY,30,30);
        //println(angle,circleX,circleY);
        seekers.update(this.getX(),this.getY());
        seekers.display();
        seekers.breathe(smallest,largest);
        
        if(seeking)
        {
            seekers.seekAll();
        }
        else
        {
            seekers.stopSeekAll(control.radius);
        }
        currentTime=millis();
        {
            if(currentTime-startTime>1000)
            {
                if(keyPressed && key == 's')
                {
                    seeking=!seeking;
                }
                startTime=millis();
            }
        }
        
        
       
        //println(active,this.isReady());

        

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
class DummyClass extends AnimatedObject
{
    int x,y;
    DummyClass(int xpos, int ypos)
    {
        x=xpos;
        y=ypos;
    }
    public int getX()
    {
        return x;
    }
    public int getY()
    {
        return y;
    }
    public void display()
    {
        pushStyle();
        rectMode(CENTER);
        
        rect(x,y,50,50);
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
    int originalRadius;
    float angle;
    boolean shrinking=true, active=true;
    int r, g, b;
    int smallest,largest;
    int currentBreathe=0;
    

    float beginX;  // Initial x-coordinate
    float beginY;  // Initial y-coordinate
    float endX;   // Final x-coordinate
    float endY;   // Final y-coordinate
    float distX;          // X-axis distance to move
    float distY;          // Y-axis distance to move
    float exponent = random(2,4);   // Determines the curve
    
    int seekXpos,seekYpos;     
    float step = 0.008f;    // Size of each step along the path
    float pct = 0.0f;      // Percentage traveled (0.0 to 1.0)
    //taken from processing examples forum, I understand it completely, just too lazy to write it all out

    Seeker(int size_, float angle_, int radius_, int xOffset_, int yOffset_, int r_, int g_, int b_)
    {
        size = size_;
        radius=radius_;
        originalRadius=radius;
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
        smallest=60;
        largest=radius+50;
        

    }
    public boolean isReady()
    {   
        if(!active)
        {
            return(this.breathe(smallest, largest)==radius);
        }
        else
        {
            return false;
        }
        
    }
    public int breathe(int smallest_, int largest_)
    {
        if(0==0)
        {
            if(currentBreathe==0)
            {
                currentBreathe=radius;
            }
            if(shrinking && active)
            {
                if(currentBreathe>smallest_)
                {
                    currentBreathe--;
                }
                else 
                {
                    shrinking=!shrinking;
                }
            
            }
            if(!shrinking && active)
            {
                if(currentBreathe<largest_)
                {
                    currentBreathe++;
                }
                else
                {
                    shrinking=!shrinking;
                }
            }
            if(!active)
            {
                if(currentBreathe<radius)
                {
                    currentBreathe++;
                }
                else if(currentBreathe>radius)
                {
                    currentBreathe--;
                } 
            }
            
        }
        
        return currentBreathe;
    }

    
    public void display()
    {
        pushStyle();
        fill(r,g,b);
        //ellipse(xPos,yPos,size,size);
        if(active)
        {
            ellipse(xPos,yPos,size,size);
        }
        else
        {
            ellipse(seekXpos, seekYpos, size, size);
        }
        
        popStyle();
    }

    public void seek(int xTarget, int yTarget)
    {
        
        endX = xTarget;
        endY = yTarget;
        if(pct>=0.9f)
        {
            pct=0;
            beginX=seekXpos;
            beginY=seekYpos;
        }
        distX = endX - beginX;
        distY = endY - beginY;
        
        pct += step;
        if (pct < 1.0f) 
        {
            seekXpos = PApplet.parseInt((beginX + (pct * distX)));
            seekYpos = PApplet.parseInt((beginY + (pow(pct, exponent) * distY)));
        }
   
    }

    public void updateRadius(int radius_)
    {
        radius=radius_;
    }

    public void update(float angle_, int xOffset_, int yOffset_)
    {
        angle+=angle_;
        xOffset=xOffset_;
        yOffset=yOffset_;
        xPos=cos(radians(angle));
        yPos=sin(radians(angle));
        
        xPos*=radius;
        yPos*=radius;
        xPos+=xOffset;
        yPos+=yOffset;
        if(active)
        {
            beginX=xPos;
            beginY=yPos;
        }
        //println(angle);
        
        
    }


    public float getAngle()
    {
        return angle;
    }


}
class Seekers
{
    ArrayList<Seeker> seekers;
    int xOffset, yOffset;
    float angle=1;
    int smallest,largest;
    int currentBreathe=0;
    int seeking=0;
    Seekers(int size_, int radius_, int xOffset_, int yOffset_, int amount)
    {
        seekers = new ArrayList<Seeker>();
        int angleOffset=360/amount;
        xOffset=xOffset_;
        yOffset=yOffset_;
        smallest=60;
        largest=radius_+50;
        for(int i = 0; i<amount; i++)
        {
            seekers.add(new Seeker(size_, i*angleOffset, PApplet.parseInt(random(smallest,largest)), xOffset_, yOffset_, PApplet.parseInt(random(170,242)),PApplet.parseInt(random(10)),PApplet.parseInt(random(10))));
         
        }
        for (int i = seekers.size() - 1; i>= 0; i--)
        {   
            Seeker quick = seekers.get(i);
                
            quick.update(angle, xOffset, yOffset);
        }
    }
    public float getAngle()
    {
        return angle;
    }
    public void updateRadius(int radius_)
    {
        for (int i = seekers.size() - 1; i>= 0; i--)
        {   
            Seeker quick = seekers.get(i);
                
            quick.updateRadius(radius_);
        } 
    }

    public void update(int xOffset_, int yOffset_)
    {
        for (int i = seekers.size() - 1; i>= 0; i--)
        {
            Seeker quick = seekers.get(i);
            
           
            quick.update(angle, xOffset_, yOffset_);
        }
       
    }
    public void breathe(int smallest_, int largest_)
    {
        for (int i = seekers.size() - 1; i>= 0; i--)
        {
            Seeker quick = seekers.get(i);
            
           
            quick.updateRadius(quick.breathe(smallest_,largest_));
            
        }
       
    }
    public void seekAll()
    {
        for (int i = seekers.size() - 1; i>= 0; i--)
        {
            Seeker quick = seekers.get(i);
            if(quick.active && i<locations.length)
            {
                quick.active=false;
            }
            if(quick.isReady())
            {
                if(i<locations.length)
                {
                    quick.seek((int)locations[i].x,(int)locations[i].y);
                }
                
            }
           
            
        }
    }
    public void stopSeekAll(int radius)
    {
        for (int i = seekers.size() - 1; i>= 0; i--)
        {
            
            Seeker quick = seekers.get(i);
            if(!quick.active)
            {
                println(abs(quick.xPos-quick.seekXpos));
                int temp1 = (int)quick.xPos;
                int temp2 = (int)quick.yPos;
                quick.seek(temp1,temp2);
                quick.exponent=1;
            
                if(abs(quick.xPos-quick.seekXpos)<100 || abs(quick.yPos-quick.seekYpos)<100)
                {
                    if(!quick.active)
                    {
                        
                        if(abs(quick.xPos-quick.seekXpos)<10 && abs(quick.yPos-quick.seekYpos)<10)
                        {
                            
                            quick.active=true;
                           
                            quick.exponent=PApplet.parseInt(random(2,4));
                            
                            
                        }
                        
                        
                    
                    
                    }
                
                
                }
            }
            

            
            
            
        }
    }
    public void seek()
    {
        Seeker quick = seekers.get(seeking);
        if(quick.active)
        {
            quick.active=false;
        }
        if(quick.isReady())
        {
            if(seeking<=locations.length)
            {
                quick.seek((int)locations[seeking].x,(int)locations[seeking].y);
            }
        }
    }
    public void increaseSeeking()
    {
        seeking++;
    }
    public void resetSeeking()
    {
        seeking=0;
    }
    public void display()
    {
        for (int i = seekers.size() - 1; i>= 0; i--)
        {
            Seeker quick = seekers.get(i);
            quick.display();
           
            
        }
       
    }
}
  public void settings() {  size(1920,1080,P2D);  smooth(8); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FWCD_Fish_Tank_2022_Starter" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
