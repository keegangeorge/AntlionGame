class Character {
  // FIELDS //
  PVector pos, vel;
  PVector size;
  float dampener = 0.8;

  // CONSTRUCTOR //
  Character(PVector pos) {
    this.pos = pos;
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
    translate(pos.x,pos.y)
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
}
