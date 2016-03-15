package scenes.playground;

import display.TextfieldNode;
import kha.Assets;
import kha.Image;
import display.BitmapNode;
import display.DisplayNodeContainer;
import core.BaseObject;
import display.LayerManager;
import core.ObjectCreator;

@:build(com.dongxiguo.continuation.Continuation.cpsByMeta(":async"))
class Playground implements BaseObject
{
	@inject
	public var objectCreator:ObjectCreator;
	@inject
	public var layerManager:LayerManager;

	public function new()
	{
	}

	public function init():Void
	{
		showPlayground(function():Void {});
	}

	public function dispose():Void
	{
	}

	@:async
	private function showPlayground():Void
	{
		var bottom:DisplayNodeContainer = layerManager.getLayerByName("bottom");
		var middle:DisplayNodeContainer = layerManager.getLayerByName("middle");
		var top:DisplayNodeContainer = layerManager.getLayerByName("top");

		var grumpycat:BitmapNode = objectCreator.createInstance(BitmapNode);
		var image:Image = @await Assets.loadImage("grumpycat");
		grumpycat.imageData = image;
		grumpycat.sx = 0;
		grumpycat.sy = 0;
		grumpycat.sw = image.realWidth;
		grumpycat.sh = image.realHeight;
		bottom.addChild(grumpycat);

		var wizard:BitmapNode = objectCreator.createInstance(BitmapNode);
		image = @await Assets.loadImage("wizard");
		wizard.imageData = image;
		wizard.sx = 0;
		wizard.sy = 0;
		wizard.sw = 64;
		wizard.sh = 64;
		middle.addChild(wizard);

		var hello:TextfieldNode = objectCreator.createInstance(TextfieldNode);
		hello.text = "hello world!";
		hello.fontName = "AnonymousProB";
		hello.fontSize = 48;
		hello.fontColor = 0xff006482;
		top.addChild(hello);

		wizard = objectCreator.createInstance(BitmapNode);
		wizard.imageData = image;
		wizard.x = 20;
		wizard.sx = 128;
		wizard.sy = 128;
		wizard.sw = 64;
		wizard.sh = 64;
		middle.addChild(wizard);
	}
}
