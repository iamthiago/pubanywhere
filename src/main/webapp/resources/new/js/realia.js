$(document).ready(function() {
	InitConfig();
	
	InitCarousel();
    InitPropertyCarousel();
	InitOffCanvasNavigation();
	InitMap();
	InitImageSlider();
	InitAccordion();
	InitTabs();
    InitPalette();
    
    InitLast3();
    InitSendMail();
    registerPub();
    login();
    register();
});

function InitConfig() {
	$().maxlength();
	
	$('#loading').dialog({ autoOpen: false });
	$('#login').dialog({ autoOpen: false });
	$('#register').dialog({ autoOpen: false });
	$('#alreadyVoted').dialog({ autoOpen : false });
	
    $('.ellipsis').ellipsis({
        row: 2
    });
    
    $('#input-search').keydown(function() {
    	getAutoComplete('input-search', '#form-search', '#navlat', '#navlng');
	});
    
    $('#location_new').keydown(function() {
    	getAutoComplete('location_new', '#pubForm', '#lat', '#lng');
	});
    
    $('.star-detail').each(function() {
		$(this).raty({
			hints: ['', '', '', '', ''],
			path: '/resources/new/img',
			click : function(score, evt) {
				$('#setRating').val(score);
				$.post("/user/postPubReview", $("#reviewForm").serialize())
					.done(function(data) {
						if (data != null) {
							resultMessageModal(data);
						}
					});
			}
		});
	});
    
    $('.star-list').each(function() {
		$(this).raty({
			hints: ['', '', '', '', ''],
			path: '/resources/imgs',
			readOnly : true,
			halfShow: false,
			score : $(this).attr('data-number')
		});
	});
    
    $('.star-index').each(function() {
    	$(this).raty({
			hints: ['', '', '', '', ''],
			path: '/resources/imgs',
			readOnly : true,
			halfShow: false,
			score : $(this).attr('data-number')
		});
	});
    
    $('.star-topuser').each(function() {
		$(this).raty({
			hints: ['', '', '', '', ''],
			path: '/resources/imgs',
			readOnly : true,
			halfShow: false,
			score : $(this).attr('data-number')
		});
    });
		
    
	
}

function InitPalette() {
    if ($.cookie('palette') == 'true') {
        $('.palette').addClass('open');
    }

    $('.palette .toggle a').on({
        click: function(e) {
            e.preventDefault();
            var palette = $(this).closest('.palette');

            if (palette.hasClass('open')) {
                palette.animate({'left': '-195'}, 500, function() {
                    palette.removeClass('open');
                });
                $.cookie('palette', false)
            } else {
                palette.animate({'left': '0'}, 500, function() {
                    palette.addClass('open');
                    $.cookie('palette', true);
                });
            }
        }
    });

    if ($.cookie('color-variant')) {
        var link = $('.palette').find('a.'+ $.cookie('color-variant'));
        var file = link.attr('href');
        var klass = link.attr('class');

        $('#color-variant').attr('href', file);
        $('body').addClass(klass);
    }

    if ($.cookie('pattern')) {
        $('body').addClass($.cookie('pattern'));
    }

    if ($.cookie('header')) {
        $('body').addClass($.cookie('header'));
    }

    $('.palette a').on({
        click: function(e) {
            e.preventDefault();

            // Colors
            if ($(this).closest('div').hasClass('colors')) {
                var file = $(this).attr('href');
                var klass = $(this).attr('class');
                $('#color-variant').attr('href', file);

                if (!$('body').hasClass(klass)) {
                    $('body').removeClass($.cookie('color-variant'));
                    $('body').addClass(klass);
                }
                $.cookie('color-variant', klass)
            }
            // Patterns
            else if ($(this).closest('div').hasClass('patterns')) {
                var klass = $(this).attr('class');

                if (!$('body').hasClass(klass)) {
                    $('body').removeClass($.cookie('pattern'));
                    $('body').addClass(klass);
                    $.cookie('pattern', klass);
                }
            }
            // Headers
            else if ($(this).closest('div').hasClass('headers')) {
                var klass = $(this).attr('class');

                if (!$('body').hasClass(klass)) {
                    $('body').removeClass($.cookie('header'));
                    $('body').addClass(klass);
                    $.cookie('header', klass);
                }
            }
        }
    });
    $('.palette .reset').on({
        click: function() {
            $('body').removeClass($.cookie('color-variant'));
            $('#color-variant').attr('href', null);
            $.removeCookie('color-variant');

            $('body').removeClass($.cookie('pattern'));
            $.removeCookie('pattern');

            $('body').removeClass($.cookie('header'));
            $.removeCookie('header');
        }
    })
}

function InitPropertyCarousel() {
    $('.carousel.property .content li img').on({
        click: function(e) {
            var src = $(this).attr('src');
            var img = $(this).closest('.carousel.property').find('.preview img');
            img.attr('src', src);
            $('.carousel.property .content li').each(function() {
                $(this).removeClass('active');
            });
            $(this).closest('li').addClass('active');
        }
    })
}

function InitTabs() {
	$('.tabs a').click(function (e) {
  		e.preventDefault();
  		$(this).tab('show');
	});
}

function InitImageSlider() {
	$('.iosSlider').iosSlider({
		desktopClickDrag: true,
		snapToChildren: true,
		infiniteSlider: true,
		navSlideSelector: '.slider .navigation li',
		onSlideComplete: function(args) {
			if(!args.slideChanged) return false;

			$(args.sliderObject).find('.slider-info').attr('style', '');

			$(args.currentSlideObject).find('.slider-info').animate({
				left: '15px',
				opacity: '.9'
			}, 'easeOutQuint');
		},
		onSliderLoaded: function(args) {
			$(args.sliderObject).find('.slider-info').attr('style', '');

			$(args.currentSlideObject).find('.slider-info').animate({
				left: '15px',
				opacity: '.9'
			}, 'easeOutQuint');
		},
		onSlideChange: function(args) {
			$('.slider .navigation li').removeClass('active');
			$('.slider .navigation li:eq(' + (args.currentSlideNumber - 1) + ')').addClass('active');
		},
		autoSlide: true,
		scrollbar: true,
		scrollbarContainer: '.sliderContainer .scrollbarContainer',
		scrollbarMargin: '0',
		scrollbarBorderRadius: '0',
		keyboardControls: true
	});
}

function InitAccordion() {
    $('.accordion').on('show', function (e) {
        $(e.target).prev('.accordion-heading').find('.accordion-toggle').addClass('active');
    });

    $('.accordion').on('hide', function (e) {
        $(this).find('.accordion-toggle').not($(e.target)).removeClass('active');
    });
}

function InitOffCanvasNavigation() {
	$('#btn-nav').on({
		click: function() {
			$('body').toggleClass('nav-open');
		}
	})
}

function InitCarousel() {
	$('#main .carousel .content ul').carouFredSel({
		scroll: {
			items: 1
		},
		auto: false,
		next: {
    		button: '#main .carousel-next',
    		key: 'right'
		},
		prev: {
    		button: '#main .carousel-prev',
    		key: 'left'
		}
	});
}

function loadMap() {
	
	var positionSearch = new google.maps.LatLng($('#lat').val(), $('#lng').val());
	
	var mapOptions = {
      center: positionSearch,
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      scrollwheel: false
    };
    
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    var marker1 = new google.maps.Marker({
        position: positionSearch,
        map: map,
        title: "Your Current Search Location"
    });
	
	var infowindow = new google.maps.InfoWindow();

    var marker;
    
    function getWebsite(data, i){
    	var website;
    	
    	if (data[i].website == null || data[i].website == '') {
    		website = '';
		} else {
			website = '<img border="0" align="left" src="../resources/imgs/laptop.png">&nbsp; <a href="'+ String(data[i].website) +'" target="_blank" id="stringMaps">'+ String(data[i].website) +'</a>' + '<br>';
		}
    	
    	return website;
    }
    
    function getPhone(data, i){
    	var phone;
    	
    	if (data[i].phone == null || data[i].phone == '') {
    		phone = '';
		} else {
			phone = '<img border="0" align="left" src="../resources/imgs/phone.png">&nbsp;' + String(data[i].phone) + '<br>';
		}
    	
    	return phone;
    }
    
    function getEmail(data, i){
    	var email;
    	
    	if (data[i].email == null || data[i].email == '') {
    		email = '';
		} else {
			email = '<img border="0" align="left" src="../resources/imgs/mail.png">&nbsp; <a href="mailto:' + String(data[i].email) + '?subject=Info" id="stringMaps">' + String(data[i].email) + '</a>';
		}
    	
    	return email;
    }
    
    $.post('listNearPubs', {lat:$('#lat').val(), lng:$('#lng').val()}, function(data) {
    	var i=0;
    	for(i = 0; i < data.length; i++) {
    		marker = new google.maps.Marker({
        		position: new google.maps.LatLng(data[i].lat, data[i].lng),
        		map: map,
        		icon: "../resources/imgs/bar.png"
        	});
    		
    		google.maps.event.addListener(marker, 'click', (function(marker, i) {
        		return function() {
        			infowindow.setContent(
        					'<center>' + String(data[i].name) + '&nbsp <a href="/pubs/'+ String(data[i].pubId) + '"><img border="0" align="center" src="../resources/imgs/detail.png"></a></center>' +
        					getWebsite(data, i) + 
        					getPhone(data, i) + 
        					getEmail(data, i));
        			
        			infowindow.open(map, marker);
        		}
        	})(marker, i));
    	}
    }, "json");
}

function LoadMapProperty() {
    var locations = new Array(
        [$('#pubLat').val(),$('#pubLng').val()]
    );
    var markers = new Array();
    var mapOptions = {
        center: new google.maps.LatLng($('#pubLat').val(), $('#pubLng').val()),
        zoom: 14,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        scrollwheel: false
    };

    var map = new google.maps.Map(document.getElementById('property-map'), mapOptions);

    $.each(locations, function(index, location) {
    	var marker = new google.maps.Marker({
            position: new google.maps.LatLng(location[0], location[1]),
            map: map,
            icon: "../resources/imgs/bar.png"
        });
    });
}

function InitMap() {
    google.maps.event.addDomListener(window, 'load', loadMap);
    google.maps.event.addDomListener(window, 'load', LoadMapProperty);
}

function getAutoComplete(field, form, lat, lng) {
	
	var autocomplete;
	var input = null;
	
	if(document.getElementById(field) != null) {
		input = document.getElementById(field);
		input.focus();
	}
	
	autocomplete = new google.maps.places.Autocomplete(input);
	
	$(window).keydown(function(e){
		if(e.keyCode == 13) {
			e.preventDefault();
			return false;
		}
	});
	
	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		$(form).submit();
	});
	
	$(form).submit(function(e) {
		var place = autocomplete.getPlace();
		if (place == null || place.geometry == null) {
			//e.preventDefault();
			return;
		} else {
			$(lat).val(place.geometry.location.lat());
			$(lng).val(place.geometry.location.lng());
			
			if (field != 'input-search') {
				e.preventDefault();
			}
		}
	});
}

function registerPub() {
	$('#btnInsertPubAjax').click(function(e){
		e.preventDefault()
		showLoading();
		
		if ($('#image').val() == "") {
			$.post("/pubs/registerPub", $("form#pubForm").serialize())
				.done(function(data) {
					hideLoading();
					resultMessageModal(data);
					$('form#pubForm')[0].reset();
				});
		} else {
			var options = {
				url : '/pubs/registerPub',
				success : function(data) {
					hideLoading();
					resultMessageModal(data);
					$('form#pubForm')[0].reset();
				}
			};
			
			$("form#pubForm").ajaxSubmit(options);
		}
	});
}

function InitSendMail() {
	$('#sendMail').click(function(e){
		e.preventDefault();
		showLoading();
		$.post("/contact", $("form#contactAjaxForm").serialize())
			.done(function(data) {
				hideLoading();
				resultMessageModal(data);
				$('form#contactAjaxForm')[0].reset();
			});
	});
}

function InitLast3() {
	$.ajax({
    	url: '/pubs/last3',
    	type: 'GET',
    	success: function(data) {
        	for(var i = 0; i < data.length; i++) {
        		$('#last3').append('<div class="property"><div class="image pubImg75"><a href="/pubs/' + data[i].pubId + '"></a><img src="https://s3.amazonaws.com/pubanywhere/' + data[i].pubId + '" class="pubImgTopList" onError="imgError(this);"/></div><div class="wrapper"><div class="title"><h3><a href="/pubs/' + data[i].pubId + '">' + data[i].name + '</a></h3></div><div class="location">'+ data[i].country + '</div></div></div>');
        	}
    	}
    });
}

function login() {
	$('#btnLogin').click(function(e){
		$('#login').dialog({
			autoOpen: false,
			modal: true,
			draggable: false,
			resizable: false,
			height: 250,
			width: 550,
			title: 'Login'
		}).dialog('open');
	});
}

function register() {
	$('#btnRegistration').click(function(e){
		$('#register').dialog({
			autoOpen: false,
			modal: true,
			draggable: false,
			resizable: false,
			height: 390,
			width: 550,
			title: 'Register'
		}).dialog('open');
	});
}

function imgError(image){
	image.onerror = "";
    image.src = "";
    return true;
}













function FacebookLogin(redirect) {
	FB.getLoginStatus(function(response) {
		if (response.status === 'connected') {
			var access_token = response.authResponse.accessToken;
		    $.post("/facebook/auth/" + access_token)
		    	.done(function(data){
		    		revokeAppIfNeeded(data);
		    		//redirectToMe(data, redirect);
		    	});

		} else if (response.status === 'not_authorized') {
			// the user is logged in to Facebook,
			// but has not authenticated your app
		} else {
			// the user isn't logged in to Facebook.
		}
	});	
}

function redirectToMe(data, redirect) {
	if (data[0].key == 'FB_LOGIN_SUCCESS' && redirect == true) {
		$('form#meForm').submit();
	}
}

function revokeAppIfNeeded(data) {
	if (data[0].key == 'FB_REVOKE_ACCESS') {
		FB.api("/me/permissions","DELETE", function(response){
		    console.log('access revoked: ' + response); 
		});
	}
}	


















function resultMessageModal(data) {
	$('#resultMessageModal').empty();
	$('#resultMessageModal').append('<div>'+ data[1].value +'</div>');
	
	$('#resultMessageModal').dialog({
		dialogClass: "no-close",
		autoOpen: false,
		modal: true,
		draggable: false,
		resizable: false,
		height: 170,
		width: 550,
		title: data[0].value,
		buttons : [{
			text : "Ok",
			click : function() {
				$(this).dialog("close");
			}
		}]
	}).dialog('open');
}

function showLoading() {
	$('#loading').dialog({
		dialogClass: "no-close",
		closeOnEscape: false,
		autoOpen: false,
		modal: true,
		draggable: false,
		resizable: false,
		height: 250,
		width: 550
	}).dialog('open');
}

function hideLoading() {
	$('#loading').dialog("destroy");
	$('#loading').dialog({ autoOpen: false });
}