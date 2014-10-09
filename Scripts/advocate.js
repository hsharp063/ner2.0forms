$(document).ready(function() {
	
	// Enable mobile drop down navigation
	$("header nav ul:first").mobileMenu();
	
	// Flexslider
	$("#slider").flexslider({
		animation: "slide",    
		slideshow: true,     
		slideshowSpeed: 7000, 
		animationDuration: 500,  
		directionNav: true,  
		controlNav: false, 
		keyboardNav: true,
		touchSwipe: true,
		prevText: "v",
		nextText: "u",
		slideToStart: 0,
		pauseOnAction: true,
		pauseOnHover: false,
		controlsContainer: ".flexslider-container"
	});
	
	// Galleries
	$(".two_column li, .three_column li, .four_column li").each(function() {
		$("a", this).append('<div class="hover"></div>');
	});
	$(".two_column li, .three_column li, .four_column li").hover(function() {
		$("a", this).find(".hover").stop(true, true).fadeIn(400);
	}, function() {
		$("a", this).find(".hover").stop(true, true).fadeOut(400);
	});
	
	$("div.gallery_wrap a, .post a img, .two a img").hover(function() {
		$(this).animate({ 'opacity' : '0.6' }, 300);
	}, function() {
		$(this).stop(true,true).animate({ 'opacity' : '1' }, 300)
	});
	
	function initFancyboxes() {
		$("a.fancybox").fancybox({
			"transitionIn":			"elastic",
			"transitionOut":		"elastic",
			"easingIn":					"easeOutBack",
			"easingOut":				"easeInBack",
			"padding":					0,
			"speedIn":      		500,
			"speedOut": 				500,
			"hideOnContentClick":	"true",
			"overlayShow":        true
		});
	}
	initFancyboxes();
	
	// Gallery sorting
	var $filterType = $('ul.filter_list li.current a').attr('class');

	// Adding a data-id attribute. Required by the Quicksand plugin
	$(".gallery_thumbnails li").each(function(i){
      $(this).attr('data-id',i);
  });

	$(".gallery_thumbnails li a").each(function(i){
      $(this).attr("rel", "portfolio");
  });

 	// Clone applications to get a second collection
	var $data = $(".gallery_thumbnails").clone();

	$('.filter_list li a').click(function(e) {
		$(".filter_list li").removeClass("current");	
		// Use the last category class as the category to filter by.
		var filterClass = $(this).attr('class');
		$(this).parent().addClass('current');

		if (filterClass == 'all-items') {
			var $filteredData = $data.find('li');
		} else {
			var $filteredData = $data.find('li[data-type~=' + filterClass + ']');
		}
		$(".gallery_thumbnails").quicksand($filteredData, {
			duration: 600,
			adjustHeight: 'dynamic',
			useScaling: true
		}, function() { initFancyboxes(); });			
		return false;
	});
	
	// Form hints	
	$("label").inFieldLabels({ fadeOpacity: 0.4 });
	
	// Twitter widget
	$(".twitter_stream").tweet({
		username: "envato", // Customize your twitter username here
		count: 2,
		template: "<span class='icon social'>x</span> <div class='tweet_details'>{text}{time}</div>",
		retweets: false,
		loading_text: "loading tweets..."
	});
	
	// Drop down menus
	$("header nav ul li").hover(function() {
		if($(this).find("ul").size != 0) {
			$(this).find("ul:first").stop(true, true).fadeIn("fast");
		}
	}, function() {
		$(this).find("ul:first").stop(true, true).fadeOut("fast");
	});
	
	$("header nav ul li").each(function() {
		$("ul li:last a", this).css({ 'border' : 'none' });
	});
	
	// Tooltips
	$("a[rel=tipsy]").tipsy({fade: true, gravity: 's', offset: 5, html: true});
	
	$("ul.social li a").each(function() {
		var title_text = $(this).attr("title");
		$(this).tipsy({
				fade: true, 
				gravity: 'n', 
				offset: 5,
				title: function() {
					return title_text;
				}
		});
	});
	
	// Tabs
	$(".tabs").find(".pane:first").show().end().find("ul.nav li:first").addClass("current");
	$(".tabs ul.nav li a").click(function() {
		var tab_container = $(this).parent().parent().parent();
		$(this).parent().parent().find("li").removeClass("current");
		$(this).parent().addClass("current");
		$(".pane", tab_container).hide();
		$("#"+$(this).attr("class")+".pane", tab_container).show();
	});
	
	// Toggle lists
	$(".toggle_list ul li .title").click(function() {
		var content_container = $(this).parent().find(".content");
		if(content_container.is(":visible")) {
			content_container.slideUp("fast");
			$(this).find("a.toggle_link").text($(this).find("a.toggle_link").data("open_text"));
		} else {
			content_container.slideDown("fast");
			$(this).find("a.toggle_link").text($(this).find("a.toggle_link").data("close_text"));
		}
	});
	
	$(".toggle_list ul li .title").each(function() {
		$(this).find("a.toggle_link").text($(this).find("a.toggle_link").data("open_text"));
		if($(this).parent().hasClass("opened")) {
			$(this).parent().find(".content").show();
		}
	});
	
	// Contact form
	$("form#contact_form").submit(function() {
  	var this_form = $(this);
  	$.ajax({
  		type: 'post',
  		data: this_form.serialize(),
  		url: 'send_email.php',
  		success: function(res) {
  			if(res == "true") {
  				this_form.fadeOut("fast");
					$(".success").fadeIn("fast");
					$(".validation").fadeOut("fast");
  			} else {
  				$(".validation").fadeIn("fast");
  				this_form.find(".text").removeClass("error");
  				$.each(res.split(","), function() {
  					this_form.find("#"+this).addClass("error");
  				});
  			}
  		}
  	});
  });
	
});
// Twitter integration
(function(factory){if(typeof define==='function'&&define.amd)define(['jquery'],factory);else factory(jQuery)}(function($){$.fn.tweet=function(o){var s=$.extend({modpath:"twitter/",username:null,list_id:null,list:null,favorites:false,query:null,avatar_size:null,count:3,fetch:null,page:1,retweets:true,intro_text:null,outro_text:null,join_text:null,auto_join_text_default:"i said,",auto_join_text_ed:"i",auto_join_text_ing:"i am",auto_join_text_reply:"i replied to",auto_join_text_url:"i was looking at",loading_text:null,refresh_interval:null,twitter_url:"twitter.com",twitter_api_url:"api.twitter.com",twitter_search_url:"api.twitter.com",template:"{avatar}{time}{join}{text}",comparator:function(tweet1,tweet2){return tweet2["tweet_time"]-tweet1["tweet_time"]},filter:function(tweet){return true}},o);var url_regexp=/\b((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))/gi;function t(template,info){if(typeof template==="string"){var result=template;for(var key in info){var val=info[key];result=result.replace(new RegExp('{'+key+'}','g'),val===null?'':val)}return result}else return template(info)}$.extend({tweet:{t:t}});function replacer(regex,replacement){return function(){var returning=[];this.each(function(){returning.push(this.replace(regex,replacement))});return $(returning)}}function escapeHTML(s){return s.replace(/</g,"&lt;").replace(/>/g,"^&gt;")}$.fn.extend({linkUser:replacer(/(^|[\W])@(\w+)/gi,"$1<span class=\"at\">@</span><a href=\"http://"+s.twitter_url+"/$2\">$2</a>"),linkHash:replacer(/(?:^| )[\#]+([\w\u00c0-\u00d6\u00d8-\u00f6\u00f8-\u00ff\u0600-\u06ff]+)/gi,' <a href="http://'+s.twitter_search_url+'/search?q=&tag=$1&lang=all'+((s.username&&s.username.length==1&&!s.list)?'&from='+s.username.join("%2BOR%2B"):'')+'" class="tweet_hashtag">#$1</a>'),makeHeart:replacer(/(&lt;)+[3]/gi,"<tt class='heart'>&#x2665;</tt>")});function linkURLs(text,entities){return text.replace(url_regexp,function(match){var url=(/^[a-z]+:/i).test(match)?match:"http://"+match;var text=match;for(var i=0;i<entities.length;++i){var entity=entities[i];if(entity.url==url&&entity.expanded_url){url=entity.expanded_url;text=entity.display_url;break}}return"<a href=\""+escapeHTML(url)+"\">"+escapeHTML(text)+"</a>"})}function parse_date(date_str){return Date.parse(date_str.replace(/^([a-z]{3})( [a-z]{3} \d\d?)(.*)( \d{4})$/i,'$1,$2$4$3'))}function relative_time(date){var relative_to=(arguments.length>1)?arguments[1]:new Date();var delta=parseInt((relative_to.getTime()-date)/1000,10);var r='';if(delta<1){r='just now'}else if(delta<60){r=delta+' seconds ago'}else if(delta<120){r='about a minute ago'}else if(delta<(45*60)){r='about '+(parseInt(delta/60,10)).toString()+' minutes ago'}else if(delta<(2*60*60)){r='about an hour ago'}else if(delta<(24*60*60)){r='about '+(parseInt(delta/3600,10)).toString()+' hours ago'}else if(delta<(48*60*60)){r='about a day ago'}else{r='about '+(parseInt(delta/86400,10)).toString()+' days ago'}return r}function build_auto_join_text(text){if(text.match(/^(@([A-Za-z0-9-_]+)) .*/i)){return s.auto_join_text_reply}else if(text.match(url_regexp)){return s.auto_join_text_url}else if(text.match(/^((\w+ed)|just) .*/im)){return s.auto_join_text_ed}else if(text.match(/^(\w*ing) .*/i)){return s.auto_join_text_ing}else{return s.auto_join_text_default}}function build_api_request(){var modpath=s.modpath,count=(s.fetch===null)?s.count:s.fetch,defaults={include_entities:1};if(s.list){return{host:s.twitter_api_url,url:"/1.1/lists/statuses.json",parameters:$.extend({},defaults,{list_id:s.list_id,slug:s.list,owner_screen_name:s.username,page:s.page,count:count,include_rts:(s.retweets?1:0)})}}else if(s.favorites){return{host:s.twitter_api_url,url:"/1.1/favorites/list.json",parameters:$.extend({},defaults,{list_id:s.list_id,screen_name:s.username,page:s.page,count:count})}}else if(s.query===null&&s.username.length===1){return{host:s.twitter_api_url,url:"/1.1/statuses/user_timeline.json",parameters:$.extend({},defaults,{screen_name:s.username,page:s.page,count:count,include_rts:(s.retweets?1:0)})}}else{var query=(s.query||'from:'+s.username.join(' OR from:'));return{host:s.twitter_search_url,url:"/1.1/search/tweets.json",parameters:$.extend({},defaults,{q:query,rpp:count})}}}function extract_avatar_url(item,secure){if(secure){return('user'in item)?item.user.profile_image_url_https:extract_avatar_url(item,false).replace(/^http:\/\/[a-z0-9]{1,3}\.twimg\.com\//,"https://s3.amazonaws.com/twitter_production/")}else{return item.profile_image_url||item.user.profile_image_url}}function extract_template_data(item){var o={};o.item=item;o.source=item.source;o.name=item.from_user_name||item.user.name;o.screen_name=item.from_user||item.user.screen_name;o.avatar_size=s.avatar_size;o.avatar_url=extract_avatar_url(item,(document.location.protocol==='https:'));o.retweet=typeof(item.retweeted_status)!='undefined';o.tweet_time=parse_date(item.created_at);o.join_text=s.join_text=="auto"?build_auto_join_text(item.text):s.join_text;o.tweet_id=item.id_str;o.twitter_base="http://"+s.twitter_url+"/";o.user_url=o.twitter_base+o.screen_name;o.tweet_url=o.user_url+"/status/"+o.tweet_id;o.reply_url=o.twitter_base+"intent/tweet?in_reply_to="+o.tweet_id;o.retweet_url=o.twitter_base+"intent/retweet?tweet_id="+o.tweet_id;o.favorite_url=o.twitter_base+"intent/favorite?tweet_id="+o.tweet_id;o.retweeted_screen_name=o.retweet&&item.retweeted_status.user.screen_name;o.tweet_relative_time=relative_time(o.tweet_time);o.entities=item.entities?(item.entities.urls||[]).concat(item.entities.media||[]):[];o.tweet_raw_text=o.retweet?('RT @'+o.retweeted_screen_name+' '+item.retweeted_status.text):item.text;o.tweet_text=$([linkURLs(o.tweet_raw_text,o.entities)]).linkUser().linkHash()[0];o.tweet_text_fancy=$([o.tweet_text]).makeHeart()[0];o.user=t('<a class="tweet_user" href="{user_url}">{screen_name}</a>',o);o.join=s.join_text?t(' <span class="tweet_join">{join_text}</span> ',o):' ';o.avatar=o.avatar_size?t('<a class="tweet_avatar" href="{user_url}"><img src="{avatar_url}" height="{avatar_size}" width="{avatar_size}" alt="{screen_name}\'s avatar" title="{screen_name}\'s avatar" border="0"/></a>',o):'';o.time=t('<span class="tweet_time"><a href="{tweet_url}" title="view tweet on twitter">{tweet_relative_time}</a></span>',o);o.text=t('<span class="tweet_text">{tweet_text_fancy}</span>',o);o.reply_action=t('<a class="tweet_action tweet_reply" href="{reply_url}">reply</a>',o);o.retweet_action=t('<a class="tweet_action tweet_retweet" href="{retweet_url}">retweet</a>',o);o.favorite_action=t('<a class="tweet_action tweet_favorite" href="{favorite_url}">favorite</a>',o);return o}return this.each(function(i,widget){var list=$('<ul class="tweet_list">');var intro='<p class="tweet_intro">'+s.intro_text+'</p>';var outro='<p class="tweet_outro">'+s.outro_text+'</p>';var loading=$('<p class="loading">'+s.loading_text+'</p>');if(s.username&&typeof(s.username)=="string"){s.username=[s.username]}$(widget).unbind("tweet:load").bind("tweet:load",function(){if(s.loading_text)$(widget).empty().append(loading);$.ajax({dataType:"json",type:"post",async:false,url:s.modpath||"/twitter/",data:{request:build_api_request()},success:function(data,status){if(data.message){console.log(data.message)}var response=data.response;$(widget).empty().append(list);if(s.intro_text)list.before(intro);list.empty();if(response.statuses!==undefined){resp=response.statuses}else if(response.results!==undefined){resp=response.results}else{resp=response}var tweets=$.map(resp,extract_template_data);tweets=$.grep(tweets,s.filter).sort(s.comparator).slice(0,s.count);list.append($.map(tweets,function(o){return"<li>"+t(s.template,o)+"</li>"}).join('')).children('li:first').addClass('tweet_first').end().children('li:odd').addClass('tweet_even').end().children('li:even').addClass('tweet_odd');if(s.outro_text)list.after(outro);$(widget).trigger("loaded").trigger((tweets?"empty":"full"));if(s.refresh_interval){window.setTimeout(function(){$(widget).trigger("tweet:load")},1000*s.refresh_interval)}}})}).trigger("tweet:load")})}}));