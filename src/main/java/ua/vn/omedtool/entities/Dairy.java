package ua.vn.omedtool.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Entity
public class Dairy {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private Date date;
    @Column
    private String conference;
    @Column
    private String lectures;
    @Column
    private String themeOfAConference;
    @Column
    private String themeOfALecture;
    @ManyToOne
    private Doctor doctor;
    @ManyToMany
    @JoinTable(name = "patient_dairy", joinColumns = @JoinColumn(name = "id_dairy"), inverseJoinColumns = @JoinColumn(name = "id_patient"))
    private List<Patient> patientList;
    @ManyToMany
    @JoinTable(name = "dairy_groupPsy", joinColumns = @JoinColumn(name = "id_dairy"), inverseJoinColumns = @JoinColumn(name = "id_groupPsychotherapy"))
    private List<GroupPsychotherapy> groupPsychotherapyList;

    public Dairy() {
    }

    public Dairy(Date date) {
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getConference() {
        return conference;
    }

    public void setConference(String conference) {
        this.conference = conference;
    }

    public String getLectures() {
        return lectures;
    }

    public void setLectures(String lectures) {
        this.lectures = lectures;
    }

    public String getThemeOfAConference() {
        return themeOfAConference;
    }

    public void setThemeOfAConference(String themeOfAConference) {
        this.themeOfAConference = themeOfAConference;
    }

    public String getThemeOfALecture() {
        return themeOfALecture;
    }

    public void setThemeOfALecture(String themeOfALecture) {
        this.themeOfALecture = themeOfALecture;
    }


    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public List<Patient> getPatientList() {
        return patientList;
    }

    public void setPatientList(List<Patient> patientList) {
        this.patientList = patientList;
    }

    public List<GroupPsychotherapy> getGroupPsychotherapyList() {
        return groupPsychotherapyList;
    }

    public void setGroupPsychotherapyList(List<GroupPsychotherapy> groupPsychotherapyList) {
        this.groupPsychotherapyList = groupPsychotherapyList;
    }

}
