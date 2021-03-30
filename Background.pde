class background
{
  private PImage image;
  
  background()
  {
     image = loadImage("background.png");
  }
  
  void display()
  {
    for(int i = 0; i < width; i += (image.width - 12))
    {
      image(image, i, 0);
    } 
  }
}