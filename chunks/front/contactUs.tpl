<script src="js/jquery-3.1.1.min.js"></script>
  <div class="row">
    <form class="col s12" id="contactForm">
    <input type="hidden" name="operation" value="add">
      <div class="row">
      
        <div class="input-field col s6">
          <input placeholder="Placeholder" id="name" name="name" type="text" class="validate">
          <label for="name">First Name</label>
        </div>

        <div class="input-field col s6">
          <input placeholder="Placeholder" id="email" name="email" type="email" class="validate">
          <label for="email">Email</label>
        </div>

        <div class="input-field col s6">
          <input placeholder="Placeholder" id="phone" name="phone" type="text" class="validate">
          <label for="phone">Phone</label>
        </div>

        <div class="input-field col s6">
          <textarea placeholder="Placeholder" id="message" name="message" type="text" class="validate"></textarea>
          <label for="message">Message</label>
        </div>
    
      <div class="large-12"> 
        <div class="large-8 large-offset-4 medium-8 medium-offset-4 small-12 columns">
        	<a href="#" class="submit-btn" id="submitBtn"> submit </a>
        </div>
    </div>
    </form>
  </div>
        

<script type="text/javascript">



	$('#submitBtn').click(function(event) {
		event.preventDefault();

            isValid = true;

            //form validations
    		$('#contactForm .validate').each(function () {
    			if ($.trim($(this).val()) == "") {
    				swal({
                        title: "Required Fields",
						text: "Fields has * next to it are required",
						type: "error",
                        confirmButtonText: "Close"
                    });
    				isValid = false;
    				return;
    			}
    		});

            if (!isValid) return;

			//submit the form after validations
            $("#contactForm").submit();
		
			});


	$('#contactForm').submit(function() {
		event.preventDefault();

		var values = new FormData($(this)[0]);

		$.ajax({
			url: 'handlers/ContactHandler.php',
			type: 'POST',
			data: values,
			cache: false,
			contentType: false,
			processData: false,
			success: function(data) {
				console.log(data);
			}
		})
	});
</script>
