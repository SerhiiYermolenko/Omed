package ua.vn.omedtool.servieces.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.vn.omedtool.entities.Dairy;
import ua.vn.omedtool.entities.Doctor;
import ua.vn.omedtool.entities.IndividualPsychotherapy;
import ua.vn.omedtool.entities.Patient;
import ua.vn.omedtool.repo.DairyRepo;
import ua.vn.omedtool.servieces.DairyService;
import ua.vn.omedtool.servieces.PatientService;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Service
public class DairyServiceImpl implements DairyService {
    @Autowired
    private DairyRepo dairyRepo;
    @Autowired
    private PatientService patientService;

    @Override
    public List<Dairy> findByLogin(String login) {
        return dairyRepo.findAllByDoctorEmailOrDoctorPhone(login, login);
    }
    @Override
    public void add(Doctor doctor, String[] indvPsy, String[] indvPatient, String[] groupPsy, String[] groupPatient, Date date) {
        Dairy dairy = new Dairy(date);
//        addTherapiesToPatient(dairy, indvPsy, indvPatient);
//        addTherapiesToPatient(dairy, groupPsy, groupPatient);
        dairy.setDoctor(doctor);
        dairyRepo.save(dairy);
    }
}
