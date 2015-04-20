<nav class="main-nav do_ginger_default_toggle_navigation do_ginger_default_toggle_search">
    <a href="/" class="main-nav__logo">
        {% block mainNavLogo %}
            <img src="/lib/images/logo_ginger.png"/>
        {% endblock %}
    </a>

    <div class="main-nav__off-canvas">
        {% menu class="main-nav__pages" %}


        <ul class="main-nav__actions">
            <li>
                {% optional include "_nav_logon.tpl" %}
            </li>
            <li>
                {% optional include "_nav_admin.tpl" %}
            </li>
            <li>
                {% optional include "_nav_profile.tpl" %}
            </li>
        </ul>

    </div>

    <ul class="main-nav__actions">
        <li class="main-nav__toggle-search"><a href="#main-nav__search-form">Zoek</a></li>
        <li class="main-nav__toggle-menu"><a href="#navigation">Toggle menu</a></li>
    </ul>

    <div class="main-nav__search">
        {% include "_search_form.tpl" identifier="main-nav" %}
        <button class="main-nav__search__close-btn" type="button">Sluiten</button>
    </div>

    {#
    <form id="main-nav__search-form" class="main-nav__search-form" role="search" action="{% url search %}" method="get">
        <input type="hidden" name="qsort" value="{{ q.qsort|escape }}" />
        <input type="hidden" name="qcat" value="{{ q.qcat|escape }}" />
        <input type="text" class="main-nav__search-form__query do_suggestions" name="qs" value="{{q.qs|escape}}" autocomplete="off" placeholder="Zoeken...">
        {% wire name="show_suggestions"
            action={update target="search-suggestions" template="_search_suggestions.tpl"}
        %}
        <div id="search-suggestions" class="search-suggestions"></div>
    </form>
    #}


</nav>
