class Antlion extends Character {
  // FIELDS //
  PImage npc;
  PVector acc = new PVector(random(1, 4), random(0));
  // CONSTRUCTOR //
  Antlion(PVector pos, PVector size) {
    super(pos, size);
    npc = loadImage("avatar.png");
  }

  // METHODS //
  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    imageMode(CENTER);
    image(npc, 0, 0);
    imageMode(CORNER);
    popMatrix();
  }

  @Override
  void update() {
    super.update();
    // accelerate(acc);
    println(vel.x + " X VEL");
    println(vel.y + " Y VEL");
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
      // add boundary detection
      if (pos.x > (width - size.x / 2)) {
        // hit right edge
        pos.x = width - size.x / 2;
      }

      if (pos.x < (0 + size.x / 2)) {
        // hit left edge
        pos.x = 0 + size.x / 2;
      }

      if (pos.y > (height - size.y / 2)) {
        // hit bottom edge
        pos.y = height - size.y / 2;
      }

      if (pos.y < (0 + size.y / 2)) {
        // hit top edge
        // win level!
      }
  }

}
