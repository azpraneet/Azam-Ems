package com.emsApp.service.Impl;

import com.emsApp.entity.Person;
import com.emsApp.repo.EmsRepository;
import com.emsApp.service.PersonService;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PersonServiceImpl implements PersonService {
    private EmsRepository repo;

    public PersonServiceImpl(EmsRepository repo) {
        this.repo = repo;
    }

    @Override
    public String upsertPersonData(Person person) {
        Integer id = person.getId();
        Person saved = repo.save(person);
        if (id==null){
            return "created";
        }
        return "saved";
    }

    @Override
    public List<Person> getPersonData() {
        List<Person> all = repo.findAll();
        return all;
    }

    @Override
    public List<Person> getPersonByName(String name) {
            return repo.findByNameIgnoreCase(name);
    }
}
