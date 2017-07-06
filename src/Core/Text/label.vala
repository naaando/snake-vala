
public class Label : Object, Drawable {
    public string text {get; set;}
    public string font {
        get {
            return _font.get_family_name ();
        }
        set {
            _font = new SDLTTF.Font (value, 12);
        }
    }

    SDL.Video.Color color;
    SDLTTF.Font _font;

    public Label (string text, SDL.Video.Color? color = null) {
        this.text = text;
        this.color = (color != null)? color : SDL.Video.Color () { r = 255, g = 255, b = 255, a = 0};
        _font = new SDLTTF.Font ("font.ttf", 12);
    }

    public void draw (SDL.Video.Renderer renderer) {
        var texture = SDL.Video.Texture.create_from_surface(renderer, to_surface ());
        renderer.copy(texture, null, {GameEngine.SCREEN_WIDTH/2-50, 0, 100, 60});
    }

    public SDL.Video.Surface? to_surface () {
        return _font.render (text, color);
    }

    // public Texture? to_texture () {
    //     return
    // }
}
