package;

import kha.System;

class Main {
	public static function main() {
		System.init("LiveGame", 640, 480, function () {
			new LiveGame();
		});
	}
}
