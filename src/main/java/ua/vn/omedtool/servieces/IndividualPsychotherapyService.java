package ua.vn.omedtool.servieces;

import ua.vn.omedtool.entities.Doctor;
import ua.vn.omedtool.entities.IndividualPsychotherapy;

import java.util.List;

public interface IndividualPsychotherapyService {

    List<IndividualPsychotherapy> findAllByLogin(String login);

    void delete(int id);

    void add(String name, Doctor doctor);

    List<IndividualPsychotherapy> findAll();


    List<String> findNamesByUserLogin(String login);
}
