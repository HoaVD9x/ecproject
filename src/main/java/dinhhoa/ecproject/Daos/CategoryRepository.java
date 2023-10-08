package dinhhoa.ecproject.Daos;

import java.util.List;

import dinhhoa.ecproject.Models.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;



@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

	@Query(value = "SELECT * FROM category WHERE active = true", nativeQuery = true)
	public List<Category> getCategories();


}
