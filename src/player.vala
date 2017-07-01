
public class Player : Object, Drawable {
    const int WALK_SPEED = 20;
    SDL.Video.Rect body;

    public Player (Scene scene) {
        scene.input_handler.key_pressed.connect (process_event);
        body = { (GameEngine.SCREEN_WIDTH/2)-32, (GameEngine.SCREEN_HEIGHT/2)-32, 32, 32 };
    }

    public virtual void draw (SDL.Video.Renderer renderer) {
        //Render red filled quad
        renderer.set_draw_color (255, 0, 0, 0);
        renderer.fill_rect (body);
    }

    void process_event (int key) {
        switch (key) {
            case SDL.Input.Keycode.w:
            case SDL.Input.Keycode.UP:
                body.y-=WALK_SPEED;
                break;
            case SDL.Input.Keycode.s:
            case SDL.Input.Keycode.DOWN:
                body.y+=WALK_SPEED;
                break;
            case SDL.Input.Keycode.a:
            case SDL.Input.Keycode.LEFT:
                body.x-=WALK_SPEED;
                break;
            case SDL.Input.Keycode.d:
            case SDL.Input.Keycode.RIGHT:
                body.x+=WALK_SPEED;
                break;
        }
    }
}
