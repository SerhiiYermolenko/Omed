package ua.vn.omedtool.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.vn.omedtool.entities.GroupPsychotherapy;

import java.util.List;


public interface GroupPsychotherapyRepo extends JpaRepository<GroupPsychotherapy, Integer> {
    List<GroupPsychotherapy> findAllByDoctorEmailOrDoctorPhone(String email, String phone);

    @Query("SELECT g.name from GroupPsychotherapy g where g.doctor.email=:email")
    List<String> findGroupNameEmail(@Param("email") String id);
}


