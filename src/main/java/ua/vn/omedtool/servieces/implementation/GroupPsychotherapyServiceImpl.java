package ua.vn.omedtool.servieces.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.vn.omedtool.entities.Doctor;
import ua.vn.omedtool.entities.GroupPsychotherapy;
import ua.vn.omedtool.repo.GroupPsychotherapyRepo;
import ua.vn.omedtool.servieces.GroupPsychotherapyService;

import java.util.List;


@Service
public class GroupPsychotherapyServiceImpl implements GroupPsychotherapyService {
    @Autowired
    private GroupPsychotherapyRepo groupPsychotherapyRepo;

    @Override
    public List<GroupPsychotherapy> findByLogin(String login) {
        return groupPsychotherapyRepo.findAllByDoctorEmailOrDoctorPhone(login, login);
    }

    @Override
    public void delete(int id) {
        groupPsychotherapyRepo.delete(id);
    }

    @Override
    public void add(String name, Doctor doctor) {
        GroupPsychotherapy groupPsychotherapy = new GroupPsychotherapy(name);
        groupPsychotherapy.setDoctor(doctor);
        groupPsychotherapyRepo.save(groupPsychotherapy);
    }


    @Override
    public List<GroupPsychotherapy> findall() {
        return groupPsychotherapyRepo.findAll();
    }

    @Override
    public List<String> findNamesByUserLogin(String login) {
        return groupPsychotherapyRepo.findGroupNameEmail(login);
    }
}
