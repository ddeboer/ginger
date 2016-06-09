{% if remark_id.is_visible %}
    <div class="remark-item {{ extraClasses }}" id="remark-{{ remark_id }}">
        <article>
            <div class="remark-item__author">
                    {% if remark_id.o.author as author %}
                        {% include "avatar/avatar.tpl" id=author %}
                    {% elseif remark_id.anonymous_name %}
                        {% image m.rsc.fallback.id mediaclass="avatar" class="avatar__image" %}
                        {% if remark_id.anonymous_email_visible %}
                             <a href="click.to.mail"  address="{{ remark_id.anonymous_email|mailencode }}" class="do_mail_decode">{{ remark_id.anonymous_name }}</a>
                        {% else %}
                            {{ remark_id.anonymous_name }}
                        {% endif %}
                    {% else %}
                        {% include "avatar/avatar.tpl" id=m.rsc[remark_id.creator_id] %}
                    {% endif %}
                <div class="remark-item__author__text">

                    {% if remark_id.o.author as author %}
                        <b>{{ author.title }}</b>
                    {% else %}
                        <b>{{ m.rsc[remark_id.creator_id].title }}</b>
                    {% endif %}
                    <time datetime="{{ remark_id.created|date:"Y-F-jTH:i" }}">{{ remark_id.created|date:"d F Y" }}</time>
                </div>
            </div>

            <div class="remark-item__content">
                <h3 class="remark-item__content__title">
                    {{ remark_id.title }}
                </h3>

                <div class="remark-item__content__body">
                    {{ remark_id.body|show_media }}
                </div>
                {% with remark_id.o.depiction as media %}

                {% with media|without_embedded_media:remark_id as deps %}
                    {% if deps %}
                        <div class="remark-item__media">
                            {% for dep in deps %}
                                {% if media|length > 1 %}
                                    {% catinclude "remark-media/remark-media.image.tpl" dep remark_id=remark_id %}
                                {% else %}
                                    {% catinclude "remark-media/remark-media.image.tpl" dep remark_id=remark_id first %}
                                {% endif %}
                            {% endfor %}
                        </div>
                    {% endif %}
                {% endwith %}
                {% endwith %}
            </div>

            {% if remark_id.is_editable and not id.o.hasremark|index_of:remark_id.id %}
                <div class="remark-item__buttons">
                    <a href="#" class="remark-edit" title="{_ edit _}">{_ edit _}</a>
                    <a href="#" class="remark-delete" title="{_ delete _}">{_ delete _}</a>
                </div>
            {% endif %}
        </article>
    </div>

    {% javascript %}
        $(document).trigger('remark:viewing');
    {% endjavascript %}

    {% wire name="rsc_delete_"++remark_id action={dialog_delete_rsc id=remark_id on_success={script script="$(document).trigger('remark:deleted', " ++ remark_id ++ ");"}} %}
{% endif %}
