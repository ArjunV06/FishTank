class Seeker
{
    
    int size;
    float xPos;
    float yPos;
    int xOffset;
    int yOffset;
    int radius;
    float angle;
    
    int r, g, b;

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
        

    }

    void display()
    {
        pushStyle();
        fill(r,g,b);
        ellipse(xPos,yPos,size,size);
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