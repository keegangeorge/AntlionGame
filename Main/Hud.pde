class Hud {
  // FIELDS //
  float energyBar;
  PImage energyContainer = loadImage("hud/energy-container.png");
  String strEnergy = "ENERGY";
  PImage lifeContainer = loadImage("hud/life-container.png");
  PImage extraLife = loadImage("hud/extra-life.png");
  int lifeOne = 255;
  int lifeTwo = 255;
  int lifeThree = 255;

  //2273
  //480
  // METHODS //
  void render() {
    energyBar = map(ant.dampener, 0.1, 0.8, 20, 237);
    pushMatrix();
    pushStyle();
    //image(energyContainer, 0, 0, 568.25, 120);

    translate(689, 29);
    image(energyContainer, 0, 0);

    noStroke();
    // background square
    // energy bar background
    fill(255);
    translate(234, 48);
    rect(0, 0, 237, 27, 0);
    // energy bar

    fill(#ff5964);
    rect(0, 0, energyBar, 27, 0);
    fill(255);
    image(lifeContainer, -895, -56, 327.5, 116);
    tint(255, lifeOne);
    image(extraLife, -783, -36, 45.875, 59.125);
    tint(255, lifeTwo);

    image(extraLife, -783 + 65, -36, 45.875, 59.125);
    tint(255, lifeThree);

    image(extraLife, -783 + (65*2), -36, 45.875, 59.125);


    popStyle();
    popMatrix();

    if (ant.life >= 3) {
      lifeOne = 255;
      lifeTwo = 255;
      lifeThree = 255;
    } else if (ant.life < 3 && ant.life > 1) {
      lifeOne = 255;
      lifeTwo = 255;
      lifeThree = 50;
    } else if (ant.life < 2 && ant.life > 0) {
      lifeOne = 255;
      lifeTwo = 50;
      lifeThree = 50;
    } else if (ant.life < 1) {
      lifeOne = 50;
      lifeTwo = 50;
      lifeThree = 50;
    }
  }
} // class end