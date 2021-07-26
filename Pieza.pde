abstract class Pieza{
  
  PVector posicion;
  float angulo; 
  float tamano;
  float escala;
  color tono;
  float dx, dy;
  
  Pieza(){
    posicion = new PVector(100,(width/10)*random(5));
    angulo = 0;
    escala = 1;
    tamano = 141.4213562;
    tono = color(0,random(255),random(255));
  }
  
  
  void pintar(){
    push();
    fill(tono);    
    translate(posicion.x, posicion.y);    
    rotate(angulo); 
    scale(escala,1);
    noStroke();
    plasmar();
    contains();
    pop();
  } 

  void actualizar(){   
    dx = mouseX - posicion.x;
    dy = mouseY - posicion.y;
  }
  
  boolean contains(){
    int pos = (width * mouseY) - (width-mouseX);
    loadPixels();
    if (pos > width && pixels[pos] == tono){
      return true;
    }
    else{
      return false;
    }
  }
    
  abstract void plasmar();

  void setPosicion(PVector _posicion){
    posicion = _posicion;
  }
  
  void setAngulo(float _angulo){
    angulo = _angulo;
  }
  
  void setTamano(float _tamano){
    tamano = _tamano;
  } 
  
  void setColor(color _tono){
    tono = _tono;
  }

}
