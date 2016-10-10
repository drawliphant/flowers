boolean randBool(){
  return (random(0,1)<.5);
}
float wheel(float color1,float color2){
 
 float colorn=random(-20,20);
 return ((color1+color2+colorn)%100)/2;
}
float[] seed(float[] s){
  s[0]=random(0,100);//pedal hue
  s[1]=random(0,100);//pedal intensity
  s[2]=random(1,50);//
  s[3]=round(random(-.5,4.5));//pedal style
  s[4]=random(0,100);//pollen hue
  s[5]=random(0,100);//pollen intensity 
  s[6]=random(0,50);
  s[7]=random(2,20);
  s[8]=random(2,20);
  s[9]=random(-.1,.1);//angle
  s[10]=round(10/random(1,10));//layers
  return s;
}
int clicks=0;
int[] s=new int[2];
void mousePressed(){
  s[clicks]=round(mouseX/150-.5);
  clicks++;
  if(clicks==2){
   
    for(int i=0;i<5;i++){
      if(i!=s[0]&&i!=s[1]){
        r=seed(r);
        for(int j=0;j<11;j++){
          if(j==0||j==4){
            g[i][j]=wheel(g[s[0]][j],g[s[1]][j]);
          }else if(j==10){
            g[i][j]=round((g[s[0]][j]+g[s[1]][j]+r[j])/3);
          }else{
            g[i][j]=(g[s[0]][j]+g[s[1]][j]+r[j])/3;
          }
        }
        
        
      }
      
      
    }
    clicks=0;
    
  }
}


PShape[] pedals=new PShape[5];


float[] r=new float[11];
float[][] g=new float[5][11];{
  for(int i=0;i<5;i++){
    g[i]=seed(g[i]);
    
    
  }
}
float angle;
PVector point=new PVector(0,0);
PVector point2=new PVector(0,0);
void setup(){
  size(750,400);
  colorMode(HSB,100);
  
  pedals[0]=loadShape("p0.svg");
  pedals[0].disableStyle();
  pedals[1]=loadShape("p1.svg");
  pedals[1].disableStyle();
  pedals[2]=loadShape("p2.svg");
  pedals[2].disableStyle();
  pedals[3]=loadShape("p3.svg");
  pedals[3].disableStyle();
  pedals[4]=loadShape("p4.svg");
  pedals[4].disableStyle();
}
void draw(){
  background(47,61,65);
  shapeMode(CORNER);
  fill(5,60,32);
  noStroke();
  rect(0,height-100,width,100);
  
  for(int i=0;i<5;i++){
    point.x=i*150+75;
    point.y=height-50;
    angle=-PI/2;
    stroke(30,100,50);
    strokeWeight(3);
    noFill();
    beginShape();
    for(int j=0;j<g[i][8];j++){
      angle+=g[i][9];
      vertex(point.x,point.y);
      point.x+=cos(angle)*10;
      point.y+=sin(angle)*10;
      
      
    }
    
    endShape();
    noStroke();
    fill(g[i][0],100,g[i][1]);
    strokeWeight(1);
    pedals[int(g[i][3])].rotate(2*PI/4);
    pedals[int(g[i][3])].scale(g[i][6]/5,g[i][2]/5);
    for(int j=0; j<g[i][3];j++){
      shape(pedals[int(g[i][3])],point.x/*+cos(2*j*PI/g[i][8])*(g[i][6]+g[i][2])*/,point.y/*+sin(2*j*PI/g[i][8])*(g[i][6]+g[i][2])*/,g[i][2],g[i][2]);
      pedals[int(g[i][3])].rotate(j*PI/g[i][8]);
      
    }
    pedals[int(g[i][3])].resetMatrix();
    fill(g[i][4],100,g[i][5]);
    stroke(g[i][0],100,g[i][1]);
    ellipse(point.x,point.y,g[i][6],g[i][6]);
    
    
  }
}