class Barrier {
  // FIELDS //
  PVector pos;
  PVector size;
  PImage img;


  // CONSTRUCTOR //
  Barrier(PImage img, PVector pos, PVector size) {
    this.img = img;
    this.pos = pos;
    this.size = size;

  }

  // METHODS //
  void render() {
    // pushMatrix();
    // pushStyle();
    // translate(pos.x, pos.y);
    // fill(#DB975E);
    // strokeWeight(5);
    // stroke(0);
    // rect(-size.x / 2, -size.y / 2, size.x, size.y);
    // popStyle();
    // popMatrix();
    pushMatrix();
    translate(pos.x, pos.y);
    image(img, -size.x / 2, -size.y / 2, size.x, size.y);
    popMatrix();
  }

  void acquire(ArrayList barrier) {
    if (abs(ant.pos.x - pos.x) < ant.size.x / 2 + size.x / 2 &&
      abs(ant.pos.y - pos.y) < ant.size.y / 2 + size.y / 2) {
      // also handle energy here
      println("Hit Barrier!");
      ant.vel.x *= -1;
      ant.vel.y *= -1;
    }
  }
} // class end
