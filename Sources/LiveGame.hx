package;

import kha.Scaler;
import kha.Image;
import kha.Color;
import kha.Font;
import kha.Assets;
import kha.graphics2.Graphics;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class LiveGame {

	private var initialized:Bool = false;
	private var font:Font;
	private var grumpyCat:Image;
	private var backbuffer:Image;

	public function new() {
		backbuffer = Image.createRenderTarget(800, 600);

		Assets.loadFont("AnonymousProB", onFontLoad);
		Assets.loadImage("grumpy_cat_nope", onImageLoad);

		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
	}

	function update(): Void {
		
	}

	function render(framebuffer: Framebuffer): Void {
		if (!initialized)
			return;

		var g:Graphics = backbuffer.g2;
		g.begin();
		g.drawImage(grumpyCat, 0, 0);
		g.end();

		g = framebuffer.g2;
		g.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		g.font = font;
		g.fontSize = 32;
		g.color = Color.Purple;
		g.drawString("Hello world!", 0, 0);
		g.end();
	}

	private function onFontLoad(font:Font):Void {
		this.font = font;
		checkInitialization();
	}

	private function onImageLoad(image:Image):Void {
		grumpyCat = image;
		checkInitialization();
	}

	private inline function checkInitialization():Void {
		initialized = !((font == null) || (grumpyCat == null));
	}
}
