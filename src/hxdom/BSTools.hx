/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom;

import hxdom.bootstrap.Dropdown;
import hxdom.bootstrap.Icon;
import hxdom.bootstrap.Modal;
import hxdom.Elements;
import hxdom.EventDispatcher;
import hxdom.html.Element;
import hxdom.html.Event;
import hxdom.html.Node;

using hxdom.DomTools;

enum DeviceSize {
	ExtraSmall;		//< 768px (Phones)
	Small;			//>= 768px (Tablets)
	Medium;			//>= 992px (Desktop)
	Large;			//>= 1200px (Desktop)
}

enum TextAlign {
	Left;
	Center;
	Right;
}

enum TextEmphasis {
	Muted;
	Primary;
	Success;
	Info;
	Warning;
	Danger;
}

enum ValidationState {
	Regular;
	Success;
	Warning;
	Error;
}

enum InputSize {
	Small;
	Medium;
	Large;
}

enum BSButtonType {
	Default;
	Primary;
	Success;
	Info;
	Warning;
	Danger;
	Link;
}

enum ButtonSize {
	ExtraSmall;
	Small;
	Medium;
	Large;
}

enum ImageBorder {
	Rounded;
	Circle;
	Thumbnail;
}

enum ButtonGroupAlign {
	Regular;
	Vertical;
	Justified;
}

enum NavStyle {
	Regular;
	Tabs;
	Pills;
}

enum NavAlign {
	Regular;
	Stacked;
	Justified;
}

enum NavBarStyle {
	Default;
	Inverse;
}

enum NavBarAlign {
	Regular;
	FixedTop;
	FixedBottom;
	StaticTop;
}

enum PaginationSize {
	Small;
	Medium;
	Large;
}

enum WellSize {
	Small;
	Medium;
	Large;
}

/**
 * Convienence methods for using Twitter Bootstrap.
 * 
 * @author Sam MacPherson
 */
class BSTools {
	
	/**
	 * Make this element into a container.
	 */
	public static function container<T:VirtualElement<Dynamic>> (e:T):T {
		e.addClass("container");
		
		return e;
	}
	
	/**
	 * Make this element into a grid row.
	 */
	public static function row<T:VirtualElement<Dynamic>> (e:T):T {
		e.addClass("row");
		
		return e;
	}
	
	/**
	 * Extra small column.
	 */
	public static function xs<T:VirtualElement<Dynamic>> (e:T, cols:Int):T {
		e.addClass("col-xs-" + cols);
		
		return e;
	}
	
	/**
	 * Small column.
	 */
	public static function sm<T:VirtualElement<Dynamic>> (e:T, cols:Int):T {
		e.addClass("col-sm-" + cols);
		
		return e;
	}
	
	/**
	 * Medium column.
	 */
	public static function md<T:VirtualElement<Dynamic>> (e:T, cols:Int):T {
		e.addClass("col-md-" + cols);
		
		return e;
	}
	
	/**
	 * Large column.
	 */
	public static function lg<T:VirtualElement<Dynamic>> (e:T, cols:Int):T {
		e.addClass("col-lg-" + cols);
		
		return e;
	}
	
	/**
	 * Extra small column offset.
	 */
	public static function xsoff<T:VirtualElement<Dynamic>> (e:T, cols:Int):T {
		e.addClass("col-xs-offset-" + cols);
		
		return e;
	}
	
	/**
	 * Small column offset.
	 */
	public static function smoff<T:VirtualElement<Dynamic>> (e:T, cols:Int):T {
		e.addClass("col-sm-offset-" + cols);
		
		return e;
	}
	
	/**
	 * Medium column offset.
	 */
	public static function mdoff<T:VirtualElement<Dynamic>> (e:T, cols:Int):T {
		e.addClass("col-md-offset-" + cols);
		
		return e;
	}
	
	/**
	 * Large column offset.
	 */
	public static function lgoff<T:VirtualElement<Dynamic>> (e:T, cols:Int):T {
		e.addClass("col-lg-offset-" + cols);
		
		return e;
	}
	
	/**
	 * Leading paragraph. Make this one stand out.
	 */
	public static function lead<T:EParagraph> (e:T):T {
		e.addClass("lead");
		
		return e;
	}
	
	/**
	 * Text align.
	 */
	public static function textAlign<T:VirtualElement<Dynamic>> (e:T, align:TextAlign):T {
		e.addClass(switch (align) {
			case Left: "text-left";
			case Center: "text-center";
			case Right: "text-right";
		});
		
		return e;
	}
	
	/**
	 * Apply different colors to text for emphasis.
	 */
	public static function emphasis<T:VirtualElement<Dynamic>> (e:T, type:TextEmphasis):T {
		e.addClass(switch (type) {
			case Muted: "text-muted";
			case Primary: "text-primary";
			case Success: "text-success";
			case Info: "text-info";
			case Warning: "text-warning";
			case Danger: "text-danger";
		});
		
		return e;
	}
	
	/**
	 * An abbreviation with a slightly smaller font size.
	 */
	public static function initialism<T:EAbbr> (e:T):T {
		e.addClass("initialism");
		
		return e;
	}
	
	/**
	 * Remove default styling from a list.
	 */
	public static function unstyled<T:VirtualElement<Dynamic>> (e:T):T {
		e.addClass("list-unstyled");
		
		return e;
	}
	
	/**
	 * Switch to a horizontal display.
	 * 
	 * Valid for:
	 * 		dl
	 * 		form
	 */
	public static function horizontal<T:VirtualElement<Dynamic>> (e:T):T {
		e.addClass(Reflect.getProperty(e.node, "tagName").toLowerCase() + "-horizontal");
		
		return e;
	}
	
	/**
	 * Make a pre scrollable.
	 */
	public static function scrollable<T:EPre> (e:T):T {
		e.addClass("pre-scrollable");
		
		return e;
	}
	
	/**
	 * Inline display.
	 * 
	 * Valid for:
	 * 		form
	 * 		ul
	 * 		ol
	 * 		input[checkbox]
	 * 		input[radio]
	 */
	public static function inLine<T:VirtualElement<Dynamic>> (e:T):T {
		e.addClass(switch (Reflect.getProperty(e.node, "tagName").toLowerCase()) {
			case "form": "form-inline";
			case "ul", "ol": "list-inline";
			case "input":
				switch (cast(e, EInput).node.type.toLowerCase()) {
					case "checkbox": "checkbox-inline";
					case "radio": "radio-inline";
					default: throw "Inline not defined for this type of input.";
				}
			default: throw "Inline not defined for this element.";
		});
		
		return e;
	}
	
	/**
	 * Group multiple elements into one form item.
	 */
	public static function formGroup<T:VirtualElement<Dynamic>> (e:T):T {
		e.addClass("form-group");
		
		return e;
	}
	
	/**
	 * Makes a form element stretch to 100% width.
	 */
	public static function formControl<T:VirtualElement<Dynamic>> (e:T):T {
		e.addClass("form-control");
		
		return e;
	}
	
	/**
	 * Non-editable input.
	 */
	public static function formControlStatic<T:EParagraph> (e:T):T {
		e.addClass("form-control-static");
		
		return e;
	}
	
	/**
	 * A help block.
	 */
	public static function help<T:VirtualElement<Dynamic>> (e:T):T {
		e.addClass("help-block");
		
		return e;
	}
	
	/**
	 * Make this element only applicable to screen readers.
	 * Does not display.
	 */
	public static function screenReaderOnly<T:VirtualElement<Dynamic>> (e:T):T {
		e.addClass("sr-only");
		
		return e;
	}
	
	/**
	 * Set this element and all descendants to show the given validation state.
	 * Will remove any previous validation states.
	 */
	public static function validation<T:VirtualElement<Dynamic>> (e:T, state:ValidationState):T {
		e.removeClass("has-success has-warning has-error");
		switch (state) {
			case Regular:
			case Success: e.addClass("has-success");
			case Warning: e.addClass("has-warning");
			case Error: e.addClass("has-error");
		};
		
		return e;
	}
	
	/**
	 * Set the size of the input.
	 */
	public static function inputSize<T:VirtualElement<Dynamic>> (e:T, size:InputSize):T {
		switch (size) {
			case Small: e.addClass("input-sm");
			case Medium:
			case Large: e.addClass("input-lg");
		};
		
		return e;
	}
	
	/**
	 * Style a button.
	 * 
	 * Valid for:
	 * 		button
	 * 		input[submit]
	 * 		input[button]
	 * 		a
	 */
	public static function button<T:VirtualElement<Dynamic>> (e:T, ?type:BSButtonType, ?size:ButtonSize):T {
		if (type == null) type = Default;
		
		e.addClass("btn");
		e.addClass(switch (type) {
			case Default: "btn-default";
			case Primary: "btn-primary";
			case Success: "btn-success";
			case Info: "btn-info";
			case Warning: "btn-warning";
			case Danger: "btn-danger";
			case Link: "btn-link";
		});
		if (size != null) {
			switch (size) {
				case ExtraSmall: e.addClass("btn-xs");
				case Small: e.addClass("btn-sm");
				case Medium:
				case Large: e.addClass("btn-lg");
			}
		}
		
		return e;
	}
	
	/**
	 * Turn an element into block level.
	 * 
	 * Valid for:
	 * 		button
	 * 		input[submit]
	 * 		input[button]
	 * 		a
	 */
	public static function block<T:VirtualElement<Dynamic>> (e:T):T {
		e.addClass("btn-block");
		
		return e;
	}
	
	/**
	 * Set image border style.
	 */
	public static function imageBorder<T:EImage> (e:T, border:ImageBorder):T {
		e.addClass(switch (border) {
			case Rounded: "img-rounded";
			case Circle: "img-circle";
			case Thumbnail: "img-thumbnail";
		});
		
		return e;
	}
	
	/**
	 * Set image border style.
	 */
	public static function clearfix<T:VirtualElement<Dynamic>> (e:T):T {
		e.addClass("clearfix");
		
		return e;
	}
	
	/**
	 * Set image border style.
	 */
	public static function visible<T:VirtualElement<Dynamic>> (e:T, size:DeviceSize):T {
		e.addClass(switch (size) {
			case ExtraSmall: "visible-xs";
			case Small: "visible-sm";
			case Medium: "visible-md";
			case Large: "visible-lg";
		});
		
		return e;
	}
	
	/**
	 * Set image border style.
	 */
	public static function hidden<T:VirtualElement<Dynamic>> (e:T, size:DeviceSize):T {
		e.addClass(switch (size) {
			case ExtraSmall: "hidden-xs";
			case Small: "hidden-sm";
			case Medium: "hidden-md";
			case Large: "hidden-lg";
		});
		
		return e;
	}
	
	/**
	 * Turn an element into a group of buttons.
	 */
	public static function buttonGroup<T:VirtualElement<Dynamic>>(e:T, ?align:ButtonGroupAlign, ?size:ButtonSize, ?dropup:Bool):T {
		if (align == null) align = Regular;
		
		if (align != null) {
			e.addClass(switch (align) {
				case Regular: "btn-group";
				case Vertical: "btn-group-vertical";
				case Justified: "btn-group btn-group-justified";
			});
		}
		if (size != null) {
			switch (size) {
				case ExtraSmall: e.addClass("btn-group-xs");
				case Small: e.addClass("btn-group-sm");
				case Medium:
				case Large: e.addClass("btn-group-lg");
			};
		}
		if (dropup) e.addClass("dropup");
		
		return e;
	}
	
	/**
	 * Makes element into a dropdown menu.
	 */
	public static function dropdown<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("dropdown");
		
		return e;
	}
	
	/**
	 * Links a button to a toggle the dropdown menu within this button group.
	 */
	public static function dropdownButton<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("dropdown-toggle");
		untyped e.node.dataset.toggle = "dropdown";
		
		return e;
	}
	
	/**
	 * Turns this span element into a caret character.
	 */
	public static function addCaret<T:VirtualElement<Dynamic>>(e:T):T {
		e.append(new ESpan().addClass("caret"));
		
		return e;
	}
	
	/**
	 * Float left.
	 */
	public static function pullLeft<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("pull-left");
		
		return e;
	}
	
	/**
	 * Float right.
	 */
	public static function pullRight<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("pull-right");
		
		return e;
	}
	
	/**
	 * Turn this element into a input group.
	 */
	public static function inputGroup<T:VirtualElement<Dynamic>>(e:T, ?size:InputSize):T {
		if (size == null) size = Medium;
		
		e.addClass("input-group");
		switch (size) {
			case Small: e.addClass("input-group-sm");
			case Medium: 
			case Large: e.addClass("input-group-lg");
		}
		
		return e;
	}
	
	/**
	 * Input group addon.
	 */
	public static function inputGroupAddon<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("input-group-addon");
		
		return e;
	}
	
	/**
	 * Input group addon.
	 */
	public static function inputGroupButtonAddon<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("input-group-btn");
		
		return e;
	}
	
	/**
	 * Create a navigation list.
	 */
	public static function nav<T:VirtualElement<Dynamic>>(e:T, ?style:NavStyle, ?align:NavAlign):T {
		e.addClass("nav");
		if (style != null) {
			switch (style) {
				case Regular:
				case Tabs: e.addClass("nav-tabs");
				case Pills: e.addClass("nav-pills");
			}
		}
		if (align != null) {
			switch (align) {
				case Regular:
				case Stacked: e.addClass("nav-stacked");
				case Justified: e.addClass("nav-justified");
			}
		}
		
		return e;
	}
	
	/**
	 * Primary navigation.
	 */
	public static function navbar<T:ENav>(e:T, ?style:NavBarStyle, ?align:NavBarAlign):T {
		e.addClass("navbar");
		if (style != null) {
			e.addClass(switch (style) {
				case Default: "navbar-default";
				case Inverse: "navbar-inverse";
			});
		}
		if (align != null) {
			switch (align) {
				case Regular:
				case FixedTop: e.addClass("navbar-fixed-top");
				case FixedBottom: e.addClass("navbar-fixed-bottom");
				case StaticTop: e.addClass("navbar-static-top");
			}
		}
		
		return e;
	}
	
	/**
	 * The website brand.
	 */
	public static function brand<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("navbar-brand");
		
		return e;
	}
	
	/**
	 * Add navbar specific classes to the element. Varies based on element type.
	 * 
	 * Valid for:
	 * 		button
	 * 		input[submit]
	 * 		input[button]
	 * 		a
	 * 		ul
	 * 		ol
	 * 		p
	 * 		span
	 * 		form
	 */
	public static function navbarElement<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass(switch (Reflect.getProperty(e.node, "tagName").toLowerCase()) {
			case "form": "navbar-form";
			case "ul", "ol": "navbar-nav";
			case "button": "navbar-btn";
			case "a": "navbar-link";
			case "p", "span": "navbar-text";
			case "input":
				switch (cast(e, EInput).node.type.toLowerCase()) {
					case "submit", "button": "navbar-btn";
					default: throw "Navbar element not defined for this type of input.";
				}
			default: throw "Navbar element not defined for this element.";
		});
		
		return e;
	}
	
	/**
	 * Navbar float left.
	 */
	public static function navbarLeft<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("navbar-left");
		
		return e;
	}
	
	/**
	 * Navbar float right.
	 */
	public static function navbarRight<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("navbar-right");
		
		return e;
	}
	
	/**
	 * Add an icon to an element.
	 */
	public static function addIcon<T:VirtualElement<Dynamic>>(e:T, type:IconType):T {
		e.append(new Icon(type));
		
		return e;
	}
	
	/**
	 * Turn a list into breadcrumbs.
	 * 
	 * Valid for:
	 * 		ul
	 * 		ol
	 */
	public static function breadcrumbs<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("breadcrumb");
		
		return e;
	}
	
	/**
	 * The active element in a list.
	 */
	public static function active<T:EListItem>(e:T):T {
		e.addClass("active");
		
		return e;
	}
	
	/**
	 * Disable an element. Behaviour varies depending on the element.
	 */
	public static function disabled<T:VirtualElement<Dynamic>>(e:T):T {
		switch (Reflect.getProperty(e.node, "tagName").toLowerCase()) {
			case "button", "command", "fieldset", "input", "keygen", "optgroup", "option", "select", "textarea": e.setAttr("disabled", true);
			default: e.addClass("disabled");
		}
		
		return e;
	}
	
	/**
	 * Turn a list into pagination.
	 * 
	 * Valid for:
	 * 		ul
	 * 		ol
	 */
	public static function pagination<T:VirtualElement<Dynamic>>(e:T, ?size:PaginationSize):T {
		e.addClass("pagination");
		if (size != null) {
			switch (size) {
				case Small: e.addClass("pagination-sm");
				case Medium: 
				case Large: e.addClass("pagination-lg");
			}
		}
		
		return e;
	}
	
	/**
	 * Turns a list into a pager.
	 * 
	 * Valid for:
	 * 		ul
	 * 		ol
	 */
	public static function pager<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("pager");
		
		return e;
	}
	
	/**
	 * The previous link in a pager.
	 */
	public static function previous<T:EListItem>(e:T):T {
		e.addClass("previous");
		
		return e;
	}
	
	/**
	 * The next link in a pager.
	 */
	public static function next<T:EListItem>(e:T):T {
		e.addClass("next");
		
		return e;
	}
	
	/**
	 * Call extra attention to this element by making it HUGE.
	 */
	public static function jumbotron<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("jumbotron");
		
		return e;
	}
	
	/**
	 * Often used on the title of an article or page.
	 */
	public static function pageHeader<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("page-header");
		
		return e;
	}
	
	/**
	 * Turn an element into a thumbnail.
	 */
	public static function thumbnail<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("thumbnail");
		
		return e;
	}
	
	/**
	 * Match the color of the parent alert container.
	 */
	public static function alertLink<T:EAnchor>(e:T):T {
		e.addClass("alert-link");
		
		return e;
	}
	
	/**
	 * Put the element in a well.
	 */
	public static function well<T:VirtualElement<Dynamic>>(e:T, ?size:WellSize):T {
		e.addClass("well");
		if (size != null) {
			switch (size) {
				case Small: e.addClass("well-sm");
				case Medium:
				case Large: e.addClass("well-lg");
			}
		}
		
		return e;
	}
	
	/**
	 * Turn a list into a list group.
	 */
	public static function listGroup<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("list-group");
		
		return e;
	}
	
	/**
	 * An item in a list group.
	 */
	public static function listGroupItem<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("list-group-item");
		
		return e;
	}
	
	/**
	 * A media object.
	 */
	public static function media<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("media");
		
		return e;
	}
	
	/**
	 * The image associated with the media object.
	 */
	public static function mediaObject<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("media-object");
		
		return e;
	}
	
	/**
	 * The body of the media object.
	 */
	public static function mediaBody<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("media-body");
		
		return e;
	}
	
	/**
	 * A media object heading.
	 */
	public static function mediaHeading<T:VirtualElement<Dynamic>>(e:T):T {
		e.addClass("media-heading");
		
		return e;
	}
	
}