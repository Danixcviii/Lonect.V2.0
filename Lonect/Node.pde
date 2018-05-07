abstract class Node  {
  Node(){};
  Node(final PVector position, final float size) {
    this.setPosition(position);
    this.setSize(size);
  };

  Node(final float x, final float y, final float size) {
    this(new PVector(x, y), size);
  };

  Node(final float x, final float y) {
    this(x, y, SIZE);
  };

  public void setSize(final float size) {
    this.size=size;
  };

  public float getSize() {
    float size=new Float(this.size);
    return size;
  };

  public void setPosition(final PVector position) {
    this.position=position;
  };

  public float getX() {
    return getPosition().x;
  };

  public float getY() {
    return getPosition().y;
  };

  public PVector getPosition() {
    PVector position=new PVector(this.position.x, this.position.y);
    return position;
  };

  public void setName(final int name) {
    this.name=name;
  };

  public int getName() {
    int name=this.name;
    return name;
  };

  public String getSaphe(){
   return shape;
  };
  public void setShape(final String shape){
    this.shape=shape;
  };
  public abstract void display();
  public abstract boolean contains(final float x, final float y);


  private String shape;
  private int name;
  private float size;
  private PVector position;
  public static final float SIZE=10;
};