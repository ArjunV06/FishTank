class DummyClass extends AnimatedObject
{
    int x,y;
    DummyClass(int xpos, int ypos)
    {
        x=xpos;
        y=ypos;
    }
    int getX()
    {
        return x;
    }
    int getY()
    {
        return y;
    }
    void display()
    {
        pushStyle();
        rectMode(CENTER);
        
        rect(x,y,50,50);
    }
}