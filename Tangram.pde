Pieza piezas[];
PImage prueba, nivel_1, nivel_2, nivel_3, nivel_4, modo_libre;
color c, back;
float px,py;
boolean juego, victoria;

void setup(){
  size(1200,700);
  inicializar();
}

void draw(){
  image(prueba,0,0);
  if (juego == true){
    for (Pieza pieza : piezas){
      pieza.pintar();
      pieza.actualizar();
    }
  victoria();
  } else if (victoria == false && juego == false) {
    image(nivel_1, 250, 300 ,200 , 116);
    image(nivel_2, 500, 300 ,200 , 116);
    image(nivel_3, 750, 300 ,200 , 116);
    image(nivel_4, 350, 475 ,200 , 116);
    image(modo_libre, 600, 475 ,200 , 116);
  } else if(victoria == true && juego == false){
     prueba = loadImage("ganaste.gif");
  }
}

void victoria(){
  loadPixels();
  int neg = 0;  
  for (int i = 0; i < pixels.length; i++){
    if (pixels[i] == c){
      neg += 1;
    }
  }
  if (neg == 0){
    juego = false;  
    victoria = true;
  }
}

void keyPressed(){
  for (Pieza pieza : piezas){
    if ((key == 'R' || key == 'r') && pieza.contains() == true){
      pieza.angulo += PI/8;  
    } else if ((key == 'Q' || key == 'q') && pieza.contains() == true){
      pieza.angulo -= PI/8;  
    } else if ((key == 'E' || key == 'e') && pieza.contains() == true){
      pieza.escala *= -1;  
    }
  }
  if(key == 's' || key == 'S'){
    for (Pieza pieza : piezas){
      pieza.tono = color(0);
    }
    save("nivel_4.jpg");
  }
  switch(key){
    case '1':
      prueba = loadImage("nivel_1.jpg");
      juego = true;
      break;
    case '2':
      prueba = loadImage("nivel_2.jpg");
      juego = true;
      break;
    case '3':
      prueba = loadImage("nivel_3.jpg");
      juego = true;
      break;
    case '4':
      prueba = loadImage("nivel_4.jpg");
      juego = true;
      break;
    case '5':
      prueba = loadImage("fondo.jpg");
      juego = true;
      break;
    case '6':
      prueba =loadImage("principal.jpg");
      inicializar();
  }   
}

void mouseDragged(){
  for (Pieza pieza : piezas){
    if (pieza.contains() == true){
      pieza.posicion.set(mouseX-pieza.dx,mouseY-pieza.dy);
      px = (mouseX-pieza.dx)-((mouseX-pieza.dx)%10);
      py = (mouseY-pieza.dy)-((mouseY-pieza.dy)%10);
    }
  }
}

void mouseReleased(){
  for (Pieza pieza : piezas){
    if (pieza.contains() == true){
      pieza.posicion.set(px,py);
    }
  }
}

void inicializar(){
  piezas = new Pieza[7];
  piezas[0] = new Cuadrado();
  piezas[1] = new Triangulo();
  piezas[2] = new Triangulo();
  piezas[3] = new Triangulo(); 
  piezas[4] = new Triangulo();
  piezas[5] = new Triangulo();
  piezas[6] = new Paralelogramo();
  piezas[2].tamano = sqrt(2*pow(piezas[2].tamano,2))/2; //100
  piezas[3].tamano = sqrt(2*pow(piezas[3].tamano,2))/2;
  piezas[4].tamano = sqrt(2*pow(piezas[4].tamano,2));   //200
  piezas[5].tamano = sqrt(2*pow(piezas[5].tamano,2));
  prueba = loadImage("principal.jpg"); 
  nivel_1 = loadImage("nivel_1.jpg");
  nivel_2= loadImage("nivel_2.jpg");
  nivel_3 = loadImage("nivel_3.jpg");
  nivel_4 = loadImage("nivel_4.jpg");
  modo_libre = loadImage("fondo.jpg");
  c = color(0);
  back = color(210);
  juego = false;
  victoria = false;
}


  

  
