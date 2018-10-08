class Hud {
  // FIELDS //
  float energyBar;
  String strEnergy = "ENERGY";
  PFont fontHud = loadFont("ProximaNovaExCn-Semibold-48.vlw");

  // METHODS //
  void render() {
    energyBar = map(ant.dampener, 0.1, 0.8, 20, 400);
    pushMatrix();
    pushStyle();
    translate(689, 29);

    noStroke();
    // background square
    fill(#f4b503);
    rect(0, 0, 564, 111, 10);
    // energy bar background
    fill(255);
    translate(134, 22);
    rect(0, 0, 400, 27, 282);
    // energy bar
    fill(#e26100);
    rect(0, 0, energyBar, 27, 282);
    fill(255);
    textFont(fontHud);
    textSize(38);
    text(strEnergy, -114, 26);
    popStyle();
    popMatrix();
  }
} // class end