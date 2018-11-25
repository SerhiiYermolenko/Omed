package ua.vn.omedtool.servieces.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.vn.omedtool.entities.Doctor;
import ua.vn.omedtool.entities.Patient;
import ua.vn.omedtool.repo.PatientRepo;
import ua.vn.omedtool.servieces.PatientService;

import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;


@Service
public class PatientServiceImpl implements PatientService {
    @Autowired
    private PatientRepo patientRepo;

    @Override
    public List<Patient> findAllByLogin(String login) {
        return patientRepo.findAllByDoctorEmailOrDoctorPhone(login, login);
    }

    @Override
    public void add(Patient patient) {
        patientRepo.save(patient);
    }

    @Override
    public void delete(int id) {
        patientRepo.delete(id);
    }

    @Override
    public Patient findById(int id) {
        return patientRepo.findOne(id);
    }

    @Override
    public List<Patient> findAllPatients() {
        return patientRepo.findAll();
    }

    @Override
    public HashSet<Patient> search(String search, Doctor doctor) {
        String[] strings = search.split(" ");
        HashSet<Patient> patientHashSet = new HashSet<>();
        for (int i = 0; i < strings.length; i++) {
            int medList = Integer.parseInt(strings[i]);
            int medCard = Integer.parseInt(strings[i]);
            patientHashSet.addAll(patientRepo.findAllByFirsNameLikeOrSecondNameLikeOrNumberInMedListLikeOrNumberOfMedCardLike(strings[i], strings[i], medList, medCard));
        }
        return patientHashSet;
    }

    @Override
    public HashSet<Patient> filter(Date dateBefore, Date dateAfter, String gender, int ageBefore, int ageAfter) {
        HashSet<Patient> patientHashSet = new HashSet<>();
        if (dateBefore != null && dateAfter.after(dateBefore) && dateAfter != null) {
            patientHashSet.addAll(patientRepo.findAllByDateOfRequestBetween(dateBefore, dateAfter));
        }
        if (gender.equalsIgnoreCase("") && gender != null) {
            patientHashSet.addAll(patientRepo.findAllByGender(gender));
        }
        if (ageAfter > ageBefore) {
            patientHashSet.addAll(patientRepo.findAllByYearOfBirthBetween(ageBefore, ageAfter));
        }
        return patientHashSet;
    }

    @Override
    public Patient findByNameOrSecondName(String name, String secondName) {
        return patientRepo.findByFirsNameOrSecondName(name, secondName);
    }
}
