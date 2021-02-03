import java.util.ArrayList;

//triangle stack
ArrayList<Triangle> triangles;

Triangle curr;
Triangle next;
public void setup()
{
  size(500,500);
  triangles = new ArrayList<Triangle>();
  int col = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  Triangle first = new Triangle(0,500,500, col);
  triangles.add(first);
}
//using bfs to draw triangles so triangles get drawn one at a time
public void draw()
{
  if(!triangles.isEmpty()){
    curr = triangles.get(0);
    curr = triangles.remove(0);
    curr.drawTriangle();
    if(curr.getLen() >10){
      int col = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
      triangles.add(new Triangle(curr.getX(),curr.getY(),curr.getLen()/2,col));
      triangles.add(new Triangle(curr.getX() + curr.getLen()/2,curr.getY(),curr.getLen()/2,col));
      triangles.add(new Triangle(curr.getX() + curr.getLen()/4,(int)(curr.getY()-(float)((Math.sqrt(3)*(curr.getLen()/4)))) ,curr.getLen()/2, col));

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
  private int col;
  Triangle(int xx, int yy,int l, int c){
    x = xx;
    y = yy;
    len = l;
    col = c;
  }
  
  void drawTriangle(){
    fill(col);
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
