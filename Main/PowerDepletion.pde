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


  void acquireAction() {
    ant.decrementEnergy(0.5);
  }
}
