
public class Scene : Object {
    public uint8 r {get;set;default=0;}
    public uint8 b {get;set;default=0;}
    public uint8 g {get;set;default=0;}
    public InputManager input_handler {get; set;}
    public bool done {get; set;}

    protected Gee.ArrayList<Drawable> drawables;
    protected SDL.Video.Renderer renderer;

    public Scene () {
        input_handler = new InputManager ();
        drawables = new Gee.ArrayList<Drawable> ();
    }

    public void start (SDL.Video.Window window) {
        renderer = SDL.Video.Renderer.create (window, -1, SDL.Video.RendererFlags.ACCELERATED | SDL.Video.RendererFlags.PRESENTVSYNC);
        while (!done) {
            input_handler.process_events ();
            draw ();
            SDL.Timer.delay (GameEngine.DELAY);
        }
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
