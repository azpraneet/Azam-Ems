package com.emsApp.service;

import com.emsApp.entity.Person;

import java.util.List;

public interface PersonService {

    public String upsertPersonData(Person person);
    public List<Person> getPersonData();
    public List<Person> getPersonByName(String name);
}
