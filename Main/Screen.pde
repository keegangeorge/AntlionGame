class Screen {
  // FIELDS //
  PImage bgImg;

  Screen(PImage bgImg) {
    this.bgImg = bgImg;
  }

  void render() {
    imageMode(CORNER);
    background(255);
    // image(bgImg, 0, 0)
  }


}
