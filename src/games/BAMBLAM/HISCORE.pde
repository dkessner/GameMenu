class HISCORE {

  PFont scoreFont;
  char [] characters = {' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
  boolean newScore = false;
  boolean canScroll = true;
  boolean canSwitch = true;
  int rank = 11;
  int charIndex = 0;
  int stringIndex = 0;

  String scorelistFilename = System.getProperty("user.home") + 
      "/VideoGameCabinetData/HighScore_BAMBLAM.txt";

  String [] scoreList = new String[10];


  HISCORE() {
    scoreFont = myGUI.largeFont;
    scoreList = loadStrings(scorelistFilename);
  }




  boolean checkScore(int tempScore) {
    scoreList = loadStrings(scorelistFilename);
    String [] tempStrings = split(scoreList[9], ',');
    int intScore = Integer.parseInt(tempStrings[1]);
    if (tempScore > intScore) {
      return true;
    } else {
      return false;
    }
  }



  void findRank(int tempScore) {
    for (int i = 0; i < 10; i++) {
      String [] tempStrings = split(scoreList[i], ',');
      int intScore = Integer.parseInt(tempStrings[1]);
      if (tempScore > intScore) {
        rank = i;
        break;
      }
    }
  }

  void shiftScores(int tempRank) {
    for (int i = 9; i > tempRank; i--) {
      scoreList[i] = scoreList[i-1];
    }
    if (tempRank < 10) {
      scoreList[tempRank] = "          ,"+score;
    }
  }

  void updateScores() {
    char [] charScore = scoreList[rank].toCharArray();
    charScore[stringIndex] = characters[charIndex]; 
    scoreList[rank] = String.valueOf(charScore);
  }

  void drawScores() {
    textFont(scoreFont, xF*3);
    fill(200);
    rect(width/2-xF*22, yF*20+yF * (3*rank), xF * 15, yF);
    fill(fontColor);
    for (int i = 0; i < scoreList.length; i++) {
      textAlign(LEFT);
      String [] scoreLine = split(scoreList[i], ',');
      text(scoreLine[0], width/2-xF*22, yF*20+yF * (3*i));
      text(scoreLine[1], width/2+xF*15, yF*20 + yF * (3*i));
    }
    textFont(scoreFont, xF*8);
    textAlign(CENTER);
    fill(125);
    text("NEW HIGH SCORE!", width/2+xF/2, yF * 10-yF/2);
    fill(fontColor);
    text("NEW HIGH SCORE!", width/2, yF * 10);
    textFont(scoreFont, xF*3);
    text("CHANGE NAME WITH JOYSTICK AND HIT ENTER WHEN DONE", width/2, height-5*yF);
  }

  void topFive() {
    textFont(scoreFont, xF*2);
    fill(fontColor);
    for (int i = 0; i < 5; i++) {
      textAlign(LEFT);
      String [] scoreLine = split(scoreList[i], ',');
      text(scoreLine[0], width/2-xF*12, height/2 + 16*yF+(35*i));
      text(scoreLine[1], width/2+xF*10, height/2 + + 16*yF+(35*i));
    }
    textFont(scoreFont, xF*3);
    textAlign(CENTER);
    fill(125);
    text("TOP FIVE", width/2+xF/4, height/2+13*yF-yF/4);
    fill(fontColor);
    text("TOP FIVE", width/2, height/2+13*yF);
  }

  void writeScores() {
    saveStrings(scorelistFilename, scoreList);
    newScore = false;
    rank = 11;
    charIndex = 0;
    stringIndex = 0;
  }

  void keyPressedHISCORE() {
    if (newScore) {
      if (keyCode == DOWN) {
        if (canScroll) {
          canScroll = false;
          if (charIndex == characters.length-1) {
            charIndex = 0;
          } else {
            charIndex ++;
          }
        }
      } else if (keyCode == UP) {
        if (canScroll) {
          canScroll = false;
          if (charIndex == 0) {
            charIndex = characters.length-1;
          } else {
            charIndex --;
          }
        }
      } else if (keyCode == RIGHT) {
        //println("stringIndex " + stringIndex);
        //println(scoreList[rank]);
        if (canSwitch) {
          canSwitch = false;
          if (stringIndex == 9) {
            stringIndex = 0;
          } else {
            stringIndex ++;
          }
        }
      } else if (keyCode == LEFT) {
        if (canSwitch) {
          canSwitch = false;
          if (stringIndex == 0) {
            stringIndex = 9;
          } else {
            stringIndex --;
          }
        }
      } else if (key == ' ') {
        if (canSwitch) {
          canSwitch = false;
          if (stringIndex < 10) {
            stringIndex++;
          }
        }
      } else if (keyCode == ENTER || keyCode == RETURN) {
        writeScores();
      }
    }
  }

  void keyReleasedHISCORE() {
    if (newScore) {
      if (keyCode == DOWN || keyCode == UP) {
        canScroll = true;
      } else if (key == ' ' || keyCode == RIGHT || keyCode == LEFT) {
        canSwitch = true;
      }
    }
  }
}
