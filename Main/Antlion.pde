class Antlion extends Character {
  // FIELDS //
  PImage npc;
  float angle;
  PVector acc = new PVector(random(0.5, 1), random(-1, 1));
  // CONSTRUCTOR //
  Antlion(PVector pos, PVector size) {
    super(pos, size);
    npc = loadImage("antlion.png");
  }

  // METHODS //
  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    // rotate(radians(angle));
    imageMode(CENTER);
    image(npc, 0, 0, size.x, size.y);
    imageMode(CORNER);
    popMatrix();
  }

  @Override
  void update() {
    super.update();
    accelerate(acc);
    // angle += random(-3, 3);
  }

  // @Override
  // void detectBoundaries() {
  //   if (pos.x > (width - size.x / 2) || pos.x < (0 + size.x / 2)) {
  //     // hit right or left edges
  //     vel.x *= -1;
  //   }
  //
  //   if (pos.y > (height - size.y / 2) || pos.y < (0 + size.y / 2)) {
  //     // hit bottom or top edges
  //     vel.y *= -1;
  //   }
  // }

  @Override
  void detectBoundaries() {
      // // add boundary detection
      // if (pos.x > (width - size.x / 2)) {
      //   // hit right edge
      //   pos.x = width - size.x / 2;
      // }
      //
      // if (pos.x < (0 + size.x / 2)) {
      //   // hit left edge
      //   pos.x = 0 + size.x / 2;
      // }
      //
      // if (pos.y > (height - size.y / 2)) {
      //   // hit bottom edge
      //   pos.y = height - size.y / 2;
      // }
      //
      // if (pos.y < (0 + size.y / 2)) {
      //   // hit top edge
      //   // win level!
      // }
  }

}
