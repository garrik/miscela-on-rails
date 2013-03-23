(function(global){
	var miscela = {
		scroller: function headlinesScroller () {
			var headline_count;
			var headline_interval;
			var old_headline = 0;
			var current_headline = 0;
			var offset = 0;
			var $headlineWindow, $scrollingWindow, $headlines;
			var headlineWindowHeight;
			var headlineHeights = [];
			var headlinesHeight = 0;
			var msScrollingTimeSpan = 5000;

			this.init = function($elem) {
				$headlineWindow = $elem;
			};
			this.retrieveHeadlines = function(url) {
				var scrollHeadlines = this;
				$.ajax({
					url: url
					,success: function(data) {
						var html = _.template(miscela.templates.headline, data);
						// set news headlines
						$headlineWindow.html(html);
						headlineWindowHeight = $headlineWindow.height();
						// set scrolling
						$headlines = $headlineWindow.find(".headline");
						headline_count = $headlines.size();
						$headlines.each(function(i) {
							var headlineHeight = $(this).height() + 13; // box height+borders+margins
							this.style.top = headlinesHeight + "px"; // headline offset
							headlinesHeight += headlineHeight;
							headlineHeights.push(headlineHeight);
							if (headlinesHeight > headlineWindowHeight) {
								$(this).css({ opacity: 0 });
							}
						}).css("position", "absolute").css("width", "100%");
						headline_interval = setInterval(scrollHeadlines.rotate, msScrollingTimeSpan); //time in milliseconds
						// pause on mouse over
						/*
						$headlineWindow.hover(function() {
						clearInterval(headline_interval);
						}, function() {
						headline_interval = setInterval(headlineRotate, 5000);
						headlineRotate();
						});
						*/
					}
					// ,error: function(xhr, error){
						// var html = _.template(miscela.templates.headline, { 'headlines': miscela.headlines } );
						// $headlineWindow.html(html);
						// scrollHeadlines.startRotating();						
					// }
					,dataType: "json"
				});
			};
			this.startRotating = function(){
				headlineWindowHeight = $headlineWindow.height();
				// set scrolling
				$headlines = $headlineWindow.find(".headline");
				headline_count = $headlines.size();
				$headlines.each(function(i) {
					var headlineHeight = $(this).height() + 13; // box height+borders+margins
					this.style.top = headlinesHeight + "px"; // headline offset
					headlinesHeight += headlineHeight;
					headlineHeights.push(headlineHeight);
					if (headlinesHeight > headlineWindowHeight) {
						$(this).css({ opacity: 0 });
					}
				}).css("position", "absolute").css("width", "100%");
				headline_interval = setInterval(this.rotate, msScrollingTimeSpan); //time in milliseconds
				// pause on mouse over
				/*
				$headlineWindow.hover(function() {
				clearInterval(headline_interval);
				}, function() {
				headline_interval = setInterval(headlineRotate, 5000);
				headlineRotate();
				});
				*/
			}
			this.rotate = function headlineRotate() {
				current_headline = (old_headline + 1) % headline_count;
				var scrolling = headlineHeights[old_headline];
				var $this = $($headlines.get(old_headline));
				// scroll up each headline
				$headlines.each(function(i) {
					var currentTop = parseInt(this.style.top);
					var newTop = currentTop - scrolling;
					var height = $(this).height();
					var jsonAnimate;
					// headline which does not fit entirely in window remains invisible
					// until it does
					if (currentTop + height > headlineWindowHeight &&
						newTop + height < headlineWindowHeight) {
						jsonCss = { top: newTop + "px", opacity: "1" };
					}
					else {
						jsonCss = { top: newTop + "px" };
					}
					$(this).animate(jsonCss, "slow", function() {
						// the headline just disappeared over the top is moved under the bottom
						// then scrolls up to the last position
						if (parseInt(this.style.top) < 0) {
							var currentTop = parseInt(this.style.top);
							var newTop = headlinesHeight - scrolling;
							var height = $(this).height();
							var jsonAnimate;
							if (newTop + height < headlineWindowHeight) {
								jsonCss = { top: newTop + "px", opacity: "1" };
							}
							else {
								jsonCss = { top: newTop + "px" };
							}
							$(this).css("opacity", "0").css("top", headlineWindowHeight + "px").animate(jsonCss, "slow");
						}
					});
				});
				old_headline = current_headline;
			};
		}
		,areaLighter: function() {
			// Highlight active zone on mouse over
			$(".main .area").parent().each(function(){
				var areaContainer = $(this);
				areaContainer.hover(function(){
					areaContainer.children('.area').addClass("highlight");
				}, function(){
					if (!/main/.test(areaContainer.attr("class"))) {
						areaContainer.children('.area').removeClass("highlight");
					}
				});
			});
		}
		,templates: {
			headline: '<% _.each(headlines, function(headline) { %>'+
					'<div class="headline">'+
					  '<a href="<%= headline.url %>">'+
						'<div class="placeholder">'+
						  '<h4><%= headline.title %></h4>'+
						'</div>'+
					  '</a>'+
					  '<p><%= headline.content %></p>'+
					'</div>'+
				'<% }); %>'
			,splashScreen: '<div class="splash">'+
							'<img alt="Associazione Miscela" src="img/splash.jpg"/>'+
						'</div>'
		}
		,utils: {
			getViewportSize: function(){
				var size = { height: null, width: null };
				if (typeof window.innerWidth != 'undefined') {
					size.width = window.innerWidth;
					size.height = window.innerHeight;
				}
				else if (typeof document.documentElement != 'undefined' && 
					typeof document.documentElement.clientWidth != 'undefined' &&
					document.documentElement.clientWidth != 0) {
					size.width = document.documentElement.clientWidth;
					size.height = document.documentElement.clientWidth;
				}
				else {
					size.width = document.getElementsByTagName('body')[0].clientWidth;
					size.height = document.getElementsByTagName('body')[0].clientWidth;
				}
				return size;
			}
			,isViewportOrientationLandscape: function(size){
				if (size) {
					return size.height <= size.width;
				}
			}
			,createCookie: function createCookie(name,value,days) {
				if (days) {
					var date = new Date();
					date.setTime(date.getTime()+(days*24*60*60*1000));
					var expires = "; expires="+date.toGMTString();
				}
				else var expires = "";
				document.cookie = name+"="+value+expires+"; path=/";
			}
			,readCookie: function readCookie(name) {
				var nameEQ = name + "=";
				var ca = document.cookie.split(';');
				for(var i=0;i < ca.length;i++) {
					var c = ca[i];
					while (c.charAt(0)==' ') c = c.substring(1,c.length);
					if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
				}
				return null;
			}
		}
		,startIntro: function(){
			var splash = $(miscela.templates.splashScreen);
			$('body').prepend(splash);
			setTimeout(function(){
				//var splash = $('.splash');
				splash.animate({
					opacity: 0
				}, {
					duration: 2000
					,complete: function(){
						splash.remove();
					}
				});
				
			}, 2000);
		}
	};
	
	global.miscela = miscela;
})(window);

/* Google analitics */
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-16636362-1']);
_gaq.push(['_trackPageview']);
(function() {
	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();

/* Facebook */
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=234407633285730";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
