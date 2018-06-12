/////////////////////////////////////////////////////////////////////////////////////////////////////////////
// fluidInfluence();
//
public void fluidInfluence( Fluid2D fluid2d ) {
  if (mouseButton == LEFT ) {
     setDens(fluid2d, mouseX, mouseY, 5, 5, 2, 2, 2);
  }

  if (mouseButton == RIGHT ) {
    float vel_fac = 0.13f;
    setVel(fluid2d, mouseX, mouseY, 2, 2, (mouseX - pmouseX)*vel_fac, (mouseY - pmouseY)*vel_fac);
  }
}    


/////////////////////////////////////////////////////////////////////////////////////////////////////////////
// setDens();
//
void setDens(Fluid2D fluid2d, int x, int y, int sizex, int sizey, float r, float g, float b) {
  for (int y1 = 0; y1 < sizey; y1++) {
    for (int x1 = 0; x1 < sizex; x1++) {
      int xpos = (int)(x/(float)cell_size) + x1 - sizex/2;
      int ypos = (int)(y/(float)cell_size) + y1 - sizey/2;
      fluid2d.addDensity(0, xpos, ypos, r);
      fluid2d.addDensity(1, xpos, ypos, g);
      fluid2d.addDensity(2, xpos, ypos, b);
    }
  }
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////
// setVel();
//
void setVel(Fluid2D fluid2d, int x, int y, int sizex, int sizey, float velx, float vely) {
  for (int y1 = 0; y1 < sizey; y1++) {
    for (int x1 = 0; x1 < sizex; x1++) {
      int xpos = (int)((x/(float)cell_size)) + x1 - sizex/2;
      int ypos = (int)((y/(float)cell_size)) + y1 - sizey/2;
      fluid2d.addVelocity(xpos, ypos, velx, vely);
    }
  }
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////
// addObject();
//
public void addObject(Fluid2D fluid2d, int posx, int posy, int sizex, int sizey, int mode) {
  int offset = 0;
  int xlow = posx;
  int xhig = posx + sizex;
  int ylow = posy;
  int yhig = posy + sizey;

  for (int x = xlow-offset ; x < xhig+offset ; x++) {
    for (int y = ylow-offset ; y < yhig+offset ; y++) {
      if ( x < 0 || x >= fluid2d.getSizeXTotal() || y < 0 || y >= fluid2d.getSizeYTotal() )
        continue;
      if ( mode == 0) fluid2d.addObject(x, y); 
      if ( mode == 1) fluid2d.removeObject(x, y); 
    }
  }
}

