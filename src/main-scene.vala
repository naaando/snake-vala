
public class MainScene : Scene {
    Player player;
    Spawner spawner;
    Label score;

    public MainScene (GameEngine engine) {
        base (engine);
        base.set_background_color (13 , 25, 38);
        score = new Label ("Score : 0");
        player = new Player (this);
        spawner = new Spawner (this);

        drawables.add (player);
        drawables.add (spawner);
        drawables.add (score);
    }

    public override void update () {
        base.update ();
        if (player.collider.collide(spawner.collider)) {
            player.level_up ();
            score.text = ("Score : "+player.score.to_string ());
            spawner.respawn ();
        }
    }
}
