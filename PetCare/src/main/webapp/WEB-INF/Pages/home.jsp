<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Care Home</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            font-family: 'Arial', sans-serif;
            height: 100vh;
            background-color: var(--background-color, #f9f9f9);
            color: var(--text-color, #333);
            transition: background-color 0.3s, color 0.3s;
        }

        :root {
            --background-color: #f9f9f9;
            --text-color: #333;
        }

        [data-theme="dark"] {
            --background-color: #121212;
            --text-color: #f9f9f9;
        }

        /* Header with Toggle */
        .header {
            display: flex;
            justify-content: flex-end;
            padding: 1rem;
            background-color: var(--background-color);
        }

        .toggle-switch {
            position: relative;
            width: 50px;
            height: 25px;
            background-color: #ccc;
            border-radius: 25px;
            cursor: pointer;
        }

        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .toggle-switch .slider {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #fff;
            border-radius: 25px;
            transition: 0.3s;
        }

        .toggle-switch .slider:before {
            content: "";
            position: absolute;
            top: 3px;
            left: 3px;
            width: 17px;
            height: 17px;
            background-color: #0077cc;
            border-radius: 50%;
            transition: 0.3s;
        }

        input:checked + .slider {
            background-color: #0077cc;
        }

        input:checked + .slider:before {
            transform: translateX(25px);
        }

        /* Menu Sidebar */
        .menu {
            width: 20%;
            background-color: var(--background-color);
            padding: 2rem 1.5rem;
            border-right: 1px solid #ddd;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .menu h3 {
            margin-bottom: 2rem;
            color: #0077cc;
        }

        .menu a {
            display: block;
            padding: 0.75rem 1rem;
            margin: 0.5rem 0;
            color: var(--text-color);
            text-decoration: none;
            font-size: 1.1rem;
            border-radius: 8px;
            transition: background-color 0.2s;
        }

        .menu a:hover {
            background-color: #0077cc;
            color: white;
        }

        /* Posts Section */
        .posts {
            flex: 1;
            overflow-y: auto;
            padding: 2rem;
            background-color: var(--background-color);
        }

        .post {
            background-color: var(--background-color);
            border: 1px solid #ddd;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .post h4 {
            color: #0077cc;
            margin-bottom: 0.5rem;
        }

        /* Right Sidebar */
        .right-sidebar {
            width: 20%;
            background-color: var(--background-color);
            padding: 2rem;
            border-left: 1px solid #ddd;
        }

        .right-sidebar h3 {
            color: #0077cc;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: var(--background-color);
            padding: 2rem;
            border-radius: 8px;
            width: 300px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .modal h3 {
            margin-bottom: 1rem;
        }

        .modal input, .modal textarea {
            width: 100%;
            padding: 0.8rem;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        .modal button {
            width: 100%;
            padding: 1rem;
            background-color: #0077cc;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .modal button:hover {
            background-color: #005fa3;
        }

        /* Show modal */
        .show-modal {
            display: flex;
        }
    </style>
</head>
<body>

    <!-- Header with Toggle Switch -->
    <div class="header">
        <label class="toggle-switch">
            <input type="checkbox" id="theme-toggle" onchange="toggleTheme()">
            <span class="slider"></span>
        </label>
        <span id="theme-label">Light Mode</span>
    </div>

    <!-- Left Sidebar Menu -->
    <div class="menu">
        <div>
            <h3>Menu</h3>
            <a href="#">Home</a>
            <a href="#">My Profile</a>
            <a href="#" onclick="openModal()">Create Post</a>
            <a href="#">Settings</a>
        </div>
        <div>
            <a href="#">Logout</a>
        </div>
    </div>

    <!-- Posts Section -->
    <div class="posts" id="posts-container">
       
    </div>

    <!-- Right Sidebar -->
    <div class="right-sidebar">
        <h3>Upcoming Features</h3>
        <p>This space is reserved for future enhancements like trending posts, adoption tips, or recommendations.</p>
    </div>

    <!-- Modal for Create Post -->
    <div class="modal" id="create-post-modal">
        <div class="modal-content">
            <h3>Create a New Post</h3>
            <form method=POST action="uploadPost" enctype="multipart/form-data">
            <input type="text" id="petName" name="petName" placeholder="Pet Name" required>
            <input type="text" id="petType" name="petType" placeholder="Type (Dog, Cat, etc.)" required>
            <input type="text" id="petBreed"  name="petBreed" placeholder="Breed (optional)" >
            <textarea id="description" name="description" placeholder="Description" rows="4" required></textarea>
             <input type="text" id="location" name="location" placeholder="Location" >
            <input type="file" name="image" id="image">
            <button type=submit>Submit Post</button>
            <button onclick="closeModal()" style="background-color: #ccc;">Cancel</button>
            </form>
        </div>
    </div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        function toggleTheme() {
            const body = document.body;
            const themeSwitch = document.querySelector('#theme-toggle');
            const themeLabel = document.querySelector('#theme-label');

            if (themeSwitch.checked) {
                body.setAttribute('data-theme', 'dark');
                themeLabel.textContent = 'Dark Mode';
            } else {
                body.removeAttribute('data-theme');
                themeLabel.textContent = 'Light Mode';
            }
        }

        function openModal() {
            const modal = document.getElementById('create-post-modal');
            modal.classList.add('show-modal');
        }

        function closeModal() {
            const modal = document.getElementById('create-post-modal');
            modal.classList.remove('show-modal');
        }

       
    </script>
    
    <script>
    $(document).ready(function () {
    	loadPosts(0);
    	
    	function loadPosts(page)
    	{
    	//	alert("0");
    		$.ajax({
    			type:"GET",
    			url : "/getPosts",
    			data: {pageNo:page},
    			success : function(data)
    			{
    				//code
    				//alert("1");
    				let postsHtml = "";
    				$.each(data, function (index, post) {
    					//alert("00");
    				let imgSrc = post.imageUrl ? post.imageUrl : "default-image.jpg";
    		//let imgSrc = "C://Users/vchar/eclipse-workspace/PetCare/uploads/e8783966-8aaf-4c71-92f5-332b63b5600e_Screenshot 2024-09-30 114558.png";
    				//	alert(imgSrc);
    				    postsHtml += 
    				    	 "<div class='post'>"+
    				         " <h4>Pet Name: " + (post.petName ? post.petName : 'N/A') + "</h4>"+
    				          "<p>Type: " + (post.petType ? post.petType : 'N/A') + "</p>"+
    				          "<p>Breed: " + (post.petBreed ? post.petBreed : 'N/A') + "</p>"+
    				          "<p>Description: " + (post.description ? post.description : 'N/A') + "</p>"+
    				          "<p>Location: " + (post.location ? post.location : 'N/A') + "</p>"+
    				          "<img src='" + imgSrc + "'style='width:100px; height:100px;'>"+  
    				      "</div>"
    				      ;
    				});
    				//alert(postsHtml);

    				$("#posts-container").html(postsHtml);
    			}
    		
    		});
    	}
    	
    	
    });
    
    </script>

</body>
</html>
