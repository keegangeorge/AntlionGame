class PowerUps {
  // FIELDS //
  PVector pos;
  PVector size;

  PowerUps(PVector pos) {
    this.pos = pos;
    size = new PVector(50, 50);
  }

  void render() {
    pushMatrix();
    pushStyle();
    translate(pos.x,pos.y);
    fill(0, 255, 0);
    strokeWeight(5);
    stroke(0);
    ellipse(0, 0, size.x, size.y);
    popStyle();
    popMatrix();
  }

  void acquire() {
    if (abs(ant.pos.x - pos.x) < ant.size.x / 2 + size.x / 2 &&
    abs(ant.pos.y - pos.y) < ant.size.y / 2 + size.y / 2) {
      goodFruit.remove(this);
      // also handle energy here
    }
  }


} // class end
