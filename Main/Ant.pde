class Ant extends Character {
  // FIELDS //
  float health;
  float acc = 3;
  float angle;
  PVector upAcc = new PVector(0, -acc);
  PVector downAcc = new PVector(0, acc);
  PVector leftAcc = new PVector(-acc, 0);
  PVector rightAcc = new PVector(acc, 0);
  PImage avatar;

  // CONSTRUCTOR //
  Ant(PVector pos, PVector size) {
    super(pos, size);
    health = 100;
    avatar = loadImage("avatar.png");
  }

  void decrementHealth(int damage) {
    health -= damage;
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    // TODO fix flipped angle causing arrow key incorrect direction
    // rotate(radians(angle));
    imageMode(CENTER);
    image(avatar, 0, 0);
    imageMode(CORNER);
    popMatrix();
  }

  void update() {
    super.update();
    antMovement();
  }

  void antMovement() {
    if (keyRight) {
      accelerate(rightAcc);
      angle += 5;
    }
    if (keyLeft) {
      accelerate(leftAcc);
      angle -= 5;
    }
    if (keyUp) accelerate(upAcc);
    if (keyDown) accelerate(downAcc);
  }
}
