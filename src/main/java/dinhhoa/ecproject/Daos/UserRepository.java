package dinhhoa.ecproject.Daos;

import java.util.List;
import java.util.Optional;

import dinhhoa.ecproject.Models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;



@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	
	
	@Query("select u from User u where u.email =:email")
	public User loadUserByUserName(@Param("email") String email);
	
	@Query(value = "select * from user", nativeQuery = true)
	public List<User> getUsers();

}
	