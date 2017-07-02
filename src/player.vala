
public class Player : Object, Drawable {
    const int WALK_SPEED = 1;
    Direction walk_direction;
    SDL.Video.Rect body;

    public BoundingBox collider {get; set;}

    public Player (Scene scene) {
        scene.input_handler.key_pressed.connect (process_event);
        body = { (GameEngine.SCREEN_WIDTH/2)-32, (GameEngine.SCREEN_HEIGHT/2)-32, 16, 16 };
        collider = new BoundingBox (16, 16);
    }

    void update () {
        move ();
    }

    public virtual void draw (SDL.Video.Renderer renderer) {
        //Render red filled quad
        renderer.set_draw_color (255, 0, 0, 0);
        renderer.fill_rect (body);

        // FIXME: Colocar função update no game loop
        update ();
    }

    void process_event (int key) {
        switch (key) {
            case SDL.Input.Keycode.w:
            case SDL.Input.Keycode.UP:
                walk_direction = Direction.UP;
                break;
            case SDL.Input.Keycode.s:
            case SDL.Input.Keycode.DOWN:
                walk_direction = Direction.DOWN;
                break;
            case SDL.Input.Keycode.a:
            case SDL.Input.Keycode.LEFT:
                walk_direction = Direction.LEFT;
                break;
            case SDL.Input.Keycode.d:
            case SDL.Input.Keycode.RIGHT:
                walk_direction = Direction.RIGHT;
                break;
        }
    }

    void move () {
        switch (walk_direction) {
            case Direction.UP:
                body.y -= WALK_SPEED;
                break;
            case Direction.DOWN:
                body.y += WALK_SPEED;
                break;
            case Direction.LEFT:
                body.x -= WALK_SPEED;
                break;
            case Direction.RIGHT:
                body.x += WALK_SPEED;
                break;
        }

        collider.x = body.x;
        collider.y = body.y;
    }

    void add_tail () {
        // body += { (GameEngine.SCREEN_WIDTH/2)-32, (GameEngine.SCREEN_HEIGHT/2)-32, 48, 32 };
        error ("Not implemented yet!");
    }
}

enum Direction {
    UP,
    DOWN,
    LEFT,
    RIGHT
}
