class Character {
  // FIELDS //
  PVector pos, vel;
  PVector size;
  float dampener = 0.8;
  color mainColor = color(0, 255, 0);

  // CONSTRUCTOR //
  Character(PVector pos, PVector size) {
    this.pos = pos;
    this.size = size;
    vel = new PVector();
  }

  // METHODS //
  void moveCharacter() {
    vel.mult(dampener);
    pos.add(vel);
  }

  void accelerate(PVector acc) {
    vel.add(acc);
  }

  void render() {
    pushMatrix();
    fill(mainColor);
    translate(pos.x,pos.y);
    ellipse(0, 0, size.x, size.y);
    popMatrix();
  }

  boolean hitCharacter(Character other) {
    if (abs(pos.x - other.pos.x) < size.x / 2 + other.size.x / 2 && abs(pos.y - other.pos.y) < size.y / 2 + other.size.y / 2)
    {
      return true;
    }
    return false;
  }

  void detectBoundaries() {
      // add boundary detection


  }

  void update() {
    render();
    moveCharacter();
    detectBoundaries();
  }
}
