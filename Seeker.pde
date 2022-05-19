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
    float step = 0.008;    // Size of each step along the path
    float pct = 0.0;      // Percentage traveled (0.0 to 1.0)
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
    boolean isReady()
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
    int breathe(int smallest_, int largest_)
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

    
    void display()
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

    void seek(int xTarget, int yTarget)
    {
        
        endX = xTarget;
        endY = yTarget;
        if(pct>=0.9)
        {
            pct=0;
            beginX=seekXpos;
            beginY=seekYpos;
        }
        distX = endX - beginX;
        distY = endY - beginY;
        
        pct += step;
        if (pct < 1.0) 
        {
            seekXpos = int((beginX + (pct * distX)));
            seekYpos = int((beginY + (pow(pct, exponent) * distY)));
        }
   
    }

    void updateRadius(int radius_)
    {
        radius=radius_;
    }

    void update(float angle_, int xOffset_, int yOffset_)
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


    float getAngle()
    {
        return angle;
    }


}