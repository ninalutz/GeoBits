boolean showPaths = false;
boolean showGrid = false;
boolean showSource = true;
boolean showSwarm = true;

// Makes darker colors more visible when projecting
int masterAlpha = 15;
float schemeScaler = 0.5;
int background = 200;
int textColor = 255;
int grayColor = int(abs(background - (255.0/2)*schemeScaler));

// temp variable that holds coordinate location for a point to render
PVector coord;

// temp variable that holds coordinate locations for a line to render
//PVector[] line = new PVector[2];

void drawTableCanvas(PGraphics p) {
  
  //Updates Pedestrian Data to Display
  if (showSwarm) {
    if(flowmode){
    swarmHorde.update();
    if(surge){
      swarmHorde2.update();
        for(int i = 0; i <  SurgeSwarms.size(); i++){
       SurgeSwarms.get(i).update();
        }
  
    }
    }
    if(popmode){
      Peds.update();
      Buses.update();
      Bikes.update();
      Cars.update();
    }
    if(safemode){
      Geo.update();
      Risk.update();
      Safe.update();
    }
  }

  // holds time from last frame
  time_0 = millis();
  
  // Begin Draw Functions
  p.beginDraw();
  
      // Instead of solid background draws a translucent overlay every frame.
      // Provides the effect of giving animated elements "tails"
      p.noStroke();
      p.fill(background, 120);
      p.rect(0,0,p.width,p.height);
      
      
      // Draws pathfinding nodes onto Canvas
      if (showGrid) {
        p.image(pFinderGrid, 0, 0);
      }
      
      // Draws shortest paths for OD nodes
      if (showPaths) {
        p.image(pFinderPaths, 0, 0);
      }
      
      // Show Markers for Sources and Sinks of Angents
      if (showSource) {
        p.image(sources_Viz, 0, 0);
      }
      if(showEdges){
         p.image(edges_Viz, 0, 0);
      }
    
      // Renders Pedestrian 'dots' and corresponding obstacles and heatmaps
      if (showSwarm) {
          if(flowmode){
          swarmHorde.display(p);
          if(surge){
            swarmHorde2.display(p);
              for(int i = 0; i <  SurgeSwarms.size(); i++){
       SurgeSwarms.get(i).display(p);
      
  }
  
          }
          }
          if(popmode){
            if(showPed){
            Peds.display(p);
            }
            if(showBikes){
            Bikes.display(p);
            }
            if(showBus){
            Buses.display(p);
            }
            if(showCars){
            Cars.display(p);
            }
          }
          if(safemode){
            Geo.display(p);
            Risk.display(p);
            Safe.display(p);
          }
      }

  p.endDraw();
}

void setScheme() {
  // Adjusts Colors and Transparency 
  masterAlpha = 25;
  schemeScaler = 0.4;
  grayColor = int(abs(background - (255.0/2)*schemeScaler));
}

// Reinitialize any PGraphics that use masterAlpha and schemaScaler
void refreshGraphicScheme(PGraphics p) {
  pFinderGrid_Viz(p);
}

void adjustAlpha(int a) {
   masterAlpha += a;
      if (a > 0) {
     schemeScaler += 0.05;
   } else {
     schemeScaler -= 0.05;
   }
   
   if (masterAlpha < 0) {
     masterAlpha = 0;
   }
   if (masterAlpha > 255) {
     masterAlpha = 255;
   }
   if (schemeScaler < 0) {
     schemeScaler = 0;
   }
   if (schemeScaler > 1) {
     schemeScaler = 1;
   }
}
