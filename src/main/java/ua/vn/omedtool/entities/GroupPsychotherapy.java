package ua.vn.omedtool.entities;

import javax.persistence.*;
import java.util.List;


@Entity
public class GroupPsychotherapy {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    @ManyToMany
    @JoinTable(name = "dairy_groupPsy", joinColumns = @JoinColumn(name = "id_groupPsychotherapy"), inverseJoinColumns = @JoinColumn(name = "id_dairy"))
    private List<Dairy> dairyList;
    @ManyToOne
    private Doctor doctor;
    @ManyToOne
    private Patient patient;

    public GroupPsychotherapy() {
    }

    public GroupPsychotherapy(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Dairy> getDairyList() {
        return dairyList;
    }

    public void setDairyList(List<Dairy> dairyList) {
        this.dairyList = dairyList;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }
}
