
public class Label : Object, Drawable {
    int size;
    string _text;

    public Vector2 pos {get; set;default = new Vector2 (0, 0);}
    public float scale {get;set;default=1;}

    public string text {
        get {
            return _text;
        }
        set {
            _text = value;
            texture = null;
        }
    }

    public string font {
        get {
            return _font.get_family_name ();
        }
        set {
            _font = new SDLTTF.Font (value, size);
        }
    }

    SDL.Video.Texture texture;

    SDL.Video.Color color;
    SDLTTF.Font _font;

    public Label (string text, int size = 12, SDL.Video.Color? color = null) {
        this.text = text;
        this.size = size;
        this.color = (color != null)? color : SDL.Video.Color () { r = 255, g = 255, b = 255, a = 0};
        _font = new SDLTTF.Font ("font.ttf", size);
    }

    public void draw (SDL.Video.Renderer renderer) {
        if (texture == null) {
            texture = SDL.Video.Texture.create_from_surface(renderer, to_surface ());
        }
        // Alignment halign and valign
        renderer.copy(texture, null, { pos.x, pos.y, (uint)(scale*size*text.length), (uint)(size*scale)});
    }

    public SDL.Video.Surface? to_surface () {
        return _font.render (text, color);
    }

    // public Texture? to_texture () {
    //     return
    // }
}
