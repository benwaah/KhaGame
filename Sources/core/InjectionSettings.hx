package core;

import kha.Font;
import kha.Framebuffer;
import kha.Image;
import minject.Injector;

class InjectionSettings
{
	public function new(backbuffer:Image, framebuffer:Framebuffer, fonts:Map<String, Font>)
	{
		var injector:Injector = new Injector();
		ObjectFactory.injector = injector;

		var objectFactory:ObjectFactory = new ObjectFactory();
		injector.mapValue(ObjectCreator, objectFactory);
	}
}
