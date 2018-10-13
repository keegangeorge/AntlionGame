class Button {
  // FIELDS //
  PImage btnRegular, btnHover;
  boolean btnState;
  PVector size;
  PVector pos;

  // CONSTRUCTOR //
  Button(PVector pos, PImage btnRegular, PImage btnHover) {
    this.pos = pos;
    this.btnRegular = btnRegular;
    this.btnHover = btnHover;
    size = new PVector(260, 108); // default size is 260x108, small is 187x108
    btnState = false;
  }

  Button(PVector pos, PVector size, PImage btnRegular, PImage btnHover) {
    this.pos = pos;
    this.size = size;
    this.btnRegular = btnRegular;
    this.btnHover = btnHover;
    btnState = false;
  }

  // METHODS //
  void render() {
    // imageMode(CORNER);
    if (btnState == false) {
      image(btnRegular, pos.x, pos.y, size.x, size.y);
    }

    if (btnState == true) {
      image(btnHover, pos.x, pos.y, size.x, size.y);
    }
    // imageMode(CENTER);
  }

  void hover() {
    if (mouseX >= pos.x && mouseX <= (pos.x + size.x) && mouseY > pos.y && mouseY <= (pos.y + size.y)) {
      btnState = true;
    } else {
      btnState = false;
    }
  }

  void action(int state) {
    if (mousePressed) {
      if (mouseX >= pos.x && mouseX <= (pos.x + size.x) && mouseY > pos.y && mouseY <= (pos.y + size.y)) {
        gameState = state;
      }
    }
  }

  void update() {
    render();
    hover();
  }
} // class end