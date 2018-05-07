class CircleNode extends Node {
  CircleNode(){
  
  };
  
  CircleNode(final float x, final float y, final float r) {
    super(x, y);
    this.r=r;
  };

  CircleNode(final float x, final float y) {
    this(x, y, 10);
  };

  public boolean contains(final float x, final float y) {
    if (abs(x-this.getX())<=r && abs(y-this.getY())<=r) {
      return true;
    };
    return false;
  };

  public void display() {
    ellipse(this.getX(), this.getY(), 2*r, 2*r);
  };

  private float r;
};