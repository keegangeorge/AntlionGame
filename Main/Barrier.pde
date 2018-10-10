class Barrier {
  // FIELDS //
  PVector pos;
  PVector size;

  // CONSTRUCTOR //
  Barrier(PVector pos, PVector size) {
    this.pos = pos;
    this.size = size;
  }

  // METHODS //
  void render() {
    pushMatrix();
    pushStyle();
    translate(pos.x, pos.y);
    fill(#DB975E);
    strokeWeight(5);
    stroke(0);
    rect(-size.x / 2, -size.y / 2, size.x, size.y);
    popStyle();
    popMatrix();
  }

  void acquire(ArrayList barrier) {
    if (abs(ant.pos.x - pos.x) < ant.size.x / 2 + size.x / 2 &&
      abs(ant.pos.y - pos.y) < ant.size.y / 2 + size.y / 2) {
      // also handle energy here
      println("hit barrier!!!");
      ant.vel.x *= -1;
      ant.vel.y *= -2;
    }
  }
  
  boolean overlap(Barrier other) {
    if (abs(pos.x - other.pos.x) < size.x / 2 + other.size.x / 2 &&
    abs(pos.y - other.pos.y) < size.y / 2 + other.size.y / 2) {
      return true;
    }
    return false;
  }
} // class end