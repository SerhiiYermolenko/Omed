package ua.vn.omedtool.servieces;

import ua.vn.omedtool.entities.Doctor;
import ua.vn.omedtool.entities.GroupPsychotherapy;

import java.util.List;


public interface GroupPsychotherapyService {
    List<GroupPsychotherapy> findByLogin(String login);

    void delete(int id);

    void add(String name, Doctor doctor);

    List<GroupPsychotherapy> findall();

    List<String> findNamesByUserLogin(String login);
}
