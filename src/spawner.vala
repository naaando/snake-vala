
public class Spawner : Object, Drawable {
    GameEngine game_engine;
    public BoundingBox collider {get;private set;}

	int SpawnTime = 5000;
	SDL.Video.Rect food;

	public Spawner (Scene scene) {
        game_engine = scene.game_engine;

        food = { (int) game_engine.random_x (), (int) game_engine.random_y (), 16, 16 };
        collider = new BoundingBox (16, 16);

		var timer = new SDL.Timer (SpawnTime, reset);
	}

	public virtual void draw (SDL.Video.Renderer renderer) {
		renderer.set_draw_color (255, 255, 0, 0);
		renderer.fill_rect (food);

        collider.x = food.x;
        collider.y = food.y;
	}

	uint32 reset () {
		food.x = (int) game_engine.random_x ();
		food.y = (int) game_engine.random_y ();
		return SpawnTime;
	}

}
