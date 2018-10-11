class PowerUps {
  // FIELDS //
  PVector pos;
  PVector size;
  color col;
  PImage fruit;
  int latestRecordedTime;
  int timeInterval;

  PowerUps(PVector pos) {
    this.pos = pos;
    size = new PVector(50, 50);
    col = color(0, 255, 0);
    fruit = loadImage("good-fruit.png");
    timeInterval = 1000;
    latestRecordedTime = millis();
  }

  void render() {
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

      if (millis() > latestRecordedTime + timeInterval) {
        latestRecordedTime = millis();
        ant.goodFruitAcquired = true;
      }

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