//draws all the edges of the network in animation 
void drawNetwork(ArrayList<Edge> lines){
   for(int i = 0; i<lines.size(); i++){
           fill(lines.get(i).language, 150);
           lines.get(i).drawEdge();
      }
}

//draws the stagnant lines 
void drawPaused(ArrayList<Edge>lines){
   for(int i = 0; i<lines.size(); i++){
       lines.get(i).pauseEdge();
   }
}

//draws the POIs; all of them and the active ones
void drawPOIs(){
     for(int i = 0; i<POIs.size(); i++){
        POIs.get(i).drawPOIs();
   }
   for(int i = 0; i<Network.size(); i++){
        Network.get(i).drawNetworkPOIs();
   }
}

void analyzer(){
   for(int i = 0; i<POIs.size(); i++){
       POIs.get(i).analyze();
 }
}

void miniNetwork(int id){
  for(int i = 0; i<Network.get(id).edgeout.size(); i++){
      strokeWeight(Network.get(id).edgeout.get(i).amount);
      fill(#00ff00);
      Network.get(id).edgeout.get(i).drawEdge();
    }
  for(int i = 0; i<Network.get(id).edgein.size(); i++){
      strokeWeight(Network.get(id).edgein.get(i).amount);
      fill(#ff0000);
      Network.get(id).edgein.get(i).drawEdge();
    }
}

void drawLegend(){
  fill(255);
  textSize(12);
  text("Framerate: " + str(frameRate),width-200, 50);
  
  fill(colarray[0]);
  text("Spanish", width-200, 70);
  
  fill(colarray[2]);
  text("French", width-200 + textWidth("Spanish") + 10, 70);
  
  fill(colarray[1]);
  text("Other", width-200 + textWidth("Spanish") +20 + textWidth("French") , 70);
  
  fill(#00ff00);
  text("Outgoing", width-200, 90);
  
  fill(#ff0000);
  text("Incoming", width-200 + 10 + textWidth("Outgoing"), 90);
  
  fill(#ffff00);
  text("Brighter POIs have bigger flow", width-200, 120);
  
  fill(255);
  text("Hover POI for info", width-200, 140);
  text("Click POI for mini network", width-200, 160);
  text("Click off canvas to turn off", width-200, 180);
  text("mini network", width-200, 195);
  
  text("Keys:", width-200, 220);
  text("f = toggle French", width-200, 240);
  text("s = toggle Spanish", width-200, 260);
  text("o = toggle other", width-200, 280);
  text("a = toggle edges", width-200, 300);
  text("p = pause/play", width-200, 320);
  text("t = toggle POIs", width-200, 340);
  text("n = new network", width-200, 360);
  
}

void drawInfo(int id){
    fill(255);
    textSize(14);
    text("POI: " +str(Network.get(id).id), 20, height-250);
    text("Location: " +str(Network.get(id).location.x) +" "+ str(Network.get(id).location.y), 150, height-250);
    text("Total: " + str(Network.get(id).total), width-200, height/2);
    text("Total in/out: " + str(Network.get(id).totalin) + " / " + str(Network.get(id).total-Network.get(id).totalin), width-200, height/2+20);

     
    for(int i = 0; i<Network.get(id).edgeout.size(); i++){
       text("Origin for edge " + str(Network.get(id).edgeout.get(i).id) + " of amount " + Network.get(id).edgeout.get(i).amount + 
       " of type " + language[Network.get(id).edgeout.get(i).type], 50, height-230+20*i);
    }
   
    for(int i = 0; i<Network.get(id).edgein.size(); i++){
       text("Destination for edge " + str(Network.get(id).edgein.get(i).id) + " of amount " + Network.get(id).edgein.get(i).amount + 
       " of type " +language[Network.get(id).edgein.get(i).type], width/2, height-230+20*i);
    }
   
}
