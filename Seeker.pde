class Seeker
{
    
    int size;
    float xPos;
    float yPos;
    int xOffset;
    int yOffset;
    int radius;
    float angle;
    boolean shrinking=true, active=true;
    int r, g, b;
    int smallest,largest;
    int currentBreathe=0;
    int seekXpos,seekYpos;
  

    Seeker(int size_, float angle_, int radius_, int xOffset_, int yOffset_, int r_, int g_, int b_)
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
        //println(angle);
        
        
    }


    float getAngle()
    {
        return angle;
    }


}