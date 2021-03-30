class score
{
  int score = 0;
  PImage[] images = new PImage[0];
  
  score()
  {
     for(int i = 0; i < 10; ++i)
     {
       images = (PImage[]) append(images, loadImage(i + ".png"));
     }
  }
  
  void display()
  {
    if(score < 10)
    {
     image(images[score], 10, 10);
    }
    else if (score < 100)
    {
      float decimalScore = score / 10;
      image(images[int(decimalScore)], 10, 10);
      image(images[score - int(decimalScore) * 10], 50, 10);
    }
    else
    {
      float decimalScore = score / 100;
      int hundred = (int)decimalScore;
      int ten = int((score / 10) - hundred * 10);
      int single = score - hundred * 100 - ten * 10;
      
      image(images[hundred], 10, 10);
      image(images[ten], 50, 10);
      image(images[single], 90, 10);
    }
  }
  
  void reset()
  {
    score = 0; 
  }
  
  void raiseScore()
  {
    ++score; 
  }
}