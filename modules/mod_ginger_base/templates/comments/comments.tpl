 {% if m.modules.enabled|index_of:"mod_comment" %}
    {% with m.comment.rsc[id] as comments %}
        <div id="comments" class="comments">

            <div id="comments-header" class="comments__header">
              {% include "comments/comments-header.tpl" id=id %}
            </div>

              <ul id="comments-list" class="comments__list">
                {% if comments %}
                    {% with m.rsc[id].creator_id as creator_id %}

                            {% for comment in comments %}
                                {% if comment.is_visible %}
                                   {% include "comment/comment.tpl" comment=comment%}
                               {% endif %}
                            {% endfor %}

                    {% endwith %}
                {% endif %}
              </ul>

          {% include "comments/_comments_form.tpl" id=id %}

        </div>
    {% endwith %}
{% endif %}
