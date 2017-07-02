
public class Scene : Object, GameObject {
    public GameEngine game_engine {get; protected set;}
    public InputManager input_handler {get; protected set;}
    protected Gee.ArrayList<Drawable> drawables;
    protected SDL.Video.Renderer renderer;

    public uint8 r {get;set;default=0;}
    public uint8 b {get;set;default=0;}
    public uint8 g {get;set;default=0;}
    public bool done {get; set;}

    public Scene (GameEngine engine) {
        drawables = new Gee.ArrayList<Drawable> ();
        game_engine = engine;
        input_handler = engine.input_handler;
    }

    public void load (SDL.Video.Window window) {
        renderer = SDL.Video.Renderer.create (window, -1, SDL.Video.RendererFlags.ACCELERATED | SDL.Video.RendererFlags.PRESENTVSYNC);
    }

    public virtual void update () {
        draw ();
    }

    void draw () {
        renderer.clear ();
        renderer.set_draw_color (r, g, b, 0);

        foreach (var drawable in drawables) {
            drawable.draw (renderer);
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
