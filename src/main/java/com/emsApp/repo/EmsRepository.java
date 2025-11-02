package com.emsApp.repo;

import com.emsApp.entity.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmsRepository extends JpaRepository<Person,Integer> {
    List<Person> findByNameIgnoreCase(String name);
}
