
/*
 * GameOverScene
 * Created by Eqela Studio 2.0b7.4
 */

public class GameOverScene : SEScene
{
	SESprite BGGrid;
	SESprite Playbutton;

	int wpb;
	int hpb;
	int xpb;
	int ypb;

	int w;
	int h;
	public void initialize(SEResourceCache rsc) {
		base.initialize(rsc);
		add_entity(SESpriteEntity.for_color(Color.instance("white"), get_scene_width(), get_scene_height()));

		h = get_scene_height();
		w = get_scene_width();

		rsc.prepare_image("bgrid","grid",w,h);
		rsc.prepare_image("pb","gameover",0.75*w,0.25*h);

		BGGrid = add_sprite_for_image(SEImage.for_resource("bgrid"));
		Playbutton = add_sprite_for_image(SEImage.for_resource("pb"));

		AudioClipManager.prepare("death");
		AudioClipManager.play("death");
		
		hpb = Playbutton.get_height();
		wpb = Playbutton.get_width();
		
		BGGrid.move(0,0);
		Playbutton.move(0.5*w-0.5*wpb,0.5*h-0.5*hpb);

		xpb = Playbutton.get_x();
		ypb = Playbutton.get_y();

	}

	public void cleanup() {
		base.cleanup();
	}

	public void on_pointer_press(SEPointerInfo pi) {
        base.on_pointer_press(pi);
       
		 if(pi.is_inside(0,0,w,h)) {
            switch_scene(new MenuScene());
        }
	}
}
