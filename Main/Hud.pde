class Hud {
  // FIELDS //
  float energyBar;
  PImage energyContainer = loadImage("energy-container.png");
  String strEnergy = "ENERGY";
  PFont fontHud = loadFont("ProximaNovaExCn-Semibold-48.vlw");

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
    //fill(#f4b503);
    //rect(0, 0, 564, 111, 10);
    // energy bar background
    fill(255);
    translate(234, 48);
    rect(0, 0, 237, 27, 0);
    // energy bar
    
    fill(#ff5964);
    rect(0, 0, energyBar, 27, 0);
    fill(255);
    //textFont(fontHud);
    //textSize(38);
    //text(strEnergy, -114, 26);
    popStyle();
    popMatrix();
  }
} // class end