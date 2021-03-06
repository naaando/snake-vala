
public class GameEngine : Object {
    public int screen_width {
        get {
            int x;
            window.get_size (out x, null);
            return x;
        }
    }

    public int screen_height {
        get {
            int y;
            window.get_size (null, out y);
            return y;
        }
    }

    public const int DEF_SCREEN_WIDTH = 640;
    public const int DEF_SCREEN_HEIGHT = 480;
    public const int SCREEN_BPP = 32;
    public const int DELAY = 10;
    public InputManager input_handler {get; set;}
    public SDL.Video.Renderer renderer;

    public bool done {get;set;}

    SDL.Video.Window window;

    public GameEngine (string title) {
        print ("Starting engine\n");

        SDL.init (SDL.InitFlag.EVERYTHING|SDLImage.InitFlags.ALL);
        SDLTTF.init ();

        window = new SDL.Video.Window (title, SDL.Video.Window.POS_CENTERED, SDL.Video.Window.POS_CENTERED, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT, SDL.Video.WindowFlags.RESIZABLE);
        renderer = SDL.Video.Renderer.create (window, -1, SDL.Video.RendererFlags.ACCELERATED | SDL.Video.RendererFlags.PRESENTVSYNC);
        window.show ();

        input_handler = new InputManager (this);
    }

    ~GameEngine () {
        SDL.quit ();
        SDLTTF.quit ();
    }

    public void run (Scene? scene = null) {
        game_loop (scene);
    }

    // public void run_scenes () {
    //     foreach (var scene in scenes) {
    //         scene.start ();
    //     }
    // }

    public void set_fullscreen (bool fullscreen) {
        window.set_fullscreen ((int)fullscreen);
    }

    public uint32 random_x () {
        var random = Random.int_range (0, screen_width);
        return random;
    }

    public uint32 random_y () {
        return Random.int_range (0, screen_height);
    }

    void game_loop (Scene scene) {
        while (!done) {
            input_handler.process_events ();
            scene.update ();
            SDL.Timer.delay (GameEngine.DELAY);
        }
    }
}
