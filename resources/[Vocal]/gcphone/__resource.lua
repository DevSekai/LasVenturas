ui_page 'html/index.html'

files {
	'html/index.html',
	'html/static/css/app.css',
	'html/static/js/app.js',
	'html/static/js/manifest.js',
	'html/static/js/vendor.js',
	'html/static/config/config.json',
	
	-- Coque
	'html/static/img/coque/s8.png',
	'html/static/img/coque/iphonex.png',
	
	-- Background
	'html/static/img/background/back001.jpg',
	'html/static/img/background/back002.jpg',
	'html/static/img/background/back003.jpg',
	'html/static/img/background/back004.jpg',
	'html/static/img/background/back005.jpg',
	'html/static/img/background/back006.jpg',
	'html/static/img/background/back007.jpg',
	
	-- Icones
	'html/static/img/icons_app/call.png',
	'html/static/img/icons_app/contacts.png',
	'html/static/img/icons_app/sms.png',
	'html/static/img/icons_app/settings.png',
	'html/static/img/icons_app/menu.png',
	'html/static/img/icons_app/bourse.png',
	'html/static/img/icons_app/tchat.png',
	'html/static/img/icons_app/photo.png',
	'html/static/img/icons_app/bank.png',
	'html/static/img/icons_app/9gag.png',
	'html/static/img/icons_app/twitter.png',	
	
	'html/static/img/icons_app/lspd.png',
	'html/static/img/icons_app/lsmc.png',
	'html/static/img/icons_app/bennys.png',
	'html/static/img/icons_app/vigne.png',
	'html/static/img/icons_app/tabac.png',
	'html/static/img/icons_app/taxi.png',
	'html/static/img/icons_app/market.png',
	'html/static/img/icons_app/casino.png',
	'html/static/img/icons_app/avocat.png',
	'html/static/img/icons_app/alcool.png',
	'html/static/img/icons_app/boucher.png',
	'html/static/img/icons_app/ferme.png',
	'html/static/img/icons_app/weazel.png',
	'html/static/img/icons_app/gouv.png',
	'html/static/img/icons_app/dog.png',
	'html/static/img/icons_app/unicorn.jpg',
	'html/static/img/icons_app/tequila.jpg',


	'html/static/img/app_bank/logo_mazebank.jpg',

	'html/static/img/app_tchat/splashtchat.png',

	'html/static/img/twitter/bird.png',
	'html/static/img/twitter/default_profile.png',
	'html/static/sound/Twitter_Sound_Effect.ogg',

	'html/static/img/courbure.png',
	'html/static/fonts/fontawesome-webfont.ttf',

	'html/static/sound/ring.ogg',
	'html/static/sound/ring2.ogg',
	'html/static/sound/tchatNotification.ogg',
	'html/static/sound/Phone_Call_Sound_Effect.ogg',
}

client_script {
	"config.lua",
	"client/animation.lua",
	"client/client.lua",
	"client/photo.lua",
	"client/app_tchat.lua",
	"client/bank.lua",
	"client/twitter.lua"
}

server_script {
	'@mysql-async/lib/MySQL.lua',
	"config.lua",
	"server/server.lua",
	"server/app_tchat.lua",
	"server/twitter.lua"
}