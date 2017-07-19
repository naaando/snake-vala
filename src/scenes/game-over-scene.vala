
public class GameOver : Scene {
    Audio se_fudeu;
    Label game_over;

    public GameOver (GameEngine engine) {
        base (engine);
        base.set_background_color (0x00, 0x00, 0x00);
        game_over = new Label ("Game Over");
        game_over.pos = new Vector2 (game_engine.screen_width/2-100, game_engine.screen_height/2);
        game_over.scale = 2;

        se_fudeu = new Audio.load_from_file ("game_over.ogg");
        se_fudeu.play (1);

        drawables.append_val (game_over);
    }

    public override void update () {
        base.update ();
    }
}
