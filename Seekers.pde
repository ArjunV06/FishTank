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
            seekers.add(new Seeker(size_, i*angleOffset, int(random(smallest,largest)), xOffset_, yOffset_, int(random(170,242)),int(random(10)),int(random(10))));
         
        }
        for (int i = seekers.size() - 1; i>= 0; i--)
        {   
            Seeker quick = seekers.get(i);
                
            quick.update(angle, xOffset, yOffset);
        }
    }
    float getAngle()
    {
        return angle;
    }
    void updateRadius(int radius_)
    {
        for (int i = seekers.size() - 1; i>= 0; i--)
        {   
            Seeker quick = seekers.get(i);
                
            quick.updateRadius(radius_);
        } 
    }

    void update(int xOffset_, int yOffset_)
    {
        for (int i = seekers.size() - 1; i>= 0; i--)
        {
            Seeker quick = seekers.get(i);
            
           
            quick.update(angle, xOffset_, yOffset_);
        }
       
    }
    void breathe(int smallest_, int largest_)
    {
        for (int i = seekers.size() - 1; i>= 0; i--)
        {
            Seeker quick = seekers.get(i);
            
           
            quick.updateRadius(quick.breathe(smallest_,largest_));
            
        }
       
    }
    void seekAll()
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
    void stopSeekAll(int radius)
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
                           
                            quick.exponent=int(random(2,4));
                            
                            
                        }
                        
                        
                    
                    
                    }
                
                
                }
            }
            

            
            
            
        }
    }
    void seek()
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
    void increaseSeeking()
    {
        seeking++;
    }
    void resetSeeking()
    {
        seeking=0;
    }
    void display()
    {
        for (int i = seekers.size() - 1; i>= 0; i--)
        {
            Seeker quick = seekers.get(i);
            quick.display();
           
            
        }
       
    }
}