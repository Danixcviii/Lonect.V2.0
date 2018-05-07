class Edge  {

  Edge(final Node A, final Node B) {
    this.setA(A);
    this.setB(B);
  };

  public void setA(final Node A) {
    this.A=A;
  };
  public Node getA() {
    return A;
  };
  public void setB(final Node B) {
    this.B=B;
  };
  public Node getB() {
    return B;
  };

  public void display() {
    line(A.getX(), A.getY(), B.getX(), B.getY());
  };

  private Node A;
  private Node B;
};