
public class Scene : Object, GameObject {
    public GameEngine game_engine {get; protected set;}
    public InputManager input_handler {get; protected set;}
    protected GLib.Array<Drawable> drawables;
    protected unowned SDL.Video.Renderer renderer;

    public uint8 r {get;set;default=0;}
    public uint8 b {get;set;default=0;}
    public uint8 g {get;set;default=0;}
    public bool done {get; set;}

    public Scene (GameEngine engine) {
        drawables = new GLib.Array<Drawable> ();
        game_engine = engine;
        renderer = engine.renderer;
        input_handler = engine.input_handler;
    }

    public virtual void update () {
        draw ();
    }

    void draw () {
        renderer.clear ();
        renderer.set_draw_color (r, g, b, 0);

        for (int i = 0; i < drawables.length; i++) {
            drawables.index(i).draw (renderer);
        }

        renderer.set_draw_color (r, g, b, 0);
        renderer.present ();
    }

    public void set_background_color (uint8 red, uint8 green, uint8 blue) {
        r = red;
        g = green;
        b = blue;
    }
}
