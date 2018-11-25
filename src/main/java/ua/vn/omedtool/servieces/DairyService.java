package ua.vn.omedtool.servieces;

import ua.vn.omedtool.entities.Dairy;
import ua.vn.omedtool.entities.Doctor;

import java.util.Date;
import java.util.List;


public interface DairyService {
    List<Dairy> findByLogin(String login);

    void add(Doctor doctor, String[] indvPsy, String[] indvPatient, String[] groupPsy, String[] groupPatient, Date date);

    
}
