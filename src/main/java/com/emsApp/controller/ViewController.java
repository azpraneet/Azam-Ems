package com.emsApp.controller;



import com.emsApp.entity.Person;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.emsApp.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLOutput;
import java.util.Arrays;
import java.util.List;

@Controller
public class ViewController {

    @Autowired
    private PersonService service;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("message", "Welcome to Azam's Profile!");
        model.addAttribute("profilePic", "/images/azam.jpg");
        model.addAttribute("profilePic", "/images/profile.jpg");
        return "index"; // resolves to /WEB-INF/views/index.jsp
    }

    @GetMapping("/persons")
    public String showPersons(@ModelAttribute Person person,Model model) {
        model.addAttribute("persons", service.getPersonData());
        return "persons"; // resolves to /WEB-INF/views/persons.jsp
    }
    @GetMapping("/saves")
    public String save( Model model){
        model.addAttribute("persons", new Person());
        return "saves";
    }
    @GetMapping("/getByName")
    public String getByName(@RequestParam("name") String name, Model model) {
        // Assuming service has a method to get persons by name
        List<Person> persons = service.getPersonByName(name); // Replace with actual method to get by name
        model.addAttribute("persons", persons);
        return "persons";

    }
    @PostMapping("/savesPerson")
    public String save(@ModelAttribute Person person,
                       @RequestParam("file") MultipartFile file,
                       Model model) {


        try {
            if (!file.isEmpty()) {
                // Create upload folder if not exists
                String uploadDir = System.getProperty("user.dir") + "/uploads/";

                Path uploadPath = Paths.get(uploadDir);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                // Save file in uploads/ folder
                String fileName = file.getOriginalFilename();
                Path filePath = uploadPath.resolve(fileName);
                Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                // Save file path (relative) to entity
                person.setImage("/uploads/" + fileName);
            }

            // Save person data
            service.upsertPersonData(person);
            model.addAttribute("person", person);
            model.addAttribute("message", "Record saved successfully!");

        } catch (IOException e) {
            model.addAttribute("message", "File upload failed: " + e.getMessage());
        }

        return "saves"; // reload same page
    }
    @GetMapping("/update/{id}")
    public String showUpdateForm(@PathVariable("id") Integer id, Model model) {
        Person person = service.getPersonById(id);
        model.addAttribute("person", person);
        return "update"; // opens update.jsp
    }

    @PostMapping("/updatePerson")
    public String updatePerson(@ModelAttribute Person person,
                               @RequestParam("file") MultipartFile file,
                               Model model) {
        try {
            if (!file.isEmpty()) {
                String uploadDir = System.getProperty("user.dir") + "/uploads/";
                Path uploadPath = Paths.get(uploadDir);
                if (!Files.exists(uploadPath)) Files.createDirectories(uploadPath);

                String fileName = file.getOriginalFilename();
                Path filePath = uploadPath.resolve(fileName);
                Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
                person.setImage("/uploads/" + fileName);
            }

            service.upsertPersonData(person);
            model.addAttribute("message", "Person updated successfully!");
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("message", "Update failed: " + e.getMessage());
        }

        return "redirect:/persons"; // Redirect back to list
    }



}
