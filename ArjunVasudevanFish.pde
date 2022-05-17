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
        smallest=60;
        largest=radius+50;
        
        
        
    }

    void display()
    {
        
        rectMode(CENTER);
        ellipse(xPos,yPos,20,20);
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