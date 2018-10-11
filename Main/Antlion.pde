class Antlion extends Character {
  // FIELDS //
  PImage npc;
  float angle;
  // PVector acc = new PVector(random(0.5, 1), random(-1, 1));
  float acc = 1;
  PVector defaultAcc = new PVector(acc, 0);
  PVector alternateAcc = new PVector(-acc, 0);

  // CONSTRUCTOR //
  Antlion(PVector pos, PVector size) {
    super(pos, size);
    npc = loadImage("antlionSmall.png");
  }

  // METHODS //
  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(radians(angle));
    imageMode(CENTER);
    image(npc, 0, 0, size.x, size.y);
    imageMode(CORNER);
    popMatrix();
  }

  @Override
    void update() {
    super.update();
    accelerate(defaultAcc);
    angle += random(1);
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
    // float randomBoundaryMax = random(200, 600);
    // if (pos.x > randomBoundaryMax) {
    //   accelerate(alternateAcc);
    // }


    if (pos.x > width) {
      pos.x = random(width, width + 100);
      killed();
      respawn();
    }
  }

  void killed() {
    antlion.remove(this);
  }

  void respawn() {
    antlion.add(new Antlion(new PVector(0, random(ant.pos.y)), new PVector(200, 175)));
  }
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