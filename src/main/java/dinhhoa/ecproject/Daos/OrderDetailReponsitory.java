package dinhhoa.ecproject.Daos;

import dinhhoa.ecproject.Models.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetailReponsitory extends JpaRepository<OrderDetail, Integer> {
}
