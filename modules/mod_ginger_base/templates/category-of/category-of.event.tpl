<div class="category-of--event cf">
    <time datetime="{{ id.start_date|date:"Y-F-jTH:i" }}" class="category-of__date">
        <i class="icon--{{ id.category.name }}"></i>
        {# TODO: Difficulties with date, when there is no date end, dont show and if there is no time dont show time, but there is this strange thing with the whole day flag (cityhub had the same problem) #}
        <span class="category-of__day">{{ id.date_start|date:"D" }}</span> {{ id.date_start|date:"j M Y" }} {% if id.date_end %}- {{ id.date_end|date:"D j M Y" }} {% endif %}
    </time>
    {% if not id.date_is_all_day %}
        <time datetime="{{ id.start_date|date:"Y-F-jTH:i" }}" class="category-of__time">
            {{ id.date_start|date:"H:i" }} {% if id.date_end %}- {{ id.date_end|date:"H:i" }}{% endif %}
        </time>
    {% endif %}
</div>
