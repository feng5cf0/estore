(function(){  
	var ua=navigator.userAgent.toLowerCase();  
	var is=(ua.match(/\b(chrome|opera|safari|msie|firefox)\b/) || ['','mozilla'])[1];  
	var r='(?:'+is+'|version)[\\/: ]([\\d.]+)';  
	var v=(ua.match(new RegExp(r)) ||[])[1];  
	jQuery.browser.is=is;  
	jQuery.browser.ver=v;  
	jQuery.browser[is]=true;  
})(); 
(function (jQuery){
/*
 * jQuery Plugin - Messager
 * Author: corrie	Mail: corrie@sina.com	Homepage: www.corrie.net.cn
 * Copyright (c) 2008 corrie.net.cn
 * @license http://www.gnu.org/licenses/gpl.html [GNU General Public License]
 *
 * $Date: 2008-12-26 
 * $Vesion: 1.4
 @ how to use and example: Please Open demo.html
 */
	this.version = '@1.3';
	this.layer = {'width' : 200, 'height': 100};
	this.title = '信息提示';
	this.time = 4000;
	this.anims = {'type' : 'slide', 'speed' : 600};
	this.timer1 = null;
	
	this.inits = function(title, text,fn){
		if($("#jQuery_message").is("div")){ return; }
		$(document.body).prepend(
			'<div id="jQuery_message" style="border:#b9c9ef 1px solid;z-index:100;width:'+this.layer.width+'px;height:'+this.layer.height+'px;position:absolute; display:none;background:#cfdef4; bottom:0; right:0; overflow:hidden;">'+
				'<div style="border:1px solid #fff;border-bottom:none;width:100%;height:25px;font-size:12px;overflow:hidden;color:#1f336b;">'+
					'<span id="jQuery_message_close" style="float:right;padding:5px 0 5px 0;width:16px;line-height:auto;color:red;font-size:12px;font-weight:bold;text-align:center;cursor:pointer;overflow:hidden;">×</span>'+
					'<div style="padding:5px 0 5px 5px;width:100px;line-height:18px;text-align:left;overflow:hidden;">'+title+'</div>'+
					'<div style="clear:both;"></div>'+
				'</div>'+
				'<div style="padding-bottom:5px;border:1px solid #fff;border-top:none;width:100%;height:auto;font-size:12px;">'+
					'<div id="jQuery_message_content" style="margin:0 5px 0 5px;border:#b9c9ef 1px solid;padding:10px 0 10px 5px;font-size:12px;width:'+(this.layer.width-17)+'px;height:'+(this.layer.height-50)+'px;color:#1f336b;text-align:left;overflow:hidden;"><div id="jQuery_message_text"><font size="4" color="red">'+text+'</font></div></div>'+
				'</div>'+
			'</div>'
		);
		
		$("#jQuery_message_close").click(function(){		
			setTimeout('this.close()', 1);
		});
		$("#jQuery_message_content").click(function(){
			fn();			setTimeout('this.close()', 1);		});
		//$("#jQuery_message").hover(function(){
		//	clearTimeout(timer1);
		//	timer1 = null;
		//},function(){
		//	timer1 = setTimeout('this.close()', time);
			//alert(timer1);
		//});
	};
	this.show = function(title, text, time,fn){
		if($("#jQuery_message").is("div")){ return; }
		if(title==0 || !title)title = this.title;
		this.inits(title, text,fn);
		if(time>=0)this.time = time;
		switch(this.anims.type){
			case 'slide':$("#jQuery_message").slideDown(this.anims.speed);break;
			case 'fade':$("#jQuery_message").fadeIn(this.anims.speed);break;
			case 'show':$("#jQuery_message").show(this.anims.speed);break;
			default:$("#jQuery_message").slideDown(this.anims.speed);break;
		}
		if($.browser.is=='chrome'){
			setTimeout(function(){
				$("#jQuery_message").remove();
				this.inits(title, text,fn);
				$("#jQuery_message").css("display","block");
			},this.anims.speed-(this.anims.speed/5));
		}
		//$("#jQuery_message").slideDown('slow');
		this.rmmessage(this.time);
	};
	this.lays = function(width, height){
		if($("#jQuery_message").is("div")){ return; }
		if(width!=0 && width)this.layer.width = width;
		if(height!=0 && height)this.layer.height = height;
	};
	this.anim = function(type,speed){
		if($("#jQuery_message").is("div")){ return; }
		if(type!=0 && type)this.anims.type = type;
		if(speed!=0 && speed){
			switch(speed){
				case 'slow' : ;break;
				case 'fast' : this.anims.speed = 200; break;
				case 'normal' : this.anims.speed = 400; break;
				default:					
					this.anims.speed = speed;
			}			
		}
	};
	this.rmmessage = function(time){
		if(time>0){
			timer1 = setTimeout('this.close()', time);
			//setTimeout('$("#jQuery_message").remove()', time+1000);
		}
	};
	this.close = function(){
		switch(this.anims.type){
			case 'slide':$("#jQuery_message").slideUp(this.anims.speed);break;
			case 'fade':$("#jQuery_message").fadeOut(this.anims.speed);break;
			case 'show':$("#jQuery_message").hide(this.anims.speed);break;
			default:$("#jQuery_message").slideUp(this.anims.speed);break;
		};
		setTimeout('$("#jQuery_message").remove();', this.anims.speed);
		this.original();	
	};
	this.original = function(){	
		this.layer = {'width' : 200, 'height': 100};
		this.title = '信息提示';
		this.time = 4000;
		this.anims = {'type' : 'slide', 'speed' : 600};
	};
    jQuery.messager = this;
    return jQuery;
})(jQuery);