void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      player1Yspeed = 0;
    } else if (keyCode == DOWN) {
      player1Yspeed = 0;
    }
  }
  if (key == 'w') {
    player2Yspeed = 0;
  }
  if (key == 's') {
    player2Yspeed = 0;
  }
  
  if (key == ' ') {
    restatGame();
    gameOver = false;
    
  }
}

void keyPressed() {
  if (keyCode == UP) {
    player1Yspeed = -10;
  } else if (keyCode == DOWN) {
    player1Yspeed = 10;
  }
  if (key == 'w') {
    player2Yspeed = -10;
  }
  if (key == 's') {
    player2Yspeed = 10;
  }
}
