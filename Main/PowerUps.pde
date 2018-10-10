class PowerUps {
  // FIELDS //
  PVector pos;
  PVector size;
  color col;
  PImage fruit;

  PowerUps(PVector pos) {
    this.pos = pos;
    size = new PVector(50, 50);
    col = color(0, 255, 0);
    fruit = loadImage("good-fruit.png");

  }

  void render() {
    // pushMatrix();
    // pushStyle();
    // translate(pos.x,pos.y);
    // fill(col);
    // strokeWeight(5);
    // stroke(0);
    // ellipse(0, 0, size.x, size.y);
    // popStyle();
    // popMatrix();
    pushMatrix();
    translate(pos.x, pos.y);
    imageMode(CENTER);
    image(fruit, 0, 0);
    imageMode(CORNER);
    popMatrix();
  }

  void acquire(ArrayList fruit) {
    if (abs(ant.pos.x - pos.x) < ant.size.x / 2 + size.x / 2 &&
    abs(ant.pos.y - pos.y) < ant.size.y / 2 + size.y / 2) {
      fruit.remove(this);
      // also handle energy here
      acquireAction();
    }
  }

  void acquireAction() {
    ant.increaseEnergy(0.8);
  }


} // class end


/*
 * fruit good = permanent tiny speed boost (speed related to energy)
 * bad fruit = decrease energy & speed 10%
 * barriers = 5 decrease energy
 * 1% decrease for movement
 *
 *
 *
*/
