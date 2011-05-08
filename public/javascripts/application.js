$(document).ready(function(){

    $("#form_blog textarea, #form_blog input[type=text], #form_blog input[type=password]").css("width","100%").addClass("champ");

    $("#form_blog_1 textarea, #form_blog_1 input[type=text], #form_blog_1 input[type=password]").css("width","100%").addClass("champ");

    $("#groupe_bouton").children().addClass("bouton");

    $(".bouton").button();

    $(".tableau").attr("cellpadding", "3px").attr("cellspacing", "1px");

    $(".tableau tr").addClass("tableau_ligne");

    $("[type_bouton=recherche]").button({
        icons: {
            primary: 'ui-icon-gear'
        }
    });

});

//ROUNDIES
//universel.css
DD_roundies.addRule('.question', '0 10px 0 10px', true);