class ArjunVasudevanFish extends AnimatedObject
{
    int xPos, yPos;
    Seekers seekers;
    //int angle,radius;
    ArjunVasudevanFish(int xPos_, int yPos_)
    {
        xPos=xPos_;
        yPos=yPos_;
        //angle=0;
        //radius=80;
        seekers = new Seekers(30,150,width/2,height/2,12);
        
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
        seekers.display();

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