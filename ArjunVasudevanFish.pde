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
    float step = 0.005;    // Size of each step along the path
    float pct = 0.0;      // Percentage traveled (0.0 to 1.0)

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
        control = new Seeker(int(6*PI),100,width/2,height/2,15,0,0,0);
        
        
        
        
        
        //formula for max amnt
        //(radius*2/(SIZE/PI)) = max for when size is 30
        smallest=(radius)/(size_/amount);
        smallest=60;
        largest=radius+50;
        
        
        
    }
    int startTime=0;
    int startTime2=0;
    int currentTime=millis();
    void move()
    {
        if(currentTime-startTime2>6000)
        {
            
            startTime2=millis();
            pct = 0.0;
            beginX = xPos;
            beginY = yPos;
            endX = random(100,1800);
            endY = random(100,800);
            distX = endX - beginX;
            distY = endY - beginY;
        }
        pct += step;
        if (pct < 1.0) 
        {
            xPos = int(beginX + (pct * distX));
            yPos = int(beginY + (pow(pct, exponent) * distY));
        }
    }
    void display()
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
    
    int getX()
    {
        return xPos;
    }
    int getY()
    {
        return yPos;
    }
}