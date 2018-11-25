package ua.vn.omedtool.servieces.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.vn.omedtool.entities.Doctor;
import ua.vn.omedtool.entities.IndividualPsychotherapy;
import ua.vn.omedtool.repo.IndividualPsychotherapyRepo;
import ua.vn.omedtool.servieces.IndividualPsychotherapyService;

import java.util.List;


@Service
public class IndividualPsychotherapyServiceImpl implements IndividualPsychotherapyService {

    @Autowired
    private IndividualPsychotherapyRepo individualPsychotherapyRepo;

    @Override
    public List<IndividualPsychotherapy> findAllByLogin(String login) {
        return individualPsychotherapyRepo.findAllByDoctorEmailOrDoctorPhone(login, login);
    }

    @Override
    public void delete(int id) {
        individualPsychotherapyRepo.delete(id);
    }

    @Override
    public void add(String name, Doctor doctor) {
        IndividualPsychotherapy individualPsychotherapy = new IndividualPsychotherapy(name);
        individualPsychotherapy.setDoctor(doctor);
        individualPsychotherapyRepo.save(individualPsychotherapy);
    }


    @Override
    public List<IndividualPsychotherapy> findAll() {
        return individualPsychotherapyRepo.findAll();
    }

    @Override
    public List<String> findNamesByUserLogin(String login) {
        return individualPsychotherapyRepo.findIndivNameEmail(login);
    }
}


