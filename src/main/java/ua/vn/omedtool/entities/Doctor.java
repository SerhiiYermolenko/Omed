package ua.vn.omedtool.entities;

import javax.persistence.*;
import java.util.List;


@Entity
public class Doctor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String phone;
    private String password;
    private String firstName;
    private String secondName;
    private String email;
    @OneToMany(mappedBy = "doctor", cascade = CascadeType.ALL)
    private List<Patient> patientList;
    @OneToMany(mappedBy = "doctor", cascade = CascadeType.ALL)
    private List<Dairy> dairyList;
    @OneToMany(mappedBy = "doctor", cascade = CascadeType.ALL)
    private List<GroupPsychotherapy> groupPsychotherapyList;
    @OneToMany(mappedBy = "doctor", cascade = CascadeType.ALL)
    private List<IndividualPsychotherapy> individualPsychotherapyList;

    public Doctor() {
    }

    public Doctor(String phone, String password, String firstName, String secondName, String email) {
        this.phone = phone;
        this.password = password;
        this.firstName = firstName;
        this.secondName = secondName;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSecondName() {
        return secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Patient> getPatientList() {
        return patientList;
    }

    public void setPatientList(List<Patient> patientList) {
        this.patientList = patientList;
    }

    public List<Dairy> getDairyList() {
        return dairyList;
    }

    public void setDairyList(List<Dairy> dairyList) {
        this.dairyList = dairyList;
    }


    public List<GroupPsychotherapy> getGroupPsychotherapyList() {
        return groupPsychotherapyList;
    }

    public void setGroupPsychotherapyList(List<GroupPsychotherapy> groupPsychotherapyList) {
        this.groupPsychotherapyList = groupPsychotherapyList;
    }

    public List<IndividualPsychotherapy> getIndividualPsychotherapyList() {
        return individualPsychotherapyList;
    }

    public void setIndividualPsychotherapyList(List<IndividualPsychotherapy> individualPsychotherapyList) {
        this.individualPsychotherapyList = individualPsychotherapyList;
    }
}
