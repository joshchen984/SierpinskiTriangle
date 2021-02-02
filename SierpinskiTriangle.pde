import java.util.ArrayDeque;

//triangle stack
ArrayDeque<Triangle> triangles;

Triangle curr;
Triangle next;
public void setup()
{
  size(500,500);
  triangles = new ArrayDeque<Triangle>();
  Triangle first = new Triangle(0,500,500);
  triangles.add(first);
}
//using bfs to draw triangles so triangles get drawn one at a time
public void draw()
{
  if(!triangles.isEmpty()){
    curr = triangles.pop();
    curr.drawTriangle();
    if(curr.getLen() >10){
      triangles.add(new Triangle(curr.getX(),curr.getY(),curr.getLen()/2));
      triangles.add(new Triangle(curr.getX() + curr.getLen()/2,curr.getY(),curr.getLen()/2));
      triangles.add(new Triangle(curr.getX() + curr.getLen()/4,(int)(curr.getY()-(float)((Math.sqrt(3)*(curr.getLen()/4)))) ,curr.getLen()/2));

    }
    
  }
    
}
public void mouseDragged()//optional
{

}

//RECURSIVE IMPLEMENTATION
public void sierpinski(int x, int y, int len) 
{
  if(len <=10){
    return;
  }
  drawTriangle(x,y,len);
  sierpinski(x,y,len/2);
  sierpinski(x+len/2,y,len/2);
  sierpinski(x+len/4,(int)(y-(float)((Math.sqrt(3)*(len/4)))),len/2);
}

public void drawTriangle(int x, int y, int len){
  triangle(x,y,x+len,y,x+(len/2), y-(float)((Math.sqrt(3)*(len/2))));
}


class Triangle{
  private int x, y, len;
  Triangle(int xx, int yy,int l){
    x = xx;
    y = yy;
    len = l;
  }
  
  void drawTriangle(){
    triangle(x,y,x+len,y,x+(len/2), y-(float)((Math.sqrt(3)*(len/2))));
  }
  
  int getLen(){
    return len;
  }
  int getX(){
    return x;
  }
  int getY(){
    return y;
  }
}
