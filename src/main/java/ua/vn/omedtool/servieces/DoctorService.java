package ua.vn.omedtool.servieces;

import ua.vn.omedtool.entities.Doctor;


public interface DoctorService {
    void add(String name, String secondName, String email, String phone, String password);

    void delete(int id);

    Doctor findByLogin(String login);
}
