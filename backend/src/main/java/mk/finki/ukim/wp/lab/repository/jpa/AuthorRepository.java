package mk.finki.ukim.wp.lab.repository.jpa;

import mk.finki.ukim.wp.lab.model.Author;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface AuthorRepository extends JpaRepository<Author, Long> {
    List<Author> findAuthorsByNameContainingIgnoreCaseOrSurnameContainingIgnoreCase(String name, String surname);
}
