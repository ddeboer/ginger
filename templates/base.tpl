<!DOCTYPE html>
<!--
 #################################
	   _      _      _     _ _
	__| |_ __(_) ___| |__ (_) |_
   / _` | '__| |/ _ \ '_ \| | __|
  | (_| | |  | |  __/ |_) | | |_
   \__,_|_|  |_|\___|_.__/|_|\__|

 ############ driebit ############

 geavanceerde internet applicaties

		 Oudezijds Voorburgwal 247
				 1012 EZ Amsterdam
					020 - 420 8449
				   info@driebit.nl
					www.driebit.nl

##################################
//-->
<!--[if IE 8 ]> <html lang="{{ z_language|default:"en"|escape }}" class="ie8"> <![endif]-->
<!--[if IE 9 ]> <html lang="{{ z_language|default:"en"|escape }}" class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="{{ z_language|default:"en"|escape }}">
<!--<![endif]-->
	<head>
		{% all include "_html_head.tpl" %}

		{% lib 
			"css/mod_ginger_base/screen.css"
		%}

		{% all include "_html_head_extra.tpl" %}
	</head>

	<body class="{{ id.category.name }} {% block body_class %}{% endblock %}">
		{% block nav %}
			{# include "mod_ginger_nav.tpl" #}
		{% endblock %}
		
		{% block content %}{% endblock %}

		{% block footer %}
			{# include "_footer.tpl" #}
		{% endblock %}

		{% all include "_js_include.tpl" %}
	</body>
</html>
