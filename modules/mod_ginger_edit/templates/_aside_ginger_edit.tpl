<aside>

    {% if id.is_editable %}
        {% include "aside-connection/aside-add-connection.tpl" id=id cat="keyword" predicate="subject" %}
        {% include "aside-connection/aside-add-connection.tpl" id=id cat="person" predicate="author" title=_'Author' %}
        {% include "aside-connection/aside-add-connection.tpl" id=id cat="location" predicate="located_in" title=_'Location' %}
        {# include "_admin_edit_content_date_range.tpl" show_header is_editable #}
    {% endif %}
	
    {% include "aside-connection/aside-show-connection.tpl" id=id predicate="haspart" title=_"Part of" %}
    {% include "aside-connection/aside-show-connection.tpl" id=id predicate="about" title=_"About" direction="out" %}
    {% include "aside-connection/aside-show-connection.tpl" id=id predicate="blogposting" title=_"Posted in" direction="out" %}
	
</aside>