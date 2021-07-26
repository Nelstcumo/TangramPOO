class Triangulo extends Pieza{

  Triangulo(){}
  
  @Override
  void plasmar(){
    beginShape();
    vertex(0,0);
    vertex(tamano*2,0);
    vertex(tamano,tamano);
    endShape();
  }

}
