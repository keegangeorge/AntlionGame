class Ant extends Character {
  // FIELDS //
  boolean isMoving;
  float energy;
  float acc = 4;
  float angle;
  PVector upAcc = new PVector(0, -acc);
  PVector downAcc = new PVector(0, acc);
  PVector leftAcc = new PVector(-acc, 0);
  PVector rightAcc = new PVector(acc, 0);
  PImage avatarLeft, avatarRegular, avatarRight;
  PImage avatarPowerUp, avatarPowerDeplete;
  boolean goodFruitAcquired, badFruitAcquired;

  // CONSTRUCTOR //
  Ant(PVector pos, PVector size) {
    super(pos, size);
    energy = 100;
    isMoving = false;
    avatarLeft = loadImage("ant/ant-left-regular.png");
    avatarRight = loadImage("ant/ant-right-regular.png");
    avatarRegular = loadImage("ant/ant-regular.png");
    avatarPowerUp = loadImage("ant/ant-powerup.png");
    avatarPowerDeplete = loadImage("ant/ant-powerdeplete.png");
    goodFruitAcquired = false;
    badFruitAcquired = false;
  }

  void decrementEnergy(float damage) {
    energy -= damage;
    if (dampener >= 0.5) {
      dampener = 0.5;
    } else if (dampener <= 0.5) {
      dampener = 0.2;
    }
  }

  void increaseEnergy(float boost) {
    energy += boost;
    dampener = boost;
  }


  void render() {
    //println("Fruit: " + badFruitAcquired);
    pushMatrix();
    translate(pos.x, pos.y);
    fill(255, 0, 0);
    if (keyPressed && keyCode == RIGHT || keyPressed && key == 'd' || keyPressed && key == 'D') {
      image(avatarRight, -size.x / 2, -size.x / 2, size.x, size.y);
    } else if (keyPressed && keyCode == LEFT || keyPressed && key == 'a' || keyPressed && key == 'A') {
      image(avatarLeft, -size.x / 2, -size.x / 2, size.x, size.y);
    } else if (goodFruitAcquired == true) {
      image(avatarPowerUp, -size.x / 2, -size.x / 2, size.x, size.y);
    } else if (goodFruitAcquired == false) {
      image(avatarRegular, -size.x / 2, -size.x / 2, size.x, size.y);
    } else if (badFruitAcquired == true) {
      image(avatarPowerDeplete, -size.x / 2, -size.x / 2, size.x, size.y);
    } else if (badFruitAcquired == false) {
      image(avatarRegular, -size.x / 2, -size.x / 2, size.x, size.y);
    } else {
      image(avatarRegular, -size.x / 2, -size.x / 2, size.x, size.y);
    }
    popMatrix();
  }


  void update() {
    super.update();
    antMovement();
    //println(dampener);
    //println("Movement: " + isMoving);
    if (keyRight || keyLeft || keyUp || keyDown) {
      isMoving = true;
      dampener -= 0.002;
    } else {
      isMoving = false;
    }

    if (dampener <= 0.1) {
      dampener = 0.1;
    }

    if (dampener >= 0.8) {
      dampener = 0.8;
    }

    // if (vel.x > 0 || vel.y > 0) {
    //   isMoving = true;
    // } else if (vel.x <= 0 || vel.y <= 0) {
    //   isMoving = false;
    // }

    if (keyPressed && key == 't') {
      dampener = 0.3;
    } else if (keyPressed && key == 'r') {
      dampener = 0.8;
    }
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
    if (keyUp) {
      accelerate(upAcc);
      goodFruitAcquired = false;
      badFruitAcquired = false;
    }
    if (keyDown) accelerate(downAcc);
  }
}
