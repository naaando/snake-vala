
public class RendererManager : Object {
    public static RendererManager instance;

    public const int SCREEN_WIDTH = 640;
    public const int SCREEN_HEIGHT = 480;
    const int SCREEN_BPP = 32;
    const int DELAY = 10;

    public uint8 r {get;set;default=0;}
    public uint8 b {get;set;default=0;}
    public uint8 g {get;set;default=0;}

    SDL.Video.Window window;
    SDL.Video.Renderer renderer;

    public InputHandler handler {get; set;}
    SList<Drawable> drawables;

    public bool done {get; set;}

    public RendererManager () {
        SDL.init (SDL.InitFlag.EVERYTHING|SDLImage.InitFlags.ALL);

        window = new SDL.Video.Window ("Snake in SDL2/Vala", SDL.Video.Window.POS_CENTERED, SDL.Video.Window.POS_CENTERED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL.Video.WindowFlags.RESIZABLE);
        window.show ();

        renderer = SDL.Video.Renderer.create (window, -1, SDL.Video.RendererFlags.ACCELERATED | SDL.Video.RendererFlags.PRESENTVSYNC);

        drawables = new SList<Drawable> ();

        handler = new InputHandler (this);
    }

    ~RendererManager () {
        SDL.quit ();
    }

    public static RendererManager getInstance () {
        if (instance == null) {
            instance = new RendererManager ();
        }
        return instance;
    }

    public void run () {
        var frame = 0;
        while (!done) {
            handler.process_events ();
            render (frame);
            SDL.Timer.delay (DELAY);
        }
    }

    void render (int frame) {
        renderer.clear ();
        renderer.set_draw_color (r, g, b, 0);

        foreach (var drawable in drawables) {
            drawable.draw (renderer);
        }

        renderer.set_draw_color (r, g, b, 0);
        renderer.present ();
    }

    public void draw (Drawable drawable) {
        drawables.append (drawable);
        print ("Appending a drawable\n");
    }

    public void set_fullscreen (bool fullscreen) {
        window.set_fullscreen ((int)fullscreen);
    }

    public void set_background_color (uint8 red, uint8 green, uint8 blue) {
        r = red;
        g = green;
        b = blue;
    }

    public uint32 random_x () {
        var random = Random.int_range (0, SCREEN_WIDTH);
        return random;
    }

    public uint32 random_y () {
        return Random.int_range (0, SCREEN_HEIGHT);
    }
}
