class PowerDepletion extends PowerUps {


  PowerDepletion(PVector pos) {
    super(pos);
    size = new PVector (50, 50);
    col = color(255, 0, 0);
    fruit = loadImage("bad-fruit.png");
  }

  void render() {
    super.render();
  }


  @Override
    void acquire(ArrayList fruit) {
    if (abs(ant.pos.x - pos.x) < ant.size.x / 2 + size.x / 2 &&
      abs(ant.pos.y - pos.y) < ant.size.y / 2 + size.y / 2) {
      fruit.remove(this);
      ant.badFruitAcquired = true;
      acquireAction();
    }
  }

  void acquireAction() {
    ant.decrementEnergy(0.5);
  }
}