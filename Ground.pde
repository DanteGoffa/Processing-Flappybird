class ground
{  
  PImage image;
  
  ground()
  {
    image = loadImage("ground.png");
  }
  
  void display()
  {
    for(int i = 0; i < width; i += (image.width - 12))
    {
      image(image, i, height - image.height);
    } 
  }
  
  void checkHit (bird bird)
  {
     if(bird.getY() + (bird.getImgH() / 2) >= height - image.height)
     {
       bird.kill(); 
     }
  }
  
  float getH()
  {
    return image.height; 
  }
}