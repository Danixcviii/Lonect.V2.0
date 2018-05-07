class Level {


  Level() {
    userGraph=new Graph();
    graph=new Graph();
    gameOver=false;
  };

  public boolean gameOver() {
     int nNodes=graph.numberOfNodes();
      boolean ac=false;
     if(nNodes!=0){
        Table userConec=userGraph.getCompositeTable();
    Table conect=graph.getCompositeTable();
        ac=true;
      for(int i=0;i<nNodes;i++){
      for(int j=0;j<nNodes;j++){
         int userValue=userConec.getInt(i,j);
         int value=conect.getInt(i,j);
           if(value>0){
            ac&=(userValue>0);
           };
      };
     };
     };
      return ac;
  };

  public void save(final String path) {
    String[] a=split(path, "\\");
    String name=a[a.length-1];

    Table setUp=new Table();
    Table positions=new Table();
    Table conections=new Table();
    setUp.addColumn("name");
    setUp.addRow();
    setUp.setString(0, "name", name);
    positions.addColumn("x");
    positions.addColumn("y");
    positions.addColumn("shape");
    for (int i=0; i<graph.numberOfNodes(); i++) {
      float x=graph.getNode(i).getX();
      float y=graph.getNode(i).getY();
      String shape=graph.getNode(i).getSaphe();
      positions.addRow();
      positions.setFloat(i, "x", x);
      positions.setFloat(i, "y", y);
      positions.setString(i, "shape", shape);
    };
    conections=graph.getConections();

    saveTable(setUp, path+"/"+name+"s.csv");
    saveTable(positions, path+"/"+name+"p.csv");
    saveTable(conections, path+"/"+name+"c.csv");
  };

  public void load(final String path) {
    String[] a=split(path, "\\");
    String name=a[a.length-1];
    printArray(a);
    Table setUp=loadTable(path+"/"+name+"s.csv", "header");
    Table positions=loadTable(path+"/"+name+"p.csv", "header");
    Table conections=loadTable(path+"/"+name+"c.csv");
    println("tables loaded");
    setName(setUp.getString(0, "name"));
    for (TableRow row : positions.rows()) {
      addNode(new CircleNode(row.getFloat("x"),row.getFloat("y")));
    };

    int rows=conections.getRowCount();
    for (int i=0; i<rows; i++) {
      for (int j=0; j<rows; j++) {
        int value=conections.getInt(i, j);
        if (value>0) {
          for (int h=0; h<value; h++) {
            graph.addEdge(i, j);
          };
        };
      };
    };
  };
  
  public void removeNode(final PVector pos){
   graph.removeNode(pos);
  };


  public void addNode(final Node node) {
    userGraph.addNode(node);
    graph.addNode(node);
  };

  public void removeNode(final Node node) {
    userGraph.removeNode(node);
    graph.removeNode(node);
  };

  public Node getNode(final PVector click) {
    return graph.getNode(click);
  };

  public boolean validEdge(final PVector Ap,final PVector Bp){
   Node A=getNode(Ap);
   Node B=getNode(Bp);
   return graph.isValidEdge(new Edge(A,B));
  };

  public void addUserEdge(final PVector A, final PVector B) {
    if(validEdge(A,B)){
      userGraph.addEdge(A, B); 
       println("valid edge");
    }else{
      println("it is not a valid edge");
    };
    
  };

  public void verify() {
    Table conections=graph.getCompositeTable();
    Table userConections=userGraph.getConections();
    for (int i=0; i<graph.numberOfNodes(); i++) {
      for (int j=0; j<graph.numberOfNodes(); j++) {
        int value=conections.getInt(i, j);
        int userValue=userConections.getInt(i, j);
        if (value>0 && userValue<0) {
        };
      };
    };
  };

  public void addEdge(final int A, final int B) {
    graph.addEdge(A, B);
  };

  public void addEdge(final PVector A, final PVector B) {
    graph.addEdge(A, B);
  };

  public void removeEdge(final Edge edge) {
    graph.addEdge(edge);
  };

  void display() {
    userGraph.display();
    graph.display();
  };

  

  public boolean isValidEdge(final Edge edge) {
    return graph.isValidEdge(edge);
  };
  public void setName(final String name) {
    this.name=name;
  };

  private boolean gameOver;
  private String name;
  private Graph userGraph;
  private Graph graph;
};