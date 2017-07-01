


public class InputHandler : Object {
    RendererManager renderer_manager;

    public signal void key_pressed (int key);

    public InputHandler (RendererManager renderer) {
        renderer_manager = renderer;
    }

    public void process_events () {
        SDL.Event event;
        while (SDL.Event.poll (out event) != 0) {
            switch (event.type) {
                case SDL.EventType.QUIT:
                    renderer_manager.done = true;
                    break;
                case SDL.EventType.KEYDOWN:
                    on_keyboard_event (event.key);
                    break;
            }
        }

    }

    void on_keyboard_event (SDL.KeyboardEvent event) {
        if (is_alt_enter (event.keysym)) {
            renderer_manager.set_fullscreen (true);
        }

        key_pressed (event.keysym.sym);
        // switch (event.keysym.sym) {
        //     // Increase alpha
        //     case SDL.Input.Keycode.w:
        //         buttonX.execute ();
        //         break;
        //     // Decrease alpha
        //     case SDL.Input.Keycode.s:
        //         buttonY.execute ();
        //         break;
        // }
    }

    bool is_alt_enter (SDL.Input.Key key) {
        return ((key.mod & SDL.Input.Keymod.LALT)!=0 && (key.sym == SDL.Input.Keycode.RETURN || key.sym == SDL.Input.Keycode.KP_ENTER));
    }
}
