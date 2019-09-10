<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/journal/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ciphE0NCAlD2/N6NUApXAN2dAs/vcSAOTzyE202jJx3oS8n4tAQezRgnlHqcJ59C"
	crossorigin="anonymous">
<script src="https://widget.cloudinary.com/v2.0/global/all.js"
	type="text/javascript">  
</script>
<link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<h1>Upload an Image!</h1>
<button class="btn btn-primary" onclick="upload()">Upload</button>


	<script>
	/* Found this on the cloudinary website under the widget option https://cloudinary.com/documentation/upload_widget  */
	var widget = cloudinary.createUploadWidget({ 
	  cloudName: "dj8n5xx8h", uploadPreset: "bolpnzg0" }, (error, result) => { console.log(result)}); /* console logging the result    */
	
	function upload() {
	widget.open();
	}
</script>
</body>
</html>