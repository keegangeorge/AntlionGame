class Ant extends Character {
  // FIELDS //
  float health;
  float acc = 6;
  PVector upAcc = new PVector(0, -acc);
  PVector downAcc = new PVector(0, acc);
  PVector leftAcc = new PVector(-acc, 0);
  PVector rightAcc = new PVector(acc, 0);

  // CONSTRUCTOR //
  Ant(PVector pos, PVector size) {
    super(pos, size);
    health = 100;
  }

  void decrementHealth(int damage) {
    health -= damage;
  }

  void update() {
    super.update();
    antMovement();

  }

  void antMovement() {
    if (keyRight) accelerate(rightAcc);
    if (keyLeft) accelerate(leftAcc);
    if (keyUp) accelerate(upAcc);
    if (keyDown) accelerate(downAcc);
  }
}