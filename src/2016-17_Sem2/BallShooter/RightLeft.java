import processing.core.*;	
	
public class RightLeft
{	
	public RightLeft(PApplet p, float diameter)
	{
		this.p=p;
		rectX = p.width/2;
		rectY = p.height-diameter;
		rectW = diameter;
		rectH = p.height/6;
		angle = 0;
	}
	
	public void display()
	{	
		p.pushMatrix();
		p.translate(rectX,rectY);
		p.rotate(angle);
		p.rectMode(p.CENTER);
		p.fill(77, 255, 136);
		p.rect(0, 0, rectW, rectH);
		p.rect(0,0,5,rectH*3);
		p.popMatrix();
	}

	public void leftGo()
	{
		if (angle > -(49*p.PI)/100)
			angle -= p.PI/100;	
	}

	public void rightGo()
	{
		if (angle < (49*p.PI)/100)
			angle += p.PI/100;
	}
	
	public void leftStop()
	{
		
	}
	
	public void rightStop()
	{
	
	}
	
	public float getAngle()
	{return angle;}
	
	PApplet p;
	private float rectX;
	private float rectY;
	private float rectW;
	private float rectH;
	private float angle;
}