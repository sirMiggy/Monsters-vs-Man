
/*
 * PlayerEntity
 * Created by Eqela Studio 2.0b7.4
 */

public class PlayerEntity : SEEntity
{
	SESprite player;
	int w;
	int h;
	public static int wp;
	public static int hp;

	public void initialize(SEResourceCache rsc)
	{
		base.initialize(rsc);
		w = get_scene_width();
		h = get_scene_height();
		rsc.prepare_image("batman", "batty",0.1*w,0.1*h);
		player = add_sprite_for_image(SEImage.for_resource("batman"));
		wp = player.get_width();
		hp = player.get_height();
		player.move(w/2-wp/2,h/2-hp/2);
		
	}

	public void tick(TimeVal now, double delta)
	{
		base.tick(now,delta);
		player.move(MainScene.x-0.5*wp,MainScene.y-0.5*hp);
	}
	
}
