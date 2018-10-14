class Antlion extends Character {
  // FIELDS //
  PImage npc;
  float angle;
  float levelVelocity;

  // CONSTRUCTOR //
  Antlion(PVector pos, PVector size) {
    super(pos, size);
    npc = loadImage("antlionSmall.png");
    vel = new PVector(4, 0);
    angle = 40;
    levelVelocity = 2;
  }

  // METHODS //
  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(radians(angle));
    image(npc, -size.x / 2, -size.y / 2, size.x, size.y);
    popMatrix();
  }

  @Override
    void update() {
    render();
    pos.add(vel);
    detectBoundaries();
  }


  @Override
    void detectBoundaries() {
    if (ant.pos.x > width / 2) {
      vel.x = levelVelocity;
    } else if (ant.pos.x <= width / 2) {
      vel.x = -levelVelocity;
    }

    if (pos.x <= -500) {
      pos.x = ant.pos.x + 200;
      pos.y = ant.pos.y + 400;
    } else if (pos.x >= width + 500) { 
      pos.x = ant.pos.x - 200;
      pos.y = ant.pos.y + 400;
    }




    if (angle == 40) {
      vel = new PVector(levelVelocity, 0);
    }

    if (angle == 130) {
      vel = new PVector(0, levelVelocity);
    }

    if (pos.x >= random((width / 2) - 150, width)) {
      if (angle >= 40) {
        angle -= 90;
        if (angle >= -130) {
          angle = -40;
          vel = new PVector(0, -levelVelocity);
        }
      }
    }
  }
} // class end