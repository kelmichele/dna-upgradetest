$(function() {
    "use strict";

    // Global elements reused throughout
    var nav = $("#nav"),
        stick = $(".stick"),
        navIcon = $(".nav-icon"),
        mobileNav = $(".mobile-nav"),
        vMidEle = $(".v-mid");

    var body = $("body");


    function mobileStick() {
        var scrollPosition = $(window).scrollTop();
        if (scrollPosition > 10) {
            nav.addClass("mobile-stick").addClass("stuck");
            navIcon.addClass("scrolled");
        } else {
            nav.removeClass("mobile-stick").removeClass("stuck");
            navIcon.removeClass("scrolled");
        }
    }
    mobileStick(); // Initialize mobileStick on document ready


    function mobileMenuAlts() {
        $('nav ul li').each(function() {

            var $this = $(this);
            if ($this.children('ul').length > 0) {
                $this.addClass('hasChildren');
            }

        });
        $(".mobile-nav nav ul > li.hasChildren.parent_1 > a").on(
            "click",
            function() {
                $(this).next().toggleClass(
                    "menu-open fadeInDown");
                $(this).find("i").toggleClass(
                    "ion-ios-arrow-down").toggleClass(
                    "ion-ios-arrow-up");
                return false;
            });
        $(".mobile-nav nav ul li.hasChildren.parent_2 > a").on("click",
            function() {
                $(this).next().toggleClass(
                    "menu-open fadeInDown");
                $(this).find("i").toggleClass(
                    "ion-ios-arrow-down").toggleClass(
                    "ion-ios-arrow-up");
                return false;
            });
    }
    mobileMenuAlts(); // Initialize mobileMenuAlts on document ready & Always after navController()


    // ------------
    // $(window) scroll - Actions to take on scroll
    // ------------
    $(window).on("scroll", function() {
        mobileStick(); // Initialize mobilestick function
    });


}); // Last Exit Bracket
