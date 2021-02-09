import processing.sound.*;
Amplitude amp;
AudioIn in;
StickMan stickMan;

void setup(){
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  size(500, 500);
  stickMan = new StickMan(width/2, height/2 + 35, 65, radians(25), 0.02, 3, amp);
}

void draw(){
  stickMan.draw();
}
