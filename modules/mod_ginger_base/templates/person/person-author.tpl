{% with class|default:"person-author__text" as class %}

{% if id.o.author %}
    <div class="{{ class }}">{_ By: _}
    {% for author in id.o.author %}
        {% if author.is_visible %}
            <a href="{{ author.page_url }}" class="person-author">
            {% include "avatar/avatar.tpl" id=author %} {{ author.title }}{% if not forloop.last %}, {% endif %}
            </a>
        {% endif %}
    {% endfor %}
    </div>
{% endif %}

{% endwith %}