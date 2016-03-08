package display.two;

import massive.munit.Assert;
import massive.munit.AssertionException;
import massive.munit.Assert;
import mockatoo.Mockatoo.*;

using mockatoo.Mockatoo;

class TwoDimDisplayNodeContainerTests 
{
	private var container:TwoDimDisplayNodeContainer;
	private var node:TwoDimDisplayNode;

	public function new() 
	{
	}
	
	@Before
	public function setup():Void
	{
		container = new TwoDimDisplayNodeContainer();
		container.init();

		node = new TwoDimDisplayNode();
		node.init();
	}

	@After
	public function tearDown():Void
	{
		container = null;
	}

	@Test
	public function shouldAddChildNodeToTheContainer():Void
	{
		var retNode = container.addChild(node);
		Assert.areEqual(node, retNode);
		Assert.areEqual(container, node.parent);

		Assert.areEqual(1, container.numChildren);
		Assert.areEqual(node, container.children[0]);
	}

	@Test
	public function shouldRemoveNodeFromContainer():Void
	{
		container.addChild(node);
		var retNode:DisplayNode = container.removeChild(node);

		Assert.areEqual(node, retNode);
		Assert.isNull(node.parent);
		Assert.areEqual(0, container.numChildren);
	}

	@Test
	public function shouldGetChildAtIndex():Void
	{
		var node2:DisplayNode = new TwoDimDisplayNode();
		node2.init();
		container.addChild(node);
		container.addChild(node2);

		Assert.areEqual(node, container.getChildAt(0));
		Assert.areEqual(node2, container.getChildAt(1));
	}

	@Test
	public function shouldReturnNullIsChildDoesNotExistAtIndex():Void
	{
		Assert.isNull(container.getChildAt(0));
	}

	@Test
	public function shouldAddChildAtIndex():Void
	{
		var node2:DisplayNode = new TwoDimDisplayNode();
		node2.init();
		container.addChild(node);
		container.addChildAt(node2, 0);

		Assert.areEqual(node, container.getChildAt(1));
		Assert.areEqual(node2, container.getChildAt(0));
	}

	@Test
	public function shouldAddChildAtMaxIndexWhenIndexIsToBig():Void
	{
		var node2:DisplayNode = new TwoDimDisplayNode();
		node2.init();
		container.addChild(node);
		container.addChildAt(node2, 4);

		Assert.areEqual(node, container.getChildAt(0));
		Assert.areEqual(node2, container.getChildAt(1));
	}

	@Test
	public function shouldRemoveChildAtIndex():Void
	{
		var node2:DisplayNode = new TwoDimDisplayNode();
		node2.init();
		var node3:DisplayNode = new TwoDimDisplayNode();
		node3.init();
		container.addChild(node);
		container.addChild(node2);
		container.addChild(node3);
		Assert.areEqual(3, container.numChildren);
		var retNode = container.removeChildAt(0);

		Assert.areEqual(node, retNode);
		Assert.isNull(retNode.parent);
		Assert.areEqual(2, container.numChildren);
		Assert.areEqual(node2, container.getChildAt(0));
		Assert.areEqual(node3, container.getChildAt(1));
	}

	@Test
	public function shouldBeAbleToAddAContaineAsAChild():Void
	{
		var subcontainer:DisplayNodeContainer = new TwoDimDisplayNodeContainer();
		var retNode = container.addChild(subcontainer);

		Assert.areEqual(1, container.numChildren);
		Assert.areEqual(subcontainer, retNode);
		Assert.areEqual(retNode, container.children[0]);
		Assert.areEqual(container, subcontainer.parent);
	}
}
