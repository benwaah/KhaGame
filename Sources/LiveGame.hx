package;

import kha.System;
import kha.Scaler;
import kha.Scheduler;
import display.Renderer;
import core.InjectionSettings;
import kha.Image;
import kha.Font;
import kha.Assets;
import kha.Framebuffer;

@:build(com.dongxiguo.continuation.Continuation.cpsByMeta(":async"))
class LiveGame
{
	@inject
	public var renderer:Renderer;

	private var initialized:Bool = false;

	private var fonts:Map<String, Font>;
	private var backbuffer:Image;
	private var framebuffer:Framebuffer;

	public function new()
	{
		backbuffer = Image.createRenderTarget(800, 600);
	}

	public function update():Void
	{
		var g = backbuffer.g2;
		g.begin();
		renderer.render();
		g.end();

		g = framebuffer.g2;
		g.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		g.end();
	}

	public function render(framebuffer:Framebuffer): Void
	{
		this.framebuffer = framebuffer;

		if (initialized)
			return;

		initialized = true;

		loadFonts(function ():Void {
			var settings = new InjectionSettings(backbuffer, fonts);
			settings.injector.injectInto(this);
			Scheduler.addTimeTask(this.update, 0, 1 / 60);
		});
	}

	@:async
	private function loadFonts():Void
	{
		fonts = new Map<String, Font>();
		fonts.set("AnonymousProB", @await Assets.loadFont("AnonymousProB"));
	}
}
