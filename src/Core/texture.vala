
// Texture wrapper class
namespace Moon {

    public class Texture : GLib.Object {
        SDL.Video.Texture _texture;
        SDL.Video.Surface surface;
        public uint8 _alpha;
        public int height;
        public int width;

        public unowned SDL.Video.Renderer renderer {get; set;}
        public SDL.Video.Texture texture {
            get {
                return _texture;
            }
        }


        public Texture.from_file (SDL.Video.Renderer renderer, string path) {
            surface = SDLImage.load (path);
            this.renderer = renderer;
            height = surface.h;
            width = surface.w;
            reload_texture ();
        }

        public void set_colorkey (int flag, uint8 r, uint8 b,uint8 g) {
            surface.set_colorkey (flag, surface.format.map_rgb(r, b, g));
            reload_texture ();
        }

        public void set_colormod (uint8 r, uint8 b, uint8 g) {
            _texture.set_color_mod (r, b, g);
        }

        public uint8 alpha {
            get {
                return _alpha;
            }
            set {
                _alpha = value;
                print (_alpha.to_string()+"\n");
                _texture.set_alpha_mod (_alpha);
            }
        }

        public bool reload_texture () {
            // TODO: Implement proper error throwing
            if (renderer == null || surface == null) {
                return false;
            }

            _texture = SDL.Video.Texture.create_from_surface (renderer, surface);

            return true;
        }

        public void render (int x = 0, int y = 0, SDL.Video.Rect? rect = null) {
            SDL.Video.Rect renderQuad = {x, y, width, height};
            renderer.copy(texture, rect, renderQuad);
        }
    }

}
