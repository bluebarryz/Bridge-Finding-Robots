class Robot {
  
  PImage robot = loadImage("Robot.png");
  IntList turningPoints = new IntList();
  int farthestTurningPoint;
  int currentTurningPointIndex = 0;
  int currentTurningPoint;
  int robotYValue;
  int markerYValue;
  int distanceYValue;
  int distanceTravelled = 0;
  int finalDistanceTravelled;
  PImage marker = loadImage("Marker.png");
  PImage specialMarker = loadImage("SpecialMarker.png");
  PFont markerFont;
  PFont distanceFont;
  
  
  int stepSize;
  int startingPos;
  int position;
  int previousPosition;
  int walkingSpeed;
  String algorithm;
  
  Robot(int stepSize,int startingPos, int speed, String algorithm) { 
    this.stepSize = stepSize;
    this.startingPos = startingPos;
    this.position = startingPos;
    this.previousPosition = position;
    this.walkingSpeed = speed;
    this.algorithm = algorithm;
  }
  
  void drawRobot() {   
    image(robot,(position-77.5)/pixelScaleFactor,robotYValue);    
  }
  
  void drawMarker(String type) {
    markerFont = createFont("Cambria",10);
    textFont(markerFont);
    fill(0);

    if (type.equals("regular")) {
      if (position!=midBridgePosition) {
        image(marker,(position-20)/pixelScaleFactor,markerYValue);
        text(position,(position-10)/pixelScaleFactor,markerYValue+23); 
      }
      else {
        image(specialMarker,position-20,markerYValue);
      }

    }
    else if (type.equals("special")) {
      image(specialMarker,(startingPos-20)/pixelScaleFactor,markerYValue);
      text(position,(startingPos-10)/pixelScaleFactor,markerYValue+23); 
    } 
  }
  
  void printWalkingSpeedRatio(int r1Speed) {
      PFont f = createFont("Calibri",10);
      textFont(f);
      fill(255);
      text("Top robot speed: " + r1Speed,10,380);
      text("Bottom robot speed: " + walkingSpeed,10,400);
      text("Bottom/Top = " + walkingSpeed/float(r1Speed),10,420);
  }
  
  void printDistanceTravelled() {
    distanceFont = createFont("Cambria",24);
    textFont(distanceFont);
    fill(255);
    text("Distance travelled: " + distanceTravelled,width-300,distanceYValue);   
  }
  
  void computeTurningPoints() {    
    if (algorithm.equals("DA")) {
      doublingAlgo();  
      fillDASpecificFields();
    }
    else {
      constantGrowthAlgo();
      fillCGSpecificFields();
    }
    
    finalDistanceTravelled -= (midBridgePosition-turningPoints.get(turningPoints.size()-1));  // subtracts the difference between the final turning point and the final destination (midBridgePosition) from the final total for distance travelled. 
    turningPoints.set(turningPoints.size()-1,midBridgePosition); // sets the final turning point as the midpoint of the bridge, where the robot stops
    farthestTurningPoint = turningPoints.get(turningPoints.size()-2); 
    getPixelScaling();
  }   
  
  void fillDASpecificFields(){ // coordinate fields for DA robot
    robotYValue = 40;
    markerYValue = robotYValue + 180;  
    distanceYValue = 50;  
  }
  
  void fillCGSpecificFields(){ // coordinate fields for CG robot
    robotYValue = height-220;
    markerYValue = robotYValue - 40;
    distanceYValue = height-60; 
  }
    
  void doublingAlgo() {
    int moveSize = stepSize;
    finalDistanceTravelled += moveSize;
    int turningPoint = position+moveSize;
    turningPoints.append(turningPoint);
    
    while (turningPoint > bridgePosition ) {
      moveSize *= -2;
      finalDistanceTravelled += abs(moveSize);
      turningPoint += moveSize;
      turningPoints.append(turningPoint);
    }
  }
    
  void constantGrowthAlgo() {
    int absMoveSize = 0;
    int sign = -1;
    int turningPoint = position;
    
    while (turningPoint > bridgePosition) {
      absMoveSize += stepSize;
      finalDistanceTravelled+=absMoveSize;
      sign *= -1;
      turningPoint += sign*absMoveSize;
      turningPoints.append(turningPoint);
    }
  }
  
  void getPixelScaling() {
    if (farthestTurningPoint>1045) {
      
      float ratio = farthestTurningPoint/1045.0;
      if (ratio>pixelScaleFactor)
        pixelScaleFactor = ratio;
      }
  }
  
  void checkIfArrivedAtTurningPoint() {
      if (walkingSpeed > 0) { // moving east
        if ( position >= currentTurningPoint ) {   
          updateTurningPoint();
          if ( position > currentTurningPoint ) { //to prevent the robot from going past the upcoming turning point
            preventOvershoot();
          }
        }
      }
      else { // moving west
        if (currentTurningPointIndex < turningPoints.size()-1) {
          if ( position <= currentTurningPoint) {
            updateTurningPoint();
            if ( position < currentTurningPoint ) { //to prevent the robot from going past the upcoming turning point
              preventOvershoot();
            } 
          }
        }  
        
        else if  (currentTurningPointIndex == turningPoints.size()-1){   // robot is headed towards final turning point (the final destination)      
          if (position<=midBridgePosition) {
            if (position==midBridgePosition+walkingSpeed)
              updateTurningPoint(); // if the next position goes past the final turning point (at midBridgePosition), we update the turningPoint index so that it exceeds the size of the turningPoints arrayList, which stops draw() from drawing the robot             
            else 
               preventOvershoot();              
          }        
        }      
      }   
  }
  
  void syncArrivals(int r1Dist, int r1Speed) {
    walkingSpeed *= 1.1*finalDistanceTravelled/r1Dist * (r1Speed/walkingSpeed);  
  }
  
  void preventOvershoot() { //to prevent the robot from going past the upcoming turning point
    int adjustment = position - currentTurningPoint;
    //overshootDistance += adjustment;
    position -= adjustment;  
  }
  
  void updateTurningPoint() { // updates the index of the turningPoints arrayList once the robot has reached the current turning point.
    currentTurningPointIndex ++;
    walkingSpeed *= -1; 
  }
  
}
