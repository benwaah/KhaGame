package;

import kha.System;

class Main {
	public static function main()
	{
		System.init("LiveGame", 800, 600, function ()
		{
			new LiveGame();
		});
	}
}
