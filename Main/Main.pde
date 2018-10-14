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

// SCREEN BACKGROUNDS //
PImage bg; // delete?
PImage bgStart, bgLevel, bgRules;
PImage bgWin, bgLose;

// LEVEL BOUNDARIES //
final float SCREEN_MIN = 720; // Player Y-COORD Minimum
final float SCREEN_MAX = 0; // Player Y-COORD Maxmimum

// GLOBAL VARIABLES //
PImage icon;
float cameraX, cameraY;
boolean keyLeft, keyRight, keyUp, keyDown;
PImage styleStick, styleRockOne, styleRockTwo;
PVector styleStickSize, styleRockOneSize, styleRockTwoSize;


// GLOBAL OBJECTS //
Hud headsUpDisplay;
Ant ant;
Antlion antlion;

// GLOBAL ARRAYLISTS //
ArrayList <PowerUps> goodFruit = new ArrayList();
ArrayList <PowerDepletion> badFruit = new ArrayList();
ArrayList <Barrier> barrier = new ArrayList();
// ArrayList <Antlion> antlion = new ArrayList();
float numFruits = 5;
float numBarrier = 2;
// float numAntlion = 1;

// AUDIO //

// GUI //
Button btnLevelOne, btnLevelTwo, btnLevelThree;
Button btnRules, btnBack, btnPlayagain, btnMenu;
PImage btnLevelOneReg, btnLevelOneHover;
PImage btnLevelTwoReg, btnLevelTwoHover;
PImage btnLevelThreeReg, btnLevelThreeHover;
PImage btnRulesReg, btnRulesHover;
PImage btnBackReg, btnBackHover;
PImage btnPlayagainReg, btnPlayagainHover;
PImage btnMenuReg, btnMenuHover;

void initButtons() {
  // Level 1 Button //
  btnLevelOneReg = loadImage("buttons/btn-level1.png");
  btnLevelOneHover = loadImage("buttons/btn-level1-hover.png");
  btnLevelOne = new Button(new PVector(530, 290), btnLevelOneReg, btnLevelOneHover);
  // Level 2 Button //
  btnLevelTwoReg = loadImage("buttons/btn-level2.png");
  btnLevelTwoHover = loadImage("buttons/btn-level2-hover.png");
  btnLevelTwo = new Button(new PVector(530, 390), btnLevelTwoReg, btnLevelTwoHover);
  // Level 3 Button //
  btnLevelThreeReg = loadImage("buttons/btn-level3.png");
  btnLevelThreeHover = loadImage("buttons/btn-level3-hover.png");
  btnLevelThree = new Button(new PVector(530, 490), btnLevelThreeReg, btnLevelThreeHover);
  // Rules Button //
  btnRulesReg = loadImage("buttons/btn-rules.png");
  btnRulesHover = loadImage("buttons/btn-rules-hover.png");
  btnRules = new Button(new PVector(530, 590), btnRulesReg, btnRulesHover);
  // Back Button //
  btnBackReg = loadImage("buttons/btn-back.png");
  btnBackHover = loadImage("buttons/btn-back-hover.png");
  btnBack = new Button(new PVector(40, 613), new PVector(187, 108), btnBackReg, btnBackHover);
  // Play Again Button //
  btnPlayagainReg = loadImage("buttons/btn-playagain.png");
  btnPlayagainHover = loadImage("buttons/btn-playagain-hover.png");
  btnPlayagain = new Button(new PVector(314, 274), btnPlayagainHover, btnPlayagainReg);
  // Menu Button //
  btnMenuReg = loadImage("buttons/btn-menu.png");
  btnMenuHover = loadImage("buttons/btn-menu-hover.png");
  btnMenu = new Button(new PVector(568, 274), btnMenuHover, btnMenuReg);
}

void loadScreenBackgrounds() {
  bgStart = requestImage("screens/start-screen.png");
  bgRules = requestImage("screens/rules-screen.png");
  bgLevel = requestImage("screens/level-screen.png");
  bgWin = requestImage("screens/win-screen.png");
  bgLose = requestImage("screens/lose-screen.png");
  bg = requestImage("bg1.jpg");
  // bgLevelOne = requestImage()
  // bgLevelTwo = requestImage()
  // bgLevelThree = requestImage()
}

void setup() {
  size(1280, 720);
  frameRate(60);
  smooth();
  icon = loadImage("icon.png");
  surface.setIcon(icon);
  surface.setTitle("Antlion Game");
  gameState = 0; // temporarily init state to adjust where to start
  loadScreenBackgrounds();
  initButtons();
  initBarrierInfo();
  initObjects();
}

void initBarrierInfo() {
  styleStick = loadImage("obstacles/stick.png");
  styleRockOne = loadImage("obstacles/rock1.png");
  styleRockTwo = loadImage("obstacles/rock2.png");
  styleStickSize = new PVector(200, 56);
  styleRockOneSize = new PVector(132, 68);
  styleRockTwoSize = new PVector(113, 68);
}

void initObjects() {
  // HUD //
  headsUpDisplay = new Hud();
  // Good Fruit //
  for (int i = 0; i < numFruits; i++) {
    goodFruit.add(new PowerUps(new PVector(random(width), random(-720, height))));
  }
  // Bad Fruit //
  for (int i = 0; i < numFruits; i++) {
    badFruit.add(new PowerDepletion(new PVector(random(width), random(-720, height))));
  }
  // Barriers //
  for (int i = 0; i < numBarrier; i++) {
    barrier.add(new Barrier(styleStick, new PVector(random(100, width - 100), random(-720, height / 2)), styleStickSize));
    barrier.add(new Barrier(styleRockOne, new PVector(random(0 + styleRockOneSize.x / 2, width / 2), random(-720, height / 2)), styleRockOneSize));
    barrier.add(new Barrier(styleRockTwo, new PVector(random(width / 2, width - styleRockTwoSize.x / 2), random(-720)), styleRockTwoSize));
  }
  // Ant //
  ant = new Ant(new PVector(height, width / 2), new PVector (74, 128));
  // Antlion //
  // for (int i = 0; i < numAntlion; i++) {
  //   antlion.add(new Antlion(new PVector(random(width), random(height)), new PVector(200, 175)));
  // }
  PVector antlionSize = new PVector(200, 175);
  antlion = new Antlion(new PVector(200, height - 100), antlionSize);
}

void draw() {
  println(ant.pos.y);
  surface.setTitle("Antlion Game" + "   | FPS: " + (int) frameRate);
  println("GAME STATE: " + gameState);
  println(barrier.size());

  // REMOVE LATER! To test gameStates of win lose
  if (keyPressed && key == 'o') {
    gameState = WIN_SCREEN;
  } else if (keyPressed && key == 'p') {
    gameState = GAME_OVER;
  }


  controlGameState();

  if (gameState == GAME_OVER) {
    btnPlayagain.pos.x = 434;
    btnPlayagain.pos.y = 274;
    btnMenu.pos.x = 694;
    btnMenu.pos.y = 273;
  } else if (gameState == WIN_SCREEN) {
    btnPlayagain.pos.x = 314;
    btnPlayagain.pos.y = 274;
    btnMenu.pos.x = 568;
    btnMenu.pos.y = 274;
  }

  if (gameState == LVL_1 || gameState == LVL_2 || gameState == LVL_3) {
    headsUpDisplay.render();
  }
}

void controlGameState() {
  switch(gameState) {

  case INTRO: // gameState = 0;
    background(bgStart);
    if (gameState == INTRO) {
      if (keyPressed && key == ' ') {
        gameState = LVL_SELECTOR;
      }
    }
    break;

  case RULES: // gameState = 1;
    background(bgRules);
    btnBack.update();
    btnBack.action(LVL_SELECTOR);
    break;

  case LVL_SELECTOR: // gameState = 2;
    background(bgLevel);
    btnLevelOne.update();
    btnLevelTwo.update();
    btnLevelThree.update();
    btnRules.update();

    btnLevelOne.action(LVL_1);
    btnLevelTwo.action(LVL_1);
    btnLevelThree.action(LVL_1);
    btnRules.action(RULES);
    break;


    // render level selector screen

  case LVL_1: // gameState = 3;
    background(#8c6f43);
    // Camera Position //
    cameraX = -ant.pos.x + width / 2;
    cameraY = (-ant.pos.y - 150) + width / 2;
    pushMatrix();
    translate(0, cameraY);
    ant.update();


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
        b.render();
        b.acquire(barrier);
    }

    // for (int i = 0; i < antlion.size(); i++) {
    //   antlion.get(i).update();
    // }
    antlion.update();
    popMatrix();
    break;

  case LVL_2: // gameState = 4;
    background(255);
    // background(bgLevelTwo);
    // render level 2 screen
    break;
  case LVL_3: // gameState = 5;
    background(255, 0, 0);
    // background(bgLevelThree);
    // render level 3 screen
    break;
  case GAME_OVER: // gameState = 6;
    image(bgLose, 0, 0);


    btnPlayagain.update();
    btnMenu.update();
    btnPlayagain.action(LVL_1);
    btnMenu.action(LVL_SELECTOR);
    // render game over screen
    break;
  case WIN_SCREEN: // gameState = 7;
  image(bgWin, 0, 0);
    btnPlayagain.update();
    btnMenu.update();
    btnPlayagain.action(LVL_1);
    btnMenu.action(LVL_SELECTOR);
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