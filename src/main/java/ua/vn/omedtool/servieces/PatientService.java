package ua.vn.omedtool.servieces;

import ua.vn.omedtool.entities.Doctor;
import ua.vn.omedtool.entities.Patient;

import java.util.Date;
import java.util.HashSet;
import java.util.List;

public interface PatientService {

    List<Patient> findAllByLogin(String login);

    void add(Patient patient);

    void delete(int id);

    Patient findById(int id);

    List<Patient> findAllPatients();

    HashSet<Patient> search(String search, Doctor doctor);

    HashSet<Patient> filter(Date dateBefore, Date dateAfter, String gender, int ageBefore, int ageAfter);

    Patient findByNameOrSecondName(String name, String secondName);
}
