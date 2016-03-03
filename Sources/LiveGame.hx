package;

import kha.Color;
import kha.Font;
import kha.Assets;
import kha.graphics2.Graphics;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class LiveGame {

	private var font:Font;

	public function new() {
		Assets.loadFont("AnonymousPro", onFontLoad);
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
	}

	function update(): Void {
		
	}

	function render(framebuffer: Framebuffer): Void {
		var g:Graphics = framebuffer.g2;
		g.clear();
		g.font = font;
		g.fontSize = 32;
		g.color = Color.Purple;
		g.drawString("Hello world!", 0, 0);
		g.end();
	}

	private function onFontLoad(font:Font):Void {
		this.font = font;
	}
}
