$(document).ready(function(){
	$(".add-category").on("click",function(){ 
		$(this).parent().siblings("span:first").removeClass("hide-category");
		$(this).hide();
	});

	$(".cancel-category").on("click",function(){
		$(this).parents("span").addClass("hide-category");
		$(this).parents("span").siblings().children("span").show()
	});

	$(".save-category").on("click", function(e){
		var object = {feed: { category : $(this).siblings("input").val() } };
		$this = $(this);
		$.ajax({
	  		url: '/feeds/'+$(this).data("id"),
	  		type: 'PUT',
	  		data:  object,
	  		success: function(data) {
	  			$this.parent("span").addClass("hide-category");
	  			$this.parent("span").siblings().children("span").show();
	  			$this.parent().siblings().children("span").html("+ <span class='save-message'>Saved Successfully</span>")
	  		},
	  		error: function(x,h,r){
	  			console.log("error");
	  		}
		});
		e.preventDefault();
		e.stopPropagation();;
		return false;
	});

	$(".go-button").on("click",function(e){
		 var value = $(this).siblings("input").val();
		 if(value === "")
		 {
		 	e.preventDefault();
		 }
	})
});