
public class InputManager : Object {
    public signal void key_pressed (int key);
    GameEngine game_engine;

    public InputManager (GameEngine engine) {
        game_engine = engine;
    }

    public void process_events () {
        SDL.Event event;
        while (SDL.Event.poll (out event) != 0) {
            switch (event.type) {
                case SDL.EventType.QUIT:
                    game_engine.done = true;
                    break;
                case SDL.EventType.KEYDOWN:
                    on_keyboard_event (event.key);
                    break;
            }
        }

    }

    void on_keyboard_event (SDL.KeyboardEvent event) {
        if (is_alt_enter (event.keysym)) {
            game_engine.set_fullscreen (true);
        }

        key_pressed (event.keysym.sym);
    }

    bool is_alt_enter (SDL.Input.Key key) {
        return ((key.mod & SDL.Input.Keymod.LALT)!=0 && (key.sym == SDL.Input.Keycode.RETURN || key.sym == SDL.Input.Keycode.KP_ENTER));
    }
}
