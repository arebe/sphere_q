class Sphere{
  int r;
  color sColor;
  PShape sphere;
  PImage img = loadImage("biz0812-logo-4.jpg");
  
  Sphere(int inr, color incolor){
    r = inr;
    sColor = incolor;
    sphere = createShape(SPHERE, r);
  }
  
  void draw(){
    fill(sColor);
    sphere(r);
  }
  
  void update(int tx, int ty){
    pushMatrix();
    translate(tx, ty);
    fill(sColor);
    beginShape();
    texture(img);
    sphere(r);
    endShape();
    popMatrix();
  }
  
  // update w/ z param
    void update(int tx, int ty , int tz){
    pushMatrix();
    translate(tx, ty, tz);
    fill(sColor);
    sphere(r);
    popMatrix();
  }
}
