
public class GameEngine : Object {
    public const int SCREEN_WIDTH = 640;
    public const int SCREEN_HEIGHT = 480;
    public const int SCREEN_BPP = 32;
    public const int DELAY = 10;
    // public Gee.ArrayList scenes {get;set;}

    SDL.Video.Window window;

    public GameEngine (string title) {
        // scenes = new Gee.ArrayList<Scene> ();

        SDL.init (SDL.InitFlag.EVERYTHING|SDLImage.InitFlags.ALL);
        window = new SDL.Video.Window (title, SDL.Video.Window.POS_CENTERED, SDL.Video.Window.POS_CENTERED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL.Video.WindowFlags.RESIZABLE);
        window.show ();
    }

    ~GameEngine () {
        SDL.quit ();
    }

    public void run (Scene? scene = null) {
        scene.start (window);
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
        var random = Random.int_range (0, SCREEN_WIDTH);
        return random;
    }

    public uint32 random_y () {
        return Random.int_range (0, SCREEN_HEIGHT);
    }
}
