$(document).on('turbolinks:load', function() {

    // when conversation heading is clicked, toggle conversation
    $('body').on('click',
    	         '.launch-click',
    	         function(e) {
        e.preventDefault();
        var panel = $(this).parent();
        var panel_body = panel.find('.panel-body');

        panel_body.toggle(100, function() {
            var messages_visible = $('ul', this).has('li').length;
            // if window is collapsed, hide conversation menu options
            if ( panel_body.css('display') == 'none' ) {
                panel.find('.vis-panel .panel-body').hide();

            } else { // show conversation menu options
                panel.find('.vis-panel').show();

            }
        });

    });

});
