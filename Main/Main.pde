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

// GLOBAL BOOLEANS //

// GLOBAL ARRAYLISTS //

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
  initObjects();
}

/**
 * Method consolidatign the initialization of objects
 *
 */
void initObjects() {

}

/**
 * Draw method
 *
 */
void draw() {
  background(0, 255, 0);
  controlGameState();
}

void controlGameState() {
  switch(gameState) {
    case INTRO:
      // render intro stuff
      break;
    case INSTRUCTIONS:
      // render instructions screen
      break;
    case LVL_SELECTOR:
      // render level selector screen
    case LVL_1:
      // render level 1 screen
      break;
    case LVL_2:
      // render level 2 screen
      break;
    case LVL_3:
      // render level 3 screen
      break;
    case GAME_OVER:
      // render game over screen
      break;
    case WIN_SCREEN:
      // render winner screen
      break;
  }

}
