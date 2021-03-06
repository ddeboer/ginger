{% with id.o.depiction as deps %}
{% with id.o.hasdocument as docs %}

    {% if deps or docs %}

        <div class="attached-media">

            <h2 class="attached-media__title">{_ Media _}</h2>

            {% if deps or docs %}

                {% with deps|is_not_a:"document"|make_list++docs|is_not_a:"document"|make_list as deps_list %}
                {% with deps|is_a:"document"|make_list++docs|is_a:"document"|make_list as docs_list %}

                    {% if deps_list %}
                        <div class="attached-media__media">
                            {% for item in deps_list %}
                                {% catinclude "attached-media/attached-media-thumb.tpl" item %}
                            {% endfor %}
                        </div>
                    {% endif %}

                    {% if docs_list %}
                         <div class="attached-media__documents">
                            <h3 class="attached-media__subtitle">{_ Documents _}</h3>
                            <ul>
                                {% for item in docs_list %}
                                    {% catinclude "attached-media/attached-media-thumb.tpl" item %}
                                {% endfor %}
                            </ul>
                        </div>
                    {% endif %}

                 {% endwith %}
                {% endwith %}
            {% endif %}

        </div>

    {% endif %}
{% endwith %}
{% endwith %}
