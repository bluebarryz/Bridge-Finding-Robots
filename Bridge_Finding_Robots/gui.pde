/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw6(PApplet appc, GWinData data) { //_CODE_:window3:307061:
  appc.background(230);
} //_CODE_:window3:307061:

public void pauseClicked(GButton source, GEvent event) { //_CODE_:pause:334884:
  paused =!paused;
  pauseResumeProcedure();

  } //_CODE_:pause:334884:

public void startingDistSlider1Changed(GCustomSlider source, GEvent event) { //_CODE_:startingDistSlider1:538796:
  startingDist1 = startingDistSlider1.getValueI();
  paused = true;
  pauseResumeProcedure();
} //_CODE_:startingDistSlider1:538796:

public void startingDistSlider2Changed(GSlider source, GEvent event) { //_CODE_:startingDistSlider2:955164:
  startingDist2 = startingDistSlider2.getValueI();
  paused = true;
  pauseResumeProcedure();
} //_CODE_:startingDistSlider2:955164:

public void resetClicked(GButton source, GEvent event) { //_CODE_:reset:613574:
  pixelScaleFactor = 1;
  paused = false;
  pauseResumeProcedure();
  resetRobots();


} //_CODE_:reset:613574:

public void walkingSpeedSlider1Changed(GSlider source, GEvent event) { //_CODE_:walkingSpeedSlider1:932851:
  walkingSpeed1 = walkingSpeedSlider1.getValueI();
  paused = true;
  pauseResumeProcedure();
} //_CODE_:walkingSpeedSlider1:932851:

public void walkingSpeedSlider2Changed(GSlider source, GEvent event) { //_CODE_:walkingSpeedSlider2:392695:
  walkingSpeed2 = walkingSpeedSlider2.getValueI();
  paused = true;
  pauseResumeProcedure();
} //_CODE_:walkingSpeedSlider2:392695:

public void stepSizeSlider1Changed(GSlider source, GEvent event) { //_CODE_:stepSizeSlider1:701122:
  stepSize1 = stepSizeSlider1.getValueI();
  paused = true;
  pauseResumeProcedure();
} //_CODE_:stepSizeSlider1:701122:

public void stepSizeSlider2Changed(GSlider source, GEvent event) { //_CODE_:stepSizeSlider2:385036:
  stepSize2 = stepSizeSlider2.getValueI();
  paused = true;
  pauseResumeProcedure();
} //_CODE_:stepSizeSlider2:385036:

public void syncArrivalsClicked(GButton source, GEvent event) { //_CODE_:syncArrivals:929872:
  paused = true;
  pauseResumeProcedure();
  syncRobotArrivals = !syncRobotArrivals;
  if(syncRobotArrivals)
    syncArrivals.setText("Un-sync");    
  else
    syncArrivals.setText("Sync");
  
} //_CODE_:syncArrivals:929872:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window3 = GWindow.getWindow(this, "Window title", 0, 0, 500, 300, JAVA2D);
  window3.noLoop();
  window3.setActionOnClose(G4P.KEEP_OPEN);
  window3.addDrawHandler(this, "win_draw6");
  pause = new GButton(window3, 13, 13, 80, 30);
  pause.setText("Pause");
  pause.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  pause.addEventHandler(this, "pauseClicked");
  startingDistanceLabel = new GLabel(window3, 111, 8, 204, 20);
  startingDistanceLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  startingDistanceLabel.setText("Starting distance for top robot");
  startingDistanceLabel.setOpaque(false);
  startingDistSlider1 = new GCustomSlider(window3, 120, 27, 200, 40, "blue18px");
  startingDistSlider1.setShowValue(true);
  startingDistSlider1.setShowLimits(true);
  startingDistSlider1.setLimits(400, 300, 1000);
  startingDistSlider1.setNumberFormat(G4P.INTEGER, 0);
  startingDistSlider1.setOpaque(false);
  startingDistSlider1.addEventHandler(this, "startingDistSlider1Changed");
  label1 = new GLabel(window3, 114, 74, 221, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Starting distance for bottom robot");
  label1.setOpaque(false);
  startingDistSlider2 = new GSlider(window3, 121, 95, 200, 40, 10.0);
  startingDistSlider2.setShowValue(true);
  startingDistSlider2.setShowLimits(true);
  startingDistSlider2.setLimits(400, 300, 1000);
  startingDistSlider2.setNumberFormat(G4P.INTEGER, 0);
  startingDistSlider2.setOpaque(false);
  startingDistSlider2.addEventHandler(this, "startingDistSlider2Changed");
  reset = new GButton(window3, 11, 60, 80, 30);
  reset.setText("Reset");
  reset.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  reset.addEventHandler(this, "resetClicked");
  label3 = new GLabel(window3, 4, 140, 212, 26);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Walking speed for top robot");
  label3.setOpaque(false);
  walkingSpeedSlider1 = new GSlider(window3, 17, 165, 200, 40, 10.0);
  walkingSpeedSlider1.setShowValue(true);
  walkingSpeedSlider1.setShowLimits(true);
  walkingSpeedSlider1.setLimits(20.0, 10.0, 100.0);
  walkingSpeedSlider1.setNumberFormat(G4P.CYAN_SCHEME, 2);
  walkingSpeedSlider1.setOpaque(false);
  walkingSpeedSlider1.addEventHandler(this, "walkingSpeedSlider1Changed");
  label4 = new GLabel(window3, 16, 213, 200, 27);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Walking speed for bottom robot");
  label4.setOpaque(false);
  walkingSpeedSlider2 = new GSlider(window3, 14, 244, 200, 40, 10.0);
  walkingSpeedSlider2.setShowValue(true);
  walkingSpeedSlider2.setShowLimits(true);
  walkingSpeedSlider2.setLimits(20, 10, 100);
  walkingSpeedSlider2.setNumberFormat(G4P.INTEGER, 0);
  walkingSpeedSlider2.setOpaque(false);
  walkingSpeedSlider2.addEventHandler(this, "walkingSpeedSlider2Changed");
  label5 = new GLabel(window3, 249, 144, 200, 19);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("Step size of top robot");
  label5.setOpaque(false);
  stepSizeSlider1 = new GSlider(window3, 246, 165, 200, 40, 10.0);
  stepSizeSlider1.setShowValue(true);
  stepSizeSlider1.setShowLimits(true);
  stepSizeSlider1.setLimits(75, 50, 150);
  stepSizeSlider1.setNumberFormat(G4P.INTEGER, 0);
  stepSizeSlider1.setOpaque(false);
  stepSizeSlider1.addEventHandler(this, "stepSizeSlider1Changed");
  label6 = new GLabel(window3, 251, 220, 194, 20);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("Step size of bottom robot");
  label6.setOpaque(false);
  stepSizeSlider2 = new GSlider(window3, 248, 242, 200, 40, 10.0);
  stepSizeSlider2.setShowValue(true);
  stepSizeSlider2.setShowLimits(true);
  stepSizeSlider2.setLimits(75, 50, 150);
  stepSizeSlider2.setNumberFormat(G4P.INTEGER, 0);
  stepSizeSlider2.setOpaque(false);
  stepSizeSlider2.addEventHandler(this, "stepSizeSlider2Changed");
  syncArrivals = new GButton(window3, 350, 19, 80, 30);
  syncArrivals.setText("Sync Arrivals");
  syncArrivals.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  syncArrivals.addEventHandler(this, "syncArrivalsClicked");
  window3.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window3;
GButton pause; 
GLabel startingDistanceLabel; 
GCustomSlider startingDistSlider1; 
GLabel label1; 
GSlider startingDistSlider2; 
GButton reset; 
GLabel label3; 
GSlider walkingSpeedSlider1; 
GLabel label4; 
GSlider walkingSpeedSlider2; 
GLabel label5; 
GSlider stepSizeSlider1; 
GLabel label6; 
GSlider stepSizeSlider2; 
GButton syncArrivals; 
