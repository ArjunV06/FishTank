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

    void display()
    {
        pushStyle();
        fill(r,g,b);
        ellipse(xPos,yPos,size,size);
        popStyle();
    }

    void update(int angle_, int xOffset_, int yOffset_)
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

    int getAngle()
    {
        return angle;
    }


}