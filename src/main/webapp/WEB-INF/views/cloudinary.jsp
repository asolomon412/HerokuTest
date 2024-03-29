<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://cloudinary.com/jsp/taglib" prefix="cl"%>
<html>
<head>
<title>Photo Album</title>
<%-- <link type="text/css" rel="stylesheet" media="all"
	href="<c:url value="/stylesheets/application.css"/>"> --%>
<link rel="shortcut icon">
<link rel="stylesheet" href="positiveStyle.css" />
<link
	href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
</head>
<body>

	<div class="content" align="center">
		<div id="direct_upload">
			<h1 style="font-size: 70px">New Photo</h1>
			<form method="post" enctype="multipart/form-data">
				<div class="form_line">
					<label>Image:</label>
					<div class="form_controls">
						<div class="upload_button_holder">
							<a href="#" class="upload_button">Upload</a>
							<cl:upload fieldName="preloadedFile"
								transformation="w_1000,h_1000,c_limit"
								eager="c_scale,w_150,h_150|c_fit,w_150,h_150"
								extraClasses="extra" exif="true" imageMetadata="true"
								colors="true" faces="true" />

						</div>
						<span class="status"></span>
					</div>
				</div>
				<div class="form_line">
					<div class="form_controls">
						<div class="preview"></div>
					</div>
				</div>
				<br>
				<div class="form_line">
					<div class="form_controls">
						<input type="submit" value="Post" class="btn btn-secondary">
						<a href="/posts" class="btn btn-secondary">Back</a>
					</div>
				</div>
			</form>
		</div>

		<%-- <a href="<c:url value="/posts"/>" class="back_link">Back to Homepage</a>
 --%>
		<!-- 		<div id="info"></div>
 -->
		<cl:jsinclude />

		<!-- Configure Cloudinary jQuery plugin -->
		<cl:jsconfig />

		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								// Cloudinary jQuery integration library uses jQuery File Upload widget
								// (see http://blueimp.github.io/jQuery-File-Upload/).
								// Any file input field with cloudinary-fileupload class is automatically
								// wrapped using the File Upload widget and configured for Cloudinary uploads.
								// You can further customize the configuration using .fileupload method
								// as we do below.
								$('.upload_form').append(
										$.cloudinary.unsigned_upload_tag(
												"bolpnzg0", {
													cloud_name : 'dj8n5xx8h'
												}));
								$(".cloudinary-fileupload")
										.fileupload(
												{
													// Uncomment the following lines to enable client side image resizing and valiation.
													// Make sure cloudinary/processing is included the js file
													//disableImageResize: false,
													//imageMaxWidth: 800,
													//imageMaxHeight: 600,
													//acceptFileTypes: /(\.|\/)(gif|jpe?g|png|bmp|ico)$/i,
													//maxFileSize: 20000000, // 20MB 
													dropZone : "#direct_upload",
													start : function(e) {
														$(".status")
																.text(
																		"Starting upload...");
													},
													progress : function(e, data) {
														$(".status")
																.text(
																		"Uploading... "
																				+ Math
																						.round((data.loaded * 100.0)
																								/ data.total)
																				+ "%");
													},
													fail : function(e, data) {
														$(".status")
																.text(
																		"Upload failed");
													}
												})
										.off("cloudinarydone")
										.on(
												"cloudinarydone",
												function(e, data) {
													$("#photo_bytes").val(
															data.result.bytes);
													$(".status").text("");
													if (data.result.resource_type == "image") {
														$(".preview")
																.html(
																		$.cloudinary
																				.image(
																						data.result.public_id,
																						{
																							format : data.result.format,
																							width : 50,
																							height : 50,
																							crop : "fit"
																						}));
													}
													view_upload_details(data.result);
												});
							});
			function view_upload_details(upload) {
				// Build an html table out of the upload object
				var rows = [];
				$.each(upload, function(k, v) {
					rows.push($("<tr>").append($("<td>").text(k)).append(
							$("<td>").text(JSON.stringify(v))));
				});
				$("#info").html(
						$("<div class=\"upload_details\">").append(
								"<h2>Upload metadata:</h2>").append(
								$("<table>").append(rows)));
			}
		</script>

	</div>
</body>
</html>