import g4p_controls.*;
Robot[] robots = new Robot[2];

float pixelScaleFactor = 1;
boolean paused = false;
int bridgePosition = int(120/pixelScaleFactor);
int midBridgePosition = bridgePosition/2; 

// Top robot fields
int stepSize1 = 75;
int startingDist1 = 400;
int walkingSpeed1 = 20;
String algo1 = "DA";

// Bottom robot fields
int stepSize2 = 75;
int startingDist2 = 400;
int walkingSpeed2 = 20;
String algo2 = "CG";
Boolean syncRobotArrivals=false;

void setup() {
  createGUI();
  frameRate(10);
  size(1200,800);
  resetRobots();
}

void resetRobots() {
  Robot r1 = new Robot(stepSize1,startingDist1,walkingSpeed1,algo1);
  Robot r2 = new Robot(stepSize2,startingDist2,walkingSpeed2,algo2);

  r1.computeTurningPoints();
  r2.computeTurningPoints();
  if (syncRobotArrivals==true) {
    r2.syncArrivals(r1.finalDistanceTravelled,r1.walkingSpeed); 
  }
  
  robots[0] = r1;
  robots[1] = r2;
}

void draw() {
    if (robots[0].position == startingDist1) {
      background(255);
      drawScene();
      robots[1].printWalkingSpeedRatio(robots[0].walkingSpeed);
      robots[0].drawMarker("special");
      robots[1].drawMarker("special");  

    }
    
    for (int i=0; i<2;i++) {      
      if (robots[i].currentTurningPointIndex < robots[i].turningPoints.size()) {
        drawGrass(i);
        robots[i].drawRobot();
        if (robots[i].position == robots[i].currentTurningPoint)  //draws a marker at the turning point
          robots[i].drawMarker("regular");
        robots[i].distanceTravelled += abs( robots[i].position - robots[i].previousPosition ); 
        robots[i].printDistanceTravelled();
        
        // update values
        robots[i].currentTurningPoint = robots[i].turningPoints.get(robots[i].currentTurningPointIndex); 
        robots[i].previousPosition = robots[i].position;
        robots[i].position += robots[i].walkingSpeed;  
        
        // check if the robot's next position lands at (or beyond) the upcoming turning point
        robots[i].checkIfArrivedAtTurningPoint();
      } 
    }

}

void drawScene(){ 
  PImage scene = loadImage("Scene.png");
  image(scene,0,220);
}

void drawGrass(int i) {
  
  if (i==0) {
    PImage grass = loadImage("topGrass.png");
    image(grass,0,0);
  }
  else {
    PImage grass = loadImage("bottomGrass.png");
    image(grass,0,height-220);
  }
}

void pauseResumeProcedure() {
  if(paused) {
    pause.setText("Resume");
    noLoop();
  }   
  else {
    pause.setText("Pause");
    loop();
  }
}
