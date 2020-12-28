import hxd.Res;
import hxd.Window;
import utils.*;
import h2d.Font;
import ecs.*;
import level.*;

class Main extends hxd.App {
    public static var UpdateList = new List<Updatable>();
    public static var Paused : Bool = false;

    static function main() {
        new Main();
    }

    override function init() {
        hxd.Res.initEmbed();
        Window.getInstance().addEventTarget(OnEvent);

        var font : Font = hxd.res.DefaultFont.get();
        var tf = new h2d.Text(font);
        tf.text = "Hello World";

        var mainLevel : Level = new Level(Res.map1.entry, Res.cavestileset.toTile(), 8, 8);
        mainLevel.preRender();
        s2d = mainLevel.scene;

        s2d.addChild(tf);
    }

    override function update(dt:Float) {
        if(!Paused){
            for(gameObject in UpdateList){
                gameObject.update(dt);
            }
            ColliderSystem.CheckCollide();
        }
    }
    
    public function OnEvent(event : hxd.Event){
        switch(event.kind) {
            case EMove: MouseMoveEvent(event);
            case EPush: MouseClickEvent(event);
            case _:
        }
    }

    public function MouseMoveEvent(event : hxd.Event){
        //event.relX, event.relY
    }
    
    public function MouseClickEvent(event : hxd.Event){
        
    }
}