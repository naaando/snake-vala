
public class BoundingBox : Object {
    double height;
    double width;
    public double x {get;set;}
    public double y {get;set;}

    public BoundingBox (int h, int w) {
        height = h;
        width = w;
    }

    public bool collide (BoundingBox obj) {
        return (Math.fabs(obj.x - x) * 2 < (width + obj.width)) && (Math.fabs(obj.y - y) * 2 < (height + obj.height));
    }
}
