class ArjunVasudevanFish extends AnimatedObject
{
    int xPos, yPos;
    Seekers seekers;
    int smallest,largest;
    int currentBreathe=0;
    boolean shrinking=true, active=true; //getting smaller
    int radius;
    //int angle,radius;
    ArjunVasudevanFish(int xPos_, int yPos_, int size_, int radius_, int xOffset_, int yOffset_, int amount)
    {
        xPos=xPos_;
        yPos=yPos_;
        radius=radius_;
        //angle=0;
        //radius=80;
        seekers = new Seekers(size_, radius_, xOffset_, yOffset_ ,amount);
        //formula for max amnt
        //(radius*2/(SIZE/PI)) = max for when size is 30
        smallest=(radius)/(size_/amount);
        largest=radius+50;
        
        
        
    }

    void display()
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
        seekers.update(this.getX(),this.getY());
        seekers.display();
        seekers.updateRadius(this.breathe(smallest, largest));
        if(keyPressed)
        {
            active=!active;
            
        }
        println(active,this.isReady());

        

    }
    boolean isReady()
    {   if(!active)
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
        if(frameCount%6==0)
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
    int getX()
    {
        return xPos;
    }
    int getY()
    {
        return yPos;
    }
}