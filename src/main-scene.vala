
public class MainScene : Scene {
    Player player;
    Spawner spawner;

    public MainScene (GameEngine engine) {
        base (engine);
        player = new Player (this);
        spawner = new Spawner (this);

        drawables.add (player);
        drawables.add (spawner);
    }

    public override void update () {
        base.update ();
        if (player.collider.collide(spawner.collider)) {
            print ("Colliding\n");
        }
    }
}
