void setup(){
  
  size(500,500);
  
mousePressed=new PVector();
currentLevel=new Level();
currentLevel.load(levels[cLevel]);
currentMode=Mode.Game;
};

void nextLevel(){
   currentLevel=new Level();
 if(cLevel==(levels.length-1)){
  cLevel=0;
   
 }else{
  cLevel++;
 };
  currentLevel.load(levels[cLevel]); 
};

String[] levels={"ichi","ni","san"};
int cLevel=0;

void draw(){
   background(#FFFFFF);
 currentLevel.display();
 if(!currentLevel.gameOver()){
   
 }else{
   println("ha ganado");
 };
};

void mousePressed(){
  mousePressed=new PVector(mouseX,mouseY);
};

void mouseReleased(){
 if(currentMode==Mode.Game){
    currentLevel.addUserEdge(mousePressed,new PVector(mouseX,mouseY));
 }else if(currentMode==Mode.Create){
  if(currentTool==Tool.CreateEdge){
    currentLevel.addEdge(mousePressed,new PVector(mouseX,mouseY));
  };
 };
};


void mouseClicked(){
 if(currentMode==Mode.Create){
  switch(currentTool){
   case CreateNode:
     currentLevel.addNode(new CircleNode(mouseX,mouseY));
    break;
   case RemoveNode:
     currentLevel.removeNode(new PVector(mouseX,mouseY));
    break;
  };
 };
};



void keyTyped(){
 switch(key){
  case 'G':
   currentMode=Mode.Game;
    println("game mode changed");
  break;
  case 'C':
   currentMode=Mode.Create;
    currentLevel=new Level();
    println("create mode changed");
  break;
  case 'n':
   if(currentMode==Mode.Create){
     currentTool=Tool.CreateNode;
     println("node tool actived");
   };
  break;
   case 'e':
    if(currentMode==Mode.Create){
     currentTool=Tool.CreateEdge;
     println("edge tool actived");
    };
   break;
   case 's':
    if(currentMode==Mode.Create){
      selectFolder("Select a folder","saveLevel");
    };
   break;
   case 'l':
    if(currentMode==Mode.Game){
       currentLevel=new Level();
      selectFolder("Select a folder to load","loadLevel");
    };
   break;
   case 'N':
    if(currentMode==Mode.Create){
     currentTool=Tool.RemoveNode;
    };
   break;
   case 'L':
    if(currentMode==Mode.Game){
     nextLevel();
    };
   break;
 };
};

void loadLevel(final File file){
 if(file!=null){
   currentLevel.load(file.getAbsolutePath());
 };
};

void saveLevel(final File file){
  if(file!=null){
   currentLevel.save(file.getAbsolutePath());
  };
};

Mode currentMode;
Tool currentTool;
PVector mousePressed;
Level currentLevel;

enum Mode{
 Game,Create;
};
enum Tool{
 CreateNode,CreateEdge,RemoveNode;
};