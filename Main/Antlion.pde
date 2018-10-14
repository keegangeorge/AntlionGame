class Antlion extends Character {
  // FIELDS //
  PImage npc;
  float angle;
  // PVector acc = new PVector(random(0.5, 1), random(-1, 1));
  // float acc = 1;
  // PVector alternateAcc = new PVector(-acc, 0);
  // PVector defaultAcc = new PVector(acc, 0);

  // CONSTRUCTOR //
  Antlion(PVector pos, PVector size) {
    super(pos, size);
    npc = loadImage("antlionSmall.png");
    vel = new PVector(4, 0);
    angle = 40;
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
    // super.update();
    // accelerate(defaultAcc);
    // angle += random(1);
  }


  @Override
    void detectBoundaries() {
      if (ant.pos.x > width / 2) {
        vel.x = 2;
      } else if (ant.pos.x <= width / 2) {
        vel.x = -2;
      }
      
      if (angle == 40) {
        vel = new PVector(2, 0);
      }

      if (angle == 130) {
        vel = new PVector(0, 2);
      }

      if (pos.x >= random((width / 2) - 150, width)) {
        if (angle >= 40) {
          angle -= 90;
          if (angle >= -130) {
            angle = -40;
            vel = new PVector(0, -2);
          }
        }
      }

      // if (pos.x >= random(width / 2, width)) {
      //   if (angle >= 40) {
      //     angle += 100;
      //     if (angle >= 150) {
      //       angle = 150;
      //       vel = new PVector(0, 2);
      //     }
      //   }
      // }
      //
      // if (pos.y >= (height - 200)) {
      //   if (angle >= 150) {
      //     angle -= 120;
      //     if (angle <= -50) {
      //       angle = 240;
      //       vel = new PVector(0, -2);
      //     }
      //   }
      // }


      //if (pos.x > (width - size.x / 2) || pos.x <= (0 + size.x / 2)) {
      //  vel.x *= -1;
      //  angle *= -1;
      //} else if (pos.y > (height - size.y / 2)) {
      //  vel.y *= -1;
      //}
      // if (pos.x > ant.pos.x - ant.pos.x/2) {
      //   pos.x = ant.pos.x - ant.pos.x/2;
      //   vel.x = -vel.x;
      // }
      // if (pos.x < ant.pos.x/2) {
      //   pos.x = ant.pos.x/2;
      //   vel.x = -vel.x;
      // }
    // float randomBoundaryMax = random(200, 600);
    // if (pos.x > randomBoundaryMax) {
    //   accelerate(alternateAcc);
    // }


    // if (pos.x > width) {
    //   pos.x = random(width, width + 100);
    //   killed();
    //   respawn();
    // }
  }

  void killed() {
    //antlion.remove(this);
  }

  void respawn() {
    //antlion.add(new Antlion(new PVector(0, random(ant.pos.y)), new PVector(200, 175)));
  }
  // // add boundary detection
  // if (pos.x > (width - size.x / 2)) {
  //   // hit right edge
  //   pos.x = width - size.x / 2;
  // }
  //
  // if (pos.x < (0 + size.x / 2)) {
  //   // hit left edge
  //   pos.x = 0 + size.x / 2;
  // }
  //
  // if (pos.y > (height - size.y / 2)) {
  //   // hit bottom edge
  //   pos.y = height - size.y / 2;
  // }
  //
  // if (pos.y < (0 + size.y / 2)) {
  //   // hit top edge
  //   // win level!
  // }
}


/**
 wall checking
  reverses velocity of the enemy when wall is hit
  void checkWalls() {
    if (pos.x > ant.pos.x - ant.pos.x/2) {
      pos.x = ant.pos.x - ant.pos.x/2;
      vel.x = -vel.x;
    }
    if (pos.x < ant.pos.x/2) {
      pos.x = ant.pos.x/2;
      vel.x = -vel.x;
    }
  }

*/