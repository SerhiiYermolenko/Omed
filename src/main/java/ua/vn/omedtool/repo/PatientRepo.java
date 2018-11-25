package ua.vn.omedtool.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.vn.omedtool.entities.Patient;

import java.util.Date;
import java.util.HashSet;
import java.util.List;


public interface PatientRepo extends JpaRepository<Patient, Integer> {

    List<Patient> findAllByDoctorEmailOrDoctorPhone(String email, String phone);

    HashSet<Patient> findAllByFirsNameLikeOrSecondNameLikeOrNumberInMedListLikeOrNumberOfMedCardLike(String name, String secondName, int numMedList, int numMedCard);

    HashSet<Patient> findAllByDateOfRequestBetween(Date dateBefore, Date dateAfter);

    HashSet<Patient> findAllByGender(String gender);

    HashSet<Patient> findAllByYearOfBirthBetween(int yearBefore, int yearAfter);

    Patient findByFirsNameOrSecondName(String name, String secondName);
}
