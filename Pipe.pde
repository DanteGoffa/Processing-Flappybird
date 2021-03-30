class pipe
{
  private PImage m_top, m_bottom;
  private float m_x, m_y, m_topH, m_rectH, m_speed;
  private boolean m_passed = false, m_hit = false;
  
  pipe(float posY)
  {
     m_top = loadImage("pipe.png");
     m_bottom = loadImage("pipe1.png");
     
     m_x = width;
     m_y = -posY;
     m_topH =  m_top.height;
     m_rectH = 120;
  }
  
  void display()
  {
     image(m_top, m_x, m_y);
     image(m_bottom, m_x, m_y + (m_topH + m_rectH));
  }
  
  void move(bird b)
  {
    if(b.isAlive())
    {
      m_x -= 1.5;
    }
  }
  
  void checkHit(bird b)
  {
    if(!((b.getY() - b.getImgH() / 2) >= (m_y + m_topH) && (b.getY() + b.getImgH() / 2) <= (m_y + m_topH + m_rectH)) 
    && (b.getX() + (b.m_flying.width / 2) >= m_x && b.getX() - (b.m_flying.width / 2) <= m_x + m_top.width))
    {
      b.kill();
    }
  }
  
  float getTopH()
  {
    return m_topH; 
  }
  
  float getY()
  {
    return m_y; 
  }
  
  float getX()
  {
    return m_x; 
  }
  
  float getW()
  {
    return m_top.width; 
  }
  
  boolean passed(bird b)
  {
    if((b.getX() > m_x + m_top.width && b.m_alive) && !m_passed)
    {
      m_passed = true;
      return true;
    }
    return false;
  }
}