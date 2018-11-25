package ua.vn.omedtool.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.vn.omedtool.entities.Doctor;


public interface DoctorRepo extends JpaRepository<Doctor, Integer> {
    Doctor findByEmailOrPhone(String email, String phone);
}
