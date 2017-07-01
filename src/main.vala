
public class Snake : Object {
    RendererManager renderer;

    public Snake () {
        renderer = RendererManager.getInstance ();
        var snake = new Player ();
        var spawner = new Spawner (renderer);
        renderer.draw (snake);
        renderer.draw (spawner);
        renderer.set_background_color (0, 0, 50);
        renderer.run ();
    }

    public static int main (string[] args) {
        var app = new Snake ();
        return 0;
    }
}
