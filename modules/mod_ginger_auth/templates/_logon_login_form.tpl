{# Override template to use Ginger delegate for handling post-logon continuation actions #}

{% if use_wire %}
    {#
        Use a wired postback when we are not using the default logon page with
        its logon_controller. 
    #}
    {% wire id="logon_form" type="submit" postback={logon action=action} delegate="mod_ginger_auth" %}
{% endif %}
<form id="logon_form" method="post" action="postback" class="z_logon_form" target="logonTarget">
    <input type="hidden" name="page" value="{{ page|escape }}" />
    <input type="hidden" name="handler" value="username" />
    
    {% include form_fields_tpl %}
</form>

{% javascript %}
$("#logon_form form").unmask();
{% endjavascript %}
