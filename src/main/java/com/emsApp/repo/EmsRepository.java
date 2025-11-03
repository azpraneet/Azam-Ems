package com.emsApp.repo;

import com.emsApp.entity.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface EmsRepository extends JpaRepository<Person,Integer> {
    List<Person> findByNameIgnoreCase(String name);

    Optional<Object> findAllById(Integer id);
}
