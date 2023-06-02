/*
  OBS: Pinos do joystic para baixo

  Esquerda  =   Y=0        
  Cima      =   X=4095     
  Direita   =   Y=4095     
  Baixo     =   X=0        


Envia: x ; y
  x > 0 = direita
  y > 0 = cima

*/

#define btnS 4 // botão Start (no joystick) - Quando pressionado = 0V

int x = 15; // Saída analógica (Eixo X) VrX
int y = 2;  // Saída analógica (Eixo Y) VrY

String txt = "";

void setup() {
  Serial.begin(115200);  
  
  pinMode(btnS, INPUT_PULLUP); // Define o botão do joystick

  delay(3000);
}


void loop() {

  // Escreve mensagem que será enviada
  txt = String(analogRead(x)) + ";" + String(analogRead(y));
  
  // Enquanto o botão tiver apertado envia Enter
  if(digitalRead(btnS) == 0)  {
    txt = "Enter";
  } 
  
  // Envia mensagem
  Serial.print(txt+"\n");
  delay(100);  
}


