import java.util.List;
import com.restfb.Connection;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;
import com.restfb.types.Comment;


private List<Ball> balls = new ArrayList<Ball>();
private List<Integer> posi = new ArrayList<Integer>();
final String ACESS_TOKEN = "EAACEdEose0cBANPPysPAImn3loHmQ3JHi6VnGKaswOy9WzCVo9RxuIeB5ZAi81ZC2hawN8ZCkcKFnBTgBbawROm4aV1ZAhQCVDBZBaN4qETBbBTNLjbhc52AunKrqZAQKVtZA1zLDl0DqNZAUb1FPvG1wU5NkJQ8lU586kAd4GgmqwZDZD";
final String TARGET_ID = "894001074051876_1135908729861108";
FacebookClient fbClient = new DefaultFacebookClient(ACESS_TOKEN, Version.LATEST);
private List<Ball> textToDraw = new ArrayList<Ball>();

public void setup(){
  size(800,600);
  //fullScreen();
  getPostsCount();
  
 frameRate(60);
}


public void draw(){
  background(0);
  for(int i = 0; i < balls.size();i++){
    Ball b = balls.get(i);
    if(b.visible){
       b.update();
       b.show();
    }else{
      textToDraw.add(b);
      balls.remove(b);
    }
  }
  
  //System.out.println("Framerate: "+ frameRate);
  fill(255);
  for(Ball b : textToDraw){
    text(b.text,b.vetor.x,b.vetor.y);
  }
  
  if(balls.isEmpty()){
    getPostsCount();
  }
  
  
  
}

/*void keyReleased() {
  if (key == ' ') {
    balls.add(new Ball(new PVector(random(width), height))); 
  }
}*/


private void getPostsCount(){
  
  Connection<Comment> allComments = fbClient.fetchConnection(TARGET_ID+"/comments", Comment.class);
  for(List<Comment> postcomments : allComments){
    for (Comment comment : postcomments){
        if(notIn(comment.getMessage())){
           balls.add(new Ball(new PVector(random(width), height),comment.getMessage()));   
        }
    }
  }     
}


private boolean notIn(String text){
  int cont = 0;
  for(Ball b: textToDraw){
    if(b.text.equalsIgnoreCase(text)){
      cont++;
    }
  }
  
  if(cont == 0){
    return true;
  }else {
    return false;
  }
  
}