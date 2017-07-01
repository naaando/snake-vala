
// public class Spawner : Object, Drawable {
// 	int SpawnTime = 5000;
// 	// Timer timer;
// 	SDL.Video.Rect food;
//
// 	public Spawner (Scene scene) {
// 		food = { (int) GameEngine.random_x (), (int) GameEngine.random_y (), 16, 16 };
// 		var timer = new SDL.Timer (SpawnTime, reset);
// 	}
//
// 	public virtual void draw (SDL.Video.Renderer renderer) {
// 		renderer.set_draw_color (255, 255, 0, 0);
// 		renderer.fill_rect (food);
// 	}
//
// 	uint32 reset () {
// 		food.x = (int) engine.random_x ();
// 		food.y = (int) engine.random_y ();
// 		return SpawnTime;
// 	}
//
// }
