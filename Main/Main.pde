/**
 * IAT 312 Antlion Game
 * @author Keegan George
 * @version 1.0 (2019-10-04)
 */

// IMPORT LIBRARIES //
import controlP5.*;

// GAME STATES //
int gameState;
final int INTRO = 0;
final int INSTRUCTIONS = 1;
final int LVL_SELECTOR = 2;
final int LVL_1 = 3;
final int LVL_2 = 4;
final int LVL_3 = 5;
final int GAME_OVER = 6;
final int WIN_SCREEN = 7;

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
Antlion antlion;

// GLOBAL BOOLEANS //
boolean keyLeft, keyRight, keyUp, keyDown;

// GLOBAL ARRAYLISTS //
ArrayList <PowerUps> goodFruit = new ArrayList();
ArrayList <PowerDepletion> badFruit = new ArrayList();
ArrayList <Barrier> barrier = new ArrayList();
float numFruits = 5;
float numBarrier = 5;

// GLOBAL COLORS //

// AUDIO //

// GUI //
ControlP5 cp5;


/**
 * Setup method
 *
 */
void setup() {
  size(1280, 720);
  frameRate(60);
  smooth();
  surface.setTitle("Antlion Game");
  gameState = 3; // temporarily init state to adjust where to start
  initObjects();
}

/**
 * Method consolidatign the initialization of objects
 *
 */
void initObjects() {
  headsUpDisplay = new Hud();

  for (int i = 0; i < numFruits; i++) {
    goodFruit.add(new PowerUps(new PVector(random(width), random(height))));
  }

  for (int i = 0; i < numFruits; i++) {
    badFruit.add(new PowerDepletion(new PVector(random(width), random(height))));
  }

  for (int i = 0; i < numBarrier; i++) {
    barrier.add(new Barrier(new PVector(random(width), random(height)), new PVector(random(200, 300), 50)));
  }

  ant = new Ant(new PVector(height, width / 2), new PVector (74, 128));
  antlion = new Antlion(new PVector(random(width), random(height)), new PVector(400, 349));

}

/**
 * Draw method
 *
 */
void draw() {
  background(255);
  surface.setTitle("Antlion Game" + "   | FPS: " + (int) frameRate);
  cameraX = -ant.pos.x + width / 2;
  cameraY = (-ant.pos.y - 12) + width / 2;
  pushMatrix();
  translate(cameraX, cameraY);
  ant.update();
  controlGameState();
  antlion.update();
  popMatrix();

  headsUpDisplay.render();
}

void controlGameState() {
  switch(gameState) {
  case INTRO: // gameState = 0;
    // render intro stuff
    break;
  case INSTRUCTIONS: // gameState = 1;
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
      b.render();
      b.acquire(barrier);
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
