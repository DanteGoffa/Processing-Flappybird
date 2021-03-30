background b;
ground g;
bird bi;
score s;

ArrayList<pipe> pipes = new ArrayList<pipe>();

void setup()
{
  size(600,500);
  
  b = new background();
  g = new ground();
  bi = new bird(200, 100);
  s = new score();
  
  makePipes();
}

void draw()
{  
  b.display();
  
  for(int i = 0; i < pipes.size(); ++i)
  {
    pipes.get(i).checkHit(bi);
    pipes.get(i).display();
    pipes.get(i).move(bi);
    
    if(pipes.get(i).passed(bi))
    {
      s.raiseScore();
    }
    
    if(pipes.get(i).getX() + pipes.get(i).getW() < 0)
    {
      pipes.remove(i);
      --i;
    }
  }
  
  if(width - pipes.get(pipes.size() - 1).getX() >= 200)
  {
    makePipes();
  }
  
  g.display();
  g.checkHit(bi);
  
  bi.display();
  bi.move();
  
  s.display();
}

void keyPressed()
{
  if(key == ' ')
  {
     bi.jump();
  }
  
  if(key == 'r')
  {
    resetGame(); 
  }
}

void resetGame()
{
  bi.reset();
  s.reset();
  pipes.clear();
  makePipes();
}

void makePipes()
{
   pipes.add(new pipe(random(50, 250)));
}