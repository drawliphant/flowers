boolean randBool(){
  return (random(0,1)<.5);
}
float wheel(float color1,float color2){
 
 float colorn=random(0,100);
   return ((color1+color2)%100)/2;
}
int clicks=0;
int[] s=new int[2];
void mousePressed(){
  s[clicks]=round(mouseX/150-.5);
  clicks++;
  if(clicks==2){
   
    for(int i=0;i<5;i++){
      if(i!=s[0]&&i!=s[1]){
        r[0]=random(0,100);
        r[1]=random(0,100);
        r[2]=random(1,50);
        r[3]=1;
        r[4]=random(0,100);
        r[5]=random(0,100);
        r[6]=random(0,50);
        r[7]=random(2,20);
        r[8]=random(2,20);
        r[9]=random(-.1,.1);
        for(int j=0;j<10;j++){
          if(j==0||j==4){
            g[i][j]=wheel(g[s[0]][j],g[s[1]][j]);
          }else{
            g[i][j]=(g[s[0]][j]+g[s[1]][j]+r[j])/3;
          }
        }
        
        
      }
      
      
    }
    clicks=0;
    
  }
}


PShape[] pedals=new PShape[3];{
//pedals[0]=loadShape("p0.svg");
//pedals[1]=loadShape("p1.svg");
//pedals[2]=loadShape("p1.svg");
}
float[] r=new float[10];
float[][] g=new float[5][10];{
  for(int i=0;i<5;i++){
    g[i][0]=random(0,100);
    g[i][1]=random(0,100);
    g[i][2]=random(1,50);
    g[i][3]=1;
    g[i][4]=random(0,100);
    g[i][5]=random(0,100);
    g[i][6]=random(0,50);
    g[i][7]=random(2,20);
    g[i][8]=random(2,20);
    g[i][9]=random(-.1,.1);
    
    
  }
}
float angle;
PVector point=new PVector(0,0);
PVector point2=new PVector(0,0);
void setup(){
  size(750,400);
  colorMode(HSB,100);
  //generate flowers and save to  
}
void draw(){
  background(47,61,65);
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
    strokeWeight(1);
    fill(g[i][4],100,g[i][5]);
    stroke(g[i][0],100,g[i][1]);
    ellipse(point.x,point.y,g[i][6],g[i][6]);
    
    
  }
}