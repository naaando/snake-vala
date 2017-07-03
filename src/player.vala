
public class Player : Object, Drawable {
    const int SNAKE_SIZE = 16;
    // in pixels

    Direction walk_direction;
    SDL.Video.Rect[] snake;

    int counter;
    int walk_speed = 10;
    int score;

    public BoundingBox collider {get; set;}

    public Player (Scene scene) {
        scene.input_handler.key_pressed.connect (process_event);
        snake += SDL.Video.Rect () { x = (GameEngine.SCREEN_WIDTH/2)-SNAKE_SIZE, y = (GameEngine.SCREEN_HEIGHT/2)-SNAKE_SIZE, w = SNAKE_SIZE, h = SNAKE_SIZE };
        collider = new BoundingBox (SNAKE_SIZE, SNAKE_SIZE);
    }

    public void level_up () {
        score++;
        print (@"Congrats !!! Your score now is $score\n");
        add_tail ();
    }

    void update () {
        if (counter >= walk_speed) {
            counter = 0;
            move ();
        }
        counter++;
    }

    public virtual void draw (SDL.Video.Renderer renderer) {
        // FIXME: Colocar função update no game loop
        update ();

        foreach (var b in snake) {
            renderer.set_draw_color (0xFF, 0xB4, 0x00, 0);
            renderer.fill_rect (b);
        }

    }

    void process_event (int key) {
        switch (key) {
            case SDL.Input.Keycode.w:
            case SDL.Input.Keycode.UP:
                walk_direction = (walk_direction != Direction.DOWN) ? Direction.UP : walk_direction;
                break;
            case SDL.Input.Keycode.s:
            case SDL.Input.Keycode.DOWN:
                walk_direction = (walk_direction != Direction.UP) ? Direction.DOWN : walk_direction;
                break;
            case SDL.Input.Keycode.a:
            case SDL.Input.Keycode.LEFT:
                walk_direction = (walk_direction != Direction.RIGHT) ? Direction.LEFT : walk_direction;
                break;
            case SDL.Input.Keycode.d:
            case SDL.Input.Keycode.RIGHT:
                walk_direction = (walk_direction != Direction.LEFT) ? Direction.RIGHT : walk_direction;
                break;
            case SDL.Input.Keycode.z:
                add_tail ();
                break;
            case SDL.Input.Keycode.x:
                print (snake.length.to_string ()+"\n");
                break;
        }
    }

    void move () {
        int x = snake[0].x, y = snake[0].y;

        switch (walk_direction) {
            case Direction.UP:
                snake[0].y -= SNAKE_SIZE;
                break;
            case Direction.DOWN:
                snake[0].y += SNAKE_SIZE;
                break;
            case Direction.LEFT:
                snake[0].x -= SNAKE_SIZE;
                break;
            case Direction.RIGHT:
                snake[0].x += SNAKE_SIZE;
                break;
        }

        snake[0].x = (snake[0].x < 0) ? GameEngine.SCREEN_WIDTH : snake[0].x;
        snake[0].x = (snake[0].x > GameEngine.SCREEN_WIDTH) ? 0 : snake[0].x;
        snake[0].y = (snake[0].y < 0) ? GameEngine.SCREEN_HEIGHT : snake[0].y;
        snake[0].y = (snake[0].y > GameEngine.SCREEN_HEIGHT) ? 0 : snake[0].y;

        collider.x = snake[0].x;
        collider.y = snake[0].y;

        for (int i = 1; i < snake.length; i++) {
            int old_x = snake[i].x, old_y = snake[i].y;
            snake[i].x = x;
            snake[i].y = y;
            x = old_x;
            y = old_y;
        }
    }

    void add_tail () {
        snake += SDL.Video.Rect () { x = -SNAKE_SIZE, y = -SNAKE_SIZE, w = SNAKE_SIZE, h = SNAKE_SIZE };
    }
}

enum Direction {
    UP,
    DOWN,
    LEFT,
    RIGHT
}
