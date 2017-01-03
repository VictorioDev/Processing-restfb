class Ball{
  public PVector vetor;
  private float vel;
  private float grav;
  public boolean visible;
  public String text;
  private int r,g,b;
  
  public Ball(PVector vet, String text){
    this.vetor = vet;
    this.vel = random(7,15);
    this.grav = 0.2;
    this.visible = true;
    this.r = int(random(255));
    this.g = int(random(255));
    this.b = int(random(255));
    this.text = text;
  }
  
  public void show(){
    noStroke();
    fill(this.r,this.g,this.b);
    ellipse(this.vetor.x,this.vetor.y, 10,10);
  }
  
  public void update(){
    this.vetor.y-=vel;
    this.vel-=grav;
    
    if(this.vel <= 0){
      float radius = 50;
      int numPoints= 10;
      float angle = TWO_PI/(float)numPoints;
      pushMatrix();
      translate(this.vetor.x,this.vetor.y);
      for(int i=0;i<numPoints;i++){
        ellipse(radius*sin(angle*i),radius*cos(angle*i),5,5);
      } 
      popMatrix();
      
      this.visible = false;
    }
  }
}