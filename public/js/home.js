(function(){
	miscela.cookieExpirationDays = 120;
	$().ready(function() {
		var news = $("#scrollup");
		var headlines;
		
		// starting page 1st time -> start intro
		if (!miscela.utils.readCookie('miscela')) {
			miscela.startIntro();
		}

		if (news.length) {
			// headlines init
			headlines = new miscela.scroller();
			headlines.init(news);
			headlines.retrieveHeadlines("/headlines.aspx");

			// Append logout link for logged users
			$.ajax({
				url: "AmILoggedIn.aspx",
				context: document.getElementById("toolbar"),
				success: function(data) {
					if (data == "true") {
						$("#toolbar").append('<a rel="nofollow" href="Login.aspx?Logout=1">Logout</a>');
					}
				}
			});

			/*
			// Start sound for users coming from index.htm
			var sound = $("#audio-player");
			sound.jPlayer({
				ready: function() {
					var elem = this.element.jPlayer("setFile", "sound/Bella_ci_sta.mp3", "sound/Bella_ci_sta.ogg");
					if (/index\.htm|associazionemiscela\.it\/$/.test(document.referrer)) {
						elem.jPlayer("play");
					}
				},
				volume: 50,
				oggSupport: true
			});
			sound.jPlayer("onSoundComplete", function() {
				this.element.jPlayer("play"); // Auto-Repeat
			});
			*/
			// toggle audio
			$("a[href=#bella]").click(function() {
				if (sound.jPlayer("getData", "diag.isPlaying")) {
					sound.jPlayer("stop");
					this.innerHTML = "Bella! Ci sta!";
				} else {
					sound.jPlayer("play");
					this.innerHTML = "Ferma la musica";
				}
			});
			miscela.areaLighter();
			miscela.utils.createCookie('miscela', 'Miscela rulez', miscela.cookieExpirationDays);
		}
	});
})();