import massive.munit.TestSuite;
import core.ObjectFactoryTests;
import display.two.TwoDimDisplayNodeContainerTests;

class TestSuite extends massive.munit.TestSuite
{
	public function new()
	{
		super();
		add(ObjectFactoryTests);
		add(TwoDimDisplayNodeContainerTests);
	}
}
