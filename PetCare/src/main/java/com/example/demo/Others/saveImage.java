package com.example.demo.Others;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;
import org.springframework.web.multipart.MultipartFile;

public class saveImage {
    // Define upload directory inside static folder
    private static final String UPLOAD_DIR = "src/main/resources/static/uploads/";

    public static String save(MultipartFile file,String uid) throws IOException {
        // Create the directory if it doesn't exist
        File directory = new File(UPLOAD_DIR);
        if (!directory.exists()) {
            directory.mkdirs();
        }

        // Generate a unique filename
        String k=file.getOriginalFilename();
        String fileName = uid+k.substring(k.length()-5);
        System.out.println("finalname: "+ fileName+" - "+k);
        Path filePath = Paths.get(UPLOAD_DIR, fileName);

        // Save the file
        Files.write(filePath, file.getBytes());

        System.out.println("File saved at: " + filePath.toAbsolutePath());

        // Return relative URL to access in JSP
        return "/uploads/" + fileName;
    }
}
