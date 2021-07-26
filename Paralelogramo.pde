class Paralelogramo extends Pieza{

  Paralelogramo(){}
  
  @Override
  void plasmar(){
    beginShape();
    vertex(sqrt(2*pow(tamano,2))/2,0);
    vertex(0,sqrt(2*pow(tamano,2))/2);
    vertex(sqrt(2*pow(tamano,2)),sqrt(2*pow(tamano,2))/2);
    vertex(3*(sqrt(2*pow(tamano,2))/2),0);
    
    endShape();
  }

}
