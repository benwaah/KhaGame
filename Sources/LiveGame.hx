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

	private static inline var FRAME_SIZE:Float = 64;
	private static inline var FRAME_COUNT:Float = 3;
	private static inline var FRAME_TIME:UInt = 50;

	private var initialized:Bool = false;
	private var xPos:Float = 0;
	private var yPos:Float = 0;

	private var font:Font;
	private var wizard:Image;
	private var backbuffer:Image;

	private var currentTime:Float = 0;

	public function new() {
		backbuffer = Image.createRenderTarget(800, 600);

		setNewTime();

		Assets.loadFont("AnonymousProB", onFontLoad);
		Assets.loadImage("wizard", onWizardLoad);

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
		g.drawSubImage(wizard, 100, 100, xPos, yPos, FRAME_SIZE, FRAME_SIZE);
		g.end();

		g = framebuffer.g2;
		g.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		g.font = font;
		g.fontSize = 32;
		g.color = Color.Purple;
		g.drawString("Hello world!", 0, 0);
		g.end();

		var now:Float = Scheduler.time() * 1000;
		if (now < currentTime + FRAME_TIME)
			return;

		setNewTime();

		xPos += FRAME_SIZE;
		if (xPos > FRAME_SIZE * FRAME_COUNT)
		{
			xPos = 0;
			yPos += FRAME_SIZE;
		}
		if (yPos > FRAME_SIZE * FRAME_COUNT)
			yPos = 0;
	}

	private function onFontLoad(font:Font):Void {
		this.font = font;
		checkInitialization();
	}

	private function onWizardLoad(image:Image):Void {
		wizard = image;
		checkInitialization();
	}

	private inline function checkInitialization():Void {
		initialized = !((font == null) || (wizard == null));
	}

	private function setNewTime():Void {
		currentTime = Scheduler.time() * 1000;
	}
}
