// a simple sphere

// globals
color bgColor = color(0);
color spColor = color(255);
Sphere mySphere;
Quaternion camEye, camCent, camUp, rQuat, camEyeO;

// initialize
void setup(){
  size(600, 600, P3D);
  background(bgColor);
  camEye = new Quaternion(1.2, width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0));
  camEyeO = new Quaternion(1.2, width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0));
  camCent = new Quaternion(1.0, width/2.0, height/2.0, 0);
  camUp = new Quaternion(1.0, 0.0, 1.0, 0.0);
  rQuat = new Quaternion(0.0, 0.0, 0.0, 0.0);
  lights();
  mySphere = new Sphere(width/4, spColor);
  mySphere.draw();
}

void draw(){
  noStroke();
  rectMode(CORNER);
  fill(bgColor);
  rect(0, 0, width, height);
  constrain(mouseX, 0, width);
  constrain(mouseY, 0, height);
  lights();
  //pointLight(50, 140, 200, width/4, height, width/2);
  // put quaternion and rotation function call here
  // once i figure out how they really work...
  camEye.Z = (mouseY*2) / tan(PI*30.0 / 180.0);
  camera(camEye.X, camEye.Y, camEye.Z, camCent.X, camCent.Y, camCent.Z, camUp.X, camUp.Y, camUp.Z);  
  if (mousePressed == true){
    mySphere.update(mouseX, mouseY);
  }
  else{
    mySphere.update(width/2, height/2);
  }  
}

void keyPressed(){
  // turn camEye into its reciprical vector
  if (key == 'r'){
    camEye = camEye.reciprical();
  }
  // mulitply camEye by a rotational vector 
  if (key == 'm'){
    camEye = camEye.mult(rQuat);
  }
  // return camEye to original position
  if (key == 'o'){
    camEye = camEyeO;
  }
  println("camEye.W: " + camEye.W + " camEye.X: " + camEye.X + " camEye.Y: " + camEye.Y + " camEye.Z: " + camEye.Z);    
}
