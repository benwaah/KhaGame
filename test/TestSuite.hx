import massive.munit.TestSuite;

import core.ObjectFactoryTests;

class TestSuite extends massive.munit.TestSuite
{
	public function new()
	{
		super();
		add(ObjectFactoryTests);
	}
}
