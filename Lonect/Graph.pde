class Graph {

  Graph() {
    nodes=new ArrayList<Node>();
    edges=new ArrayList<Edge>();
    conections=new Table();
  };
 
 
  public void addEdge(final PVector A,final PVector B){
     Node nA=new CircleNode();
     Node nB=new CircleNode();
      boolean TheresA=false;
      boolean TheresB=false;
    for(Node node:nodes){
     if(node.contains(A.x,A.y)){
      nA=node;
       TheresA=true;
     };
     if(node.contains(B.x,B.y)){
      nB=node;
       TheresB=true;
     };
    };
     if(TheresA && TheresB){
       if(nA!=nB){
        addEdge(indexOfNode(nA),indexOfNode(nB));
       };
     };
  };
  
  public void addNode(final Node node) {
    nodes.add(node);
    conections.addRow();
    conections.addColumn();
    int rows=conections.getRowCount()-1;
    for(TableRow row:conections.rows()){
      row.setInt(rows,0);
    };
    for(int i=0;i<=rows;i++){
      conections.setInt(rows,i,0);
     };
    
  };
  public void removeNode(final Node node) {
    conections.removeRow(nodes.indexOf(node));
    conections.removeColumn(nodes.indexOf(node));
     nodes.remove(node);
  };
  
  public void addEdge(final int A,final int B){
   addEdge(new Edge(getNode(A),getNode(B)));
  };
  
  public Node getNode(final PVector A){
   for(Node node:nodes){
    if(node.contains(A.x,A.y)){
     return node;
    };
   };
    return null;
  };
  
  public void addEdge(final Edge edge) {
    edges.add(edge);
    int A=nodes.indexOf(edge.getA());
    int B=nodes.indexOf(edge.getB());
    int conection=conections.getInt(A,B);
    conections.setInt(A,B,conection+1);
  };
  public void removeEdge(final Edge edge) {
    edges.remove(edge);
    int A=nodes.indexOf(edge.getA());
    int B=nodes.indexOf(edge.getB());
    int conection=conections.getInt(A,B);
    conections.setInt(A,B,conection-1);
  };
  
  public Node getNode(final int index) {
    return nodes.get(index);
  };
  public int indexOfNode(final Node node) {
    return nodes.indexOf(node);
  };
  
  public int numberOfNodes(){
   return nodes.size();
  };
  
  
  
  public void display() {
    for (Edge edge : edges) {
      if (edge!=null) {
        edge.display();
      };
    };
    for (Node node : nodes) {
      if (node!=null) {
        node.display();
      };
    };
  };
  
  public Table getConections(){
   return conections;
  };
  
  public void removeNode(final PVector position){
   for(Node node:nodes){
    if(node.contains(position.x,position.y)){
     this.removeNode(node);
    };
   };
  };
  
  public boolean isValidEdge(final Edge edge){
    int A=indexOfNode(edge.getA());
    int B=indexOfNode(edge.getB());
    
     if(getCompositeTable().getInt(A,B)==0){
     
     }else{
      return true;
     };
      return false;
  };
  
  public Table getCompositeTable(){
    Table comp=new Table();
     for(int i=0;i<nodes.size();i++){
       comp.addRow();
      for(int j=0;j<nodes.size();j++){
       comp.addColumn();
        int value=conections.getInt(i,j)+conections.getInt(j,i);
        comp.setInt(i,j,value);
      };
     };
      return comp;
  };
  
  
  
  private Table conections;
  private ArrayList<Edge> edges;
  private ArrayList<Node> nodes;
};