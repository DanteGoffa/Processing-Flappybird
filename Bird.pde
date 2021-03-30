class bird
{
  float m_x, m_y, m_speed, m_acceleration, m_rotation = 1;
  boolean m_alive = true;
  PImage m_flying, m_nFlying;
  
  bird(float posX, float posY)
  {
    m_x = posX;
    m_y = posY;
    
    m_speed = 0;
    m_acceleration = 0.20;
    
    m_flying = loadImage("flappy2.png");
    m_nFlying = loadImage("flappy.png");
  }
  
  void display()
  {
    imageMode(CENTER);
    
    pushMatrix();
    
    translate(m_x, m_y);
    rotate(m_rotation);
    
    if(m_alive)
    {
      image(m_flying, 0, 0); 
    }
    
    else
    {
       image(m_nFlying, 0, 0);
    }
    
    popMatrix();
    
    imageMode(CORNER);
  }
  
  void kill()
  {
    m_alive = false; 
  }
  
  boolean isAlive()
  {
    return m_alive; 
  }
  
  float getImgH()
  {
    return m_flying.height; 
  }
  
  float getY()
  {
     return m_y;
  }
  
  float getX()
  {
    return m_x; 
  }
  
  void move()
  {
    if(m_y + (m_flying.height / 2) < height - g.getH())
    {
      m_y -= m_speed;
      m_speed -= m_acceleration;
      m_rotation = -m_speed / 5;
      if (m_rotation > PI / 2)
      {
        m_rotation = PI / 2;
      }
    }
  }
  
  void jump()
  {
    if(m_alive)
    {
      m_speed = 5;
    }
  }
  
  void reset()
  {
     m_alive = true;
     m_speed = 0;
     m_x = 200;
     m_y = 100;
  }
  
  void raiseRotation()
  {
    m_rotation = 5; 
  }
}