package dinhhoa.ecproject.Daos;

import java.util.List;
import java.util.Optional;

import dinhhoa.ecproject.Models.Order;
import dinhhoa.ecproject.Models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;



@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
	
	@Query(value = "select * from product where active = true", nativeQuery = true)
	public List<Product> getProducts();

	@Query(value = "select * from product where product_id=?",nativeQuery = true)
	Optional<Product> findByProductId(@Param("product_id") Integer product_id);


}
