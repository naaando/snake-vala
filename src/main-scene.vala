
public class MainScene : Scene {
    Player player;
    Spawner spawner;
    Label score;
    Audio music;

    public MainScene (GameEngine engine) {
        base (engine);
        base.set_background_color (0xE0, 0xB8, 0x69);
        input_handler.key_pressed.connect (process_event);
        score = new Label ("Score : 0");
        score.pos = new Vector2 (GameEngine.SCREEN_WIDTH/2-125, 0);
        score.scale = 2;
        player = new Player (this);
        spawner = new Spawner (this);

        drawables.append_val (player);
        drawables.append_val (spawner);
        drawables.append_val (score);

        music = new Audio.load_from_file ("mus.ogg");
        music.play (1);
    }

    public override void update () {
        base.update ();
        if (player.collider.collide(spawner.collider)) {
            player.level_up ();
            score.text = ("Score : "+player.score.to_string ());
            spawner.respawn ();
        }

        if (player.dead) {
            game_engine.run (new GameOver (game_engine));
        }
    }

    void process_event (int key) {
        switch (key) {
            case SDL.Input.Keycode.c:
                print ("Music paused : "+music.playing.to_string ()+"\n");
                break;
            case SDL.Input.Keycode.v:
                music.playing = !music.playing;
                break;
        }
    }
}
