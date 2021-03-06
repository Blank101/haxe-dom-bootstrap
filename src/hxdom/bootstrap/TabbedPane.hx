/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.bootstrap;

import hxdom.Elements;
import hxdom.html.Element;
import hxdom.html.Event;
import hxdom.html.Node;

using hxdom.BSTools;
using hxdom.DomTools;

typedef TabPane = {
	label:String,
	content:VirtualElement<Dynamic>
};

/**
 * Content switches based on the active tab.
 * 
 * @author Sam MacPherson
 */
class TabbedPane extends EDiv {
	
	/**
	 * The panes of this element.
	 */
	public var panes(default, null):Array<TabPane>;
	
	/**
	 * Marks the active tab.
	 */
	public var active(default, set):Null<Int>;
	
	var enav:EUnorderedList;
	var econtent:EDiv;

	public function new () {
		super();
		
		panes = new Array<TabPane>();
		
		enav = new EUnorderedList().nav(Tabs);
		append(enav);
		econtent = new EDiv().addClass("tab-content");
		append(econtent);
		
		enav.delegate(Tab, "click", onTabSelect);
	}
	
	public function clearPanes ():TabbedPane {
		active = null;
		while (panes.length > 0) {
			removePane(panes[0]);
		}
		
		return this;
	}
	
	public function addPane (pane:TabPane):TabbedPane {
		enav.append(new Tab(pane));
		pane.content.addClass("tab-pane");
		econtent.append(pane.content);
		panes.push(pane);
		
		return this;
	}
	
	public function removePane (pane:TabPane):TabbedPane {
		pane.content.remove();
		pane.content.removeClass("tab-pane");
		var index = 0;
		for (i in enav) {
			if (Std.is(i, Tab) && cast(i, Tab).pane == pane) {
				i.remove();
				if (active != null && active >= index) active--;
				break;
			}
			
			index++;
		}
		panes.remove(pane);
		
		return this;
	}
	
	function set_active (active:Null<Int>):Null<Int> {
		if (this.active != null) {
			cast(enav.node.childNodes[this.active].vnode(), VirtualElement<Dynamic>).removeClass("active");
			cast(econtent.node.childNodes[this.active].vnode(), VirtualElement<Dynamic>).removeClass("active");
		}
		
		this.active = active;
		
		if (active != null) {
			cast(enav.node.childNodes[active].vnode(), VirtualElement<Dynamic>).addClass("active");
			cast(econtent.node.childNodes[active].vnode(), VirtualElement<Dynamic>).addClass("active");
		}
		
		return active;
	}
	
	function onTabSelect (e:Event, tab:Tab):Void {
		e.preventDefault();
		
		for (i in 0 ... panes.length) {
			if (panes[i] == tab.pane) {
				active = i;
				break;
			}
		}
	}
	
}

class Tab extends EListItem {
	
	public var pane(default, null):TabPane;
	public var anchor(default, null):EAnchor;
	
	public function new (pane:TabPane):Void {
		super();
		
		this.pane = pane;
		
		append(anchor = new EAnchor()
			.setAttr("href", "#")
			.addText(pane.label)
		);
	}
	
}