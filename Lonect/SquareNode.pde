class SquareNode extends Node{
  
  SquareNode(final float x,final float y){
   super(x,y);
  };
  
  public boolean contains(final float x,final float y){
   return false;
  };
  public void display(){
   rect(getX()-5,getY()-5,10,10);
  };
};