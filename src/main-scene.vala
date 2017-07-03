
public class MainScene : Scene {
    Player player;
    Spawner spawner;
    // SDLTTF.Font font;

    public MainScene (GameEngine engine) {
        // Should throw error instead of crashing the program
        // font = new SDLTTF.Font ("font.ttf", 12);
        base (engine);
        base.set_background_color (13 , 25, 38);
        player = new Player (this);
        spawner = new Spawner (this);

        drawables.add (player);
        drawables.add (spawner);
    }

    public override void update () {
        base.update ();
        if (player.collider.collide(spawner.collider)) {
            player.level_up ();
            spawner.respawn ();
        }
    }
}
