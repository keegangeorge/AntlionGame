/**
 * IAT 312 Antlion Game
 * @author Keegan George
 * @version 1.0 (2019-10-04)
 */

// IMPORT LIBRARIES //

// GAME STATES //
int gameState;
final int INTRO = 0;
final int RULES = 1;
final int LVL_SELECTOR = 2;
final int LVL_1 = 3;
final int LVL_2 = 4;
final int LVL_3 = 5;
final int GAME_OVER = 6;
final int WIN_SCREEN = 7;
PImage bg;

// LEVEL BOUNDARIES //
final float SCREEN_MIN = 720; // Player Y-COORD Minimum
final float SCREEN_MAX = 0; // Player Y-COORD Maxmimum

// GLOBAL IMAGES //

// GLOBAL FONTS //

// GLOBAL OBJECTS //
float cameraX, cameraY;
Screen introScreen, instructionScreen, levelSelectorScreen,
  gameOverScreen, winnerScreen;
Hud headsUpDisplay;

Ant ant;
// Antlion antlion;

// GLOBAL BOOLEANS //
boolean keyLeft, keyRight, keyUp, keyDown;

// GLOBAL ARRAYLISTS //
ArrayList <PowerUps> goodFruit = new ArrayList();
ArrayList <PowerDepletion> badFruit = new ArrayList();
ArrayList <Barrier> barrier = new ArrayList();
ArrayList <Antlion> antlion = new ArrayList();
float numFruits = 5;
float numBarrier = 5;
float numAntlion = 1;

// GLOBAL COLORS //

// AUDIO //

// GUI //
Button btnLevelOne, btnLevelTwo, btnLevelThree;
Button btnRules, btnBack;
PImage btnLevelOneReg, btnLevelOneHover;
PImage btnLevelTwoReg, btnLevelTwoHover;
PImage btnLevelThreeReg, btnLevelThreeHover;
PImage btnRulesReg, btnRulesHover;
PImage btnBackReg, btnBackHover;

void initButtons() {
  // Level 1 Button //
  btnLevelOneReg = loadImage("buttons/btn-level1.png");
  btnLevelOneHover = loadImage("buttons/btn-level1-hover.png");
  btnLevelOne = new Button(new PVector(width / 2, height / 2), btnLevelOneReg, btnLevelOneHover);
  // Level 2 Button //
  btnLevelTwoReg = loadImage("buttons/btn-level2.png");
  btnLevelTwoHover = loadImage("buttons/btn-level2-hover.png");
  btnLevelTwo = new Button(new PVector(width / 2, height / 2), btnLevelTwoReg, btnLevelTwoHover);
  // Level 3 Button //
  btnLevelThreeReg = loadImage("buttons/btn-level1.png");
  btnLevelThreeHover = loadImage("buttons/btn-level1-hover.png");
  btnLevelThree = new Button(new PVector(width / 2, height / 2), btnLevelThreeReg, btnLevelThreeHover);
  // Rules Button //
  btnRulesReg = loadImage("buttons/btn-level1.png");
  btnRulesHover = loadImage("buttons/btn-level1-hover.png");
  btnRules = new Button(new PVector(width / 2, height / 2), btnRulesReg, btnRulesHover);
  // Back Button //
  btnBackReg = loadImage("buttons/btn-level1.png");
  btnBackHover = loadImage("buttons/btn-level1-hover.png");
  btnBack = new Button(new PVector(width / 2, height / 2), btnBackReg, btnBackHover);

}

void buttonActions() {
  // LEVEL BUTTONS //
  btnLevelOne.action(LVL_1);
  btnLevelTwo.action(LVL_1);
  btnLevelThree.action(LVL_1);

  // ACTION BUTTONS //
  btnBack.action(INTRO);
  btnRules.action(RULES);


}




/**
 * Setup method
 *
 */
void setup() {
  size(1280, 720);
  frameRate(120);
  smooth();
  surface.setTitle("Antlion Game");
  gameState = 3; // temporarily init state to adjust where to start
  initObjects();
  bg = requestImage("bg1.jpg");
  initButtons();
}

/**
 * Method consolidatign the initialization of objects
 *
 */
void initObjects() {
  headsUpDisplay = new Hud();

  for (int i = 0; i < numFruits; i++) {
    goodFruit.add(new PowerUps(new PVector(random(width), random(-720, height))));
  }

  for (int i = 0; i < numFruits; i++) {
    badFruit.add(new PowerDepletion(new PVector(random(width), random(-720, height))));
  }

  for (int i = 0; i < numBarrier; i++) {
    barrier.add(new Barrier(new PVector(random(width), random(-720, height / 2)), new PVector(random(200, 300), 50)));
  }

  ant = new Ant(new PVector(height, width / 2), new PVector (74, 128));

  for (int i = 0; i < numAntlion; i++) {
    //antlion.add(new Antlion(new PVector(random(width), random(height), new PVector(400, 349))));
    antlion.add(new Antlion(new PVector(random(width), random(height)), new PVector(200, 175)));
  }

  // antlion = new Antlion(new PVector(random(width), random(height)), new PVector(400, 349));
}

/**
 * Draw metho
 *
 */
void draw() {
  buttonActions();
  background(255);
  println(ant.pos.y);
  surface.setTitle("Antlion Game" + "   | FPS: " + (int) frameRate);
  cameraX = -ant.pos.x + width / 2;
  cameraY = (-ant.pos.y - 12) + width / 2;
  pushMatrix();
  image(bg, 0, -1280);

  translate(0, cameraY);


  ant.update();
  controlGameState();
  // antlion.update();
  popMatrix();
  btnLevelOne.update();


  headsUpDisplay.render();
}

void controlGameState() {
  switch(gameState) {
  case INTRO: // gameState = 0;
    // render intro stuff
    break;
  case RULES: // gameState = 1;
    // render instructions screen
    break;
  case LVL_SELECTOR: // gameState = 2;
    // render level selector screen
  case LVL_1: // gameState = 3;
    // render level 1 screen
    for (int i = 0; i < goodFruit.size(); i++) {
      PowerUps pu = goodFruit.get(i);
      pu.render();
      pu.acquire(goodFruit);
    }

    for (int i = 0; i < badFruit.size(); i++) {
      PowerDepletion pd = badFruit.get(i);
      pd.render();
      pd.acquire(badFruit);
    }

    for (int i = 0; i < barrier.size(); i++) {
      Barrier b = barrier.get(i);
      if (b.overlap(b) == true) {
        barrier.remove(this);
        //barrier.clear();
        println("there are overlapping barriers");
        //barrier.add(new Barrier(new PVector(random(width), random(-720, height / 2)), new PVector(random(200, 300), 50)));
        b.render();
        b.acquire(barrier);
      } else {
        b.render();
        b.acquire(barrier);
      }

      //b.render();
      //b.acquire(barrier);
    }

    for (int i = 0; i < antlion.size(); i++) {
      antlion.get(i).update();
    }
    break;
  case LVL_2: // gameState = 4;
    // render level 2 screen
    break;
  case LVL_3: // gameState = 5;
    // render level 3 screen
    break;
  case GAME_OVER: // gameState = 6;
    // render game over screen
    background(150, 0, 0);
    break;
  case WIN_SCREEN: // gameState = 7;
    // render winner screen
    break;
  }
}

void keyPressed() {
  if (key == CODED && keyCode == RIGHT || key == 'd' || key == 'D') keyRight = true;
  if (key == CODED && keyCode == LEFT || key == 'a' || key == 'A') keyLeft = true;
  if (key == CODED && keyCode == UP || key == 'w' || key == 'W') keyUp = true;
  if (key == CODED && keyCode == DOWN || key == 's' || key == 'S') keyDown = true;
}

void keyReleased() {
  if (key == CODED && keyCode == RIGHT || key == 'd' || key == 'D') keyRight = false;
  if (key == CODED && keyCode == LEFT || key == 'a' || key == 'A') keyLeft = false;
  if (key == CODED && keyCode == UP || key == 'w' || key == 'W') keyUp = false;
  if (key == CODED && keyCode == DOWN || key == 's' || key == 'S') keyDown = false;
}