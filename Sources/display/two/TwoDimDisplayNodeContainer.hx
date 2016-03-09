package display.two;

import display.two.TwoDimDisplayNode;

class TwoDimDisplayNodeContainer extends TwoDimDisplayNode implements DisplayNodeContainer
{
	public var numChildren(get, null):UInt;
	public var children(get, null):Array<DisplayNode>;

	public var _children:Array<DisplayNode>;

	public function new() {
		super();
	}

	override public function init():Void
	{
		super.init();
		_children = new Array<DisplayNode>();
	}

	override public function dispose():Void
	{
		super.dispose();
	}

	public function addChild(node:DisplayNode):DisplayNode
	{
		cast(node, TwoDimDisplayNode).set_parent(this);
		_children.push(node);
		return node;
	}

	public function addChildAt(node:DisplayNode, index:UInt):DisplayNode
	{
		cast(node, TwoDimDisplayNode).set_parent(this);
		_children.insert(index, node);
		return node;
	}

	public function getChildAt(index:UInt):DisplayNode
	{
		return _children[index];
	}

	public function removeChild(node:DisplayNode):DisplayNode
	{
		cast(node, TwoDimDisplayNode).set_parent(null);
		_children.remove(node);
		return node;
	}

	public function removeChildAt(index:UInt):DisplayNode
	{
		var node = _children[index];
		if (node != null)
		{
			cast(node, TwoDimDisplayNode).set_parent(null);
			_children.remove(node);
		}
		return node;
	}

	private function get_numChildren():UInt
	{
		return _children.length;
	}

	private function get_children():Array<DisplayNode>
	{
		return _children;
	}
}
