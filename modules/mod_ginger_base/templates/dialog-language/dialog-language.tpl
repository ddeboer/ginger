{% with m.translation.language_list_enabled as languages %}
    {% if languages %}
        {% block list %}
            <ul class="dialog-language">
                {% for code,lang in languages %}
                    {% if all or id|is_undefined or (lang.is_enabled and code|member:id.language) %}
                        <li class="{% if code == z_language %}active{% endif %}">
                            <a href="{% url language_select code=code p=raw_path %}">{{ lang.language }}</a>
                        </li>
                    {% endif %}
                {% endfor %}
            </ul>
        {% endblock %}
    {% endif %}
{% endwith %}
