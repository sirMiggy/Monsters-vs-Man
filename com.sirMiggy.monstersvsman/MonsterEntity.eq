
/*
 * MonsterEntity
 * Created by Eqela Studio 2.0b7.4
 */


public class MonsterEntity : SEEntity
{
	SESprite monster;

	int w;
	int h;
	int wm;
	int hm;
	int mx;
	int my;

	public void initialize(SEResourceCache rsc)
	{
		base.initialize(rsc);
		w = get_scene_width();
		h = get_scene_height();
		rsc.prepare_image("joker", "Yellow_Joker",0.1*w,0.1*h);
		monster = add_sprite_for_image(SEImage.for_resource("joker"));
		wm = monster.get_width();
		hm = monster.get_height();
		monster.move(Math.random(0,w),Math.random(0,h));
	
		}

	public void tick(TimeVal now, double delta)
	{
		base.tick(now,delta);
		mx = monster.get_x();
		my = monster.get_y();

			//Game Looper
		if(MainScene.x<=mx+wm &&  MainScene.x+0.5*PlayerEntity.wp>=mx+wm && MainScene.y<=my+hm && MainScene.y+0.5*PlayerEntity.hp>=my+hm) {
				MainScene.gameOver = true;
		}
		
		monster.move(mx+((MainScene.x-0.25*PlayerEntity.wp)-mx)/Math.random(50,100),my+((MainScene.y-0.25*PlayerEntity.hp)-my)/Math.random(50,100));

	}
	
}

