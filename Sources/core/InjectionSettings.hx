package core;

import display.Renderer;
import scenes.playground.Playground;
import display.two.kha.KhaTextfieldNode;
import display.TextfieldNode;
import display.DisplayNodeContainer;
import display.two.kha.KhaBitmapNode;
import display.BitmapNode;
import display.LayerManager;
import display.two.kha.Kha2DRenderer;
import display.two.kha.KhaSprite;
import display.layer.RenderableLayerManager;
import kha.Font;
import kha.Image;
import minject.Injector;

class InjectionSettings
{
	public var injector:Injector = new Injector();

	public function new(backbuffer:Image, fonts:Map<String, Font>)
	{
		ObjectFactory.injector = injector;

		var objectFactory:ObjectFactory = new ObjectFactory();
		injector.mapValue(ObjectCreator, objectFactory);
		injector.mapValue(kha.graphics2.Graphics, backbuffer.g2);

		var container:KhaSprite = objectFactory.createInstance(KhaSprite);
		var layerManager:RenderableLayerManager = objectFactory.createInstance(RenderableLayerManager, [container]);

		container = objectFactory.createInstance(KhaSprite);
		var renderer:Kha2DRenderer = objectFactory.createInstance(Kha2DRenderer, [container]);
		layerManager.addLayerByName("bottom", container, renderer);

		container = objectFactory.createInstance(KhaSprite);
		renderer = objectFactory.createInstance(Kha2DRenderer, [container]);
		layerManager.addLayerByName("middle", container, renderer);

		container = objectFactory.createInstance(KhaSprite);
		renderer = objectFactory.createInstance(Kha2DRenderer, [container]);
		layerManager.addLayerByName("top", container, renderer);

		injector.mapValue(LayerManager, layerManager);
		injector.mapValue(Renderer, layerManager);

		Kha2DRenderer.fonts = fonts;

		injector.mapClass(BitmapNode, KhaBitmapNode);
		injector.mapClass(DisplayNodeContainer, KhaSprite);
		injector.mapClass(TextfieldNode, KhaTextfieldNode);

		objectFactory.createInstance(Playground);
	}
}
