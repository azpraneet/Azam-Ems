package com.emsApp.controller;

import com.emsApp.entity.Person;
import com.emsApp.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class PersonController {
    @Autowired
    private PersonService service;

    @PostMapping("/save")
    public ResponseEntity<String> save(@RequestBody Person person){
        String response = service.upsertPersonData(person);
        return new ResponseEntity<>(response, HttpStatus.CREATED);
    }
    @PutMapping("/update")
    public ResponseEntity<String>update(@RequestBody Person person){
        String response = service.upsertPersonData(person);
        return new ResponseEntity<>(response,HttpStatus.OK);
    }
    @GetMapping("/all")
    public ResponseEntity<List<Person>>getAll(){
        List<Person> all = service.getPersonData();

        return new ResponseEntity(all,HttpStatus.OK);
    }
}
