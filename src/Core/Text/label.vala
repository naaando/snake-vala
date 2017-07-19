
public class Label : Object, Drawable {
    int size;
    string _text;
    Vector2 _pos;
    float _scale;
    SDL.Video.Texture texture;
    SDL.Video.Color color;
    SDLTTF.Font _font;

    public Vector2 pos {
        get {
            return _pos;
        }
        set {
            _pos = value;
            recalculate ();
        }
        default = new Vector2 (0, 0);
    }

    public float scale {
        get {
            return _scale;
        }
        set {
            _scale = value;
            recalculate ();
        }
        default=1;
    }

    public string text {
        get {
            return _text;
        }
        set {
            _text = value;
            recalculate ();
        }
    }

    public string font {
        get {
            return _font.get_family_name ();
        }
        set {
            _font = new SDLTTF.Font (value, size);
            recalculate ();
        }
    }

    public enum Alignment {
        LEFT,
        CENTER,
        RIGHT,
        JUSTIFY
    }

    public Alignment alignment {get;set;default = Alignment.LEFT;}

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

    void recalculate () {
        texture = null;

        switch (alignment) {
            case Alignment.CENTER:
                _pos = new Vector2 (_pos.x-(int)((scale*size*text.length)/2), _pos.y);
                break;
            case Alignment.RIGHT:
                _pos = new Vector2 (_pos.x-(int)(scale*size*text.length), _pos.y);
                break;
        }
    }
}
