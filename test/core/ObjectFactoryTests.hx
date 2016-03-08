package core;

import minject.Injector;
import massive.munit.Assert;
import mockatoo.Mockatoo.*;

using mockatoo.Mockatoo;

class ObjectFactoryTests 
{
	private var objectFactory:ObjectFactory;
	private var injector:Injector;
	
	public function new() 
	{}
	
	@Before
	public function setup():Void
	{
		objectFactory = new ObjectFactory();
		injector = mock(Injector);

		ObjectFactory.injector = injector;
	}
	
	@After
	public function tearDown():Void
	{
		objectFactory = null;
		injector = null;
	}

	@Test
	public function shouldCreateAnInstanceFromAClass():Void
	{
		injector.getInstance(Sample).throws("error");
		var sample = objectFactory.createInstance(Sample);
		Assert.isNotNull(sample);
	}

	@Test
public function shouldCreateAnInstanceWithArgs():Void
	{
		injector.getInstance(SampleWithArgs).throws("error");
		var sampleBis:SampleWithArgs = objectFactory.createInstance(SampleWithArgs, ["test", 2]);
		Assert.areEqual("test", sampleBis.arg1);
		Assert.areEqual(2, sampleBis.arg2);
	}

	@Test
	public function shouldCreateObjectFromInjector():Void
	{
		var retVal:Sample = new Sample();
		injector.getInstance(Sample).returns(retVal);

		var sample:Sample = objectFactory.createInstance(Sample);
		Assert.isNotNull(sample);
		Assert.areEqual(retVal, sample);
	}

	@Test
	public function shouldInjectIntoCreatedClass():Void
	{
		injector.getInstance(Sample).throws("error");
		var sample = objectFactory.createInstance(Sample);
		Assert.isNotNull(sample);
		injector.injectInto(sample).verify();
	}

	@Test
	public function shouldCallInitOnBaseObjects():Void
	{
		injector.getInstance(SampleBase).throws("error");
		var sample:SampleBase = objectFactory.createInstance(SampleBase);
		Assert.isNotNull(sample);
		Assert.isTrue(sample.initialized);
	}
}

class Sample
{
	public function new()
	{}
}

class SampleWithArgs
{
	public var arg1:String;
	public var arg2:Int;

	public function new(arg1:String, arg2:Int)
	{
		this.arg1 = arg1;
		this.arg2 = arg2;
	}
}

class SampleBase implements BaseObject
{
	public var initialized:Bool = false;
	public function new()
	{

	}

	public function init():Void
	{
		initialized = true;
	}

	public function dispose():Void
	{
	}
}
