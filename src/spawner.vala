
public class Spawner : Object, Drawable {
    GameEngine game_engine;
    public BoundingBox collider {get;private set;}
    // Common food size
    const int fc_size = 12;

    int SpawnTime = 5000;
    SDL.Video.Rect food;

    public Spawner (Scene scene) {
        game_engine = scene.game_engine;

        food = { (int) game_engine.random_x (), (int) game_engine.random_y (), fc_size, fc_size };
        collider = new BoundingBox (fc_size, fc_size);
        // TODO : Spawn special food over time
        // var timer = new SDL.Timer (SpawnTime, respawn);
    }

    public virtual void draw (SDL.Video.Renderer renderer) {
        renderer.set_draw_color (0, 0, 0, 0);
        renderer.fill_rect (food);

        collider.x = food.x;
        collider.y = food.y;
    }

    public uint32 respawn () {
        food.x = (int) game_engine.random_x ();
        food.y = (int) game_engine.random_y ();
        return SpawnTime;
    }
}
