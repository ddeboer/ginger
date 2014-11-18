<div class="tab-pane {% if is_active %}active{% endif %}" id="{{ tab }}-find">
	<p>{_ Find an existing page to connect _}</p>

	<form id="dialog-connect-find" class="row">
        <input type="hidden" name="find_category" id="find_category" value="{{ cat }}">
        <div class="col-md-8">
		    <input name="find_text" type="text" value="" placeholder="{_ Type text to search _}" class="do_autofocus form-control" />
        </div>

        <div class="col-md-4">
            {% block category_select %}
	        {% endblock %}
        </div>
	</form>

	<div id="dialog-connect-found" class="do_feedback"
		data-feedback="trigger: 'dialog-connect-find', delegate: 'mod_admin'">
	</div>
</div>

{% javascript %}
    $('#dialog-connect-find').change();
    
     $('a[data-toggle="tab"]').click(function(){
           var id = $(this).data('id');
           console.log(id);
           $('#find_category').val(id);
           $('#dialog-connect-find').change();
        });

    $("#dialog-connect-found").on('click', '.thumbnail', function() {
        z_notify("admin-connect-select", { 
        z_delegate: "mod_admin", 
        select_id: $(this).data('id'),
        predicate: '{{ predicate }}',
        subject_id: '{{ subject_id }}',
        object_id: '{{ object_id }}',
        callback: '{{ callback }}',
        language: '{{ language }}'
        });
    });

{% endjavascript %}
