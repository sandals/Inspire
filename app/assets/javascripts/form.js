$(document).on("upload:success", "form", function(e) {
	$(this).find("input[type=submit]").attr("disabled", false);
});
