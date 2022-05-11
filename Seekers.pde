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
            seekers.add(new Seeker(size_, i*angleOffset, radius_, xOffset_, yOffset_, int(random(170,242)),int(random(10)),int(random(10))));
         
        }
        for (int i = seekers.size() - 1; i>= 0; i--)
        {   
            Seeker quick = seekers.get(i);
                
            quick.update(angle, xOffset, yOffset);
        }
    }

    void display()
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