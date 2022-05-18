class Seekers
{
    ArrayList<Seeker> seekers;
    int xOffset, yOffset;
    float angle=1;
    int smallest,largest;
    int currentBreathe=0;
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
            seekers.add(new Seeker(size_, i*angleOffset, radius_, xOffset_, yOffset_, int(random(170,242)),int(random(10)),int(random(10))));
         
        }
        for (int i = seekers.size() - 1; i>= 0; i--)
        {   
            Seeker quick = seekers.get(i);
                
            quick.update(angle, xOffset, yOffset);
        }
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

    void display()
    {
        for (int i = seekers.size() - 1; i>= 0; i--)
        {
            Seeker quick = seekers.get(i);
            quick.display();
           
            
        }
       
    }
}