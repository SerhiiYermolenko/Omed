package ua.vn.omedtool.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.vn.omedtool.entities.IndividualPsychotherapy;

import java.util.List;


public interface IndividualPsychotherapyRepo extends JpaRepository<IndividualPsychotherapy, Integer> {
    List<IndividualPsychotherapy> findAllByDoctorEmailOrDoctorPhone(String email, String phone);

    @Query("SELECT i.name from IndividualPsychotherapy i where i.doctor.email=:email")
    List<String> findIndivNameEmail(@Param("email") String id);
}
