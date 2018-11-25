package ua.vn.omedtool.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class Patient {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int numberInMedList;
    private String firsName;
    private String secondName;
    private int yearOfBirth;
    private String gender;
    private String addres;
    private String phoneNumber;
    private String dateOfRequest;
    private int numberOfMedCard;
    private String life;
    private String mentalStatus;
    private String conclution;
    private int numberOfGroupPsychotherapy;
    private int nuberOfInduvidualPsychotherapy;
    private String psyNames;
    private String dates;
    @ManyToOne
    private Doctor doctor;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "patient_dairy", joinColumns = @JoinColumn(name = "id_patient"), inverseJoinColumns = @JoinColumn(name = "id_dairy"))
    private List<Dairy> dairyList;
    @OneToMany(mappedBy = "patient")
    List<GroupPsychotherapy> groupPsychotherapyList;
    @OneToMany(mappedBy = "patient")
    List<IndividualPsychotherapy> individualPsychotherapies;

    public Patient() {
    }

    public Patient(int numberInMedList, String firsName, String secondName, int yearOfBirth, String gender, String addres, String phoneNumber, String dateOfRequest, int numberOfMedCard, String life, String mentalStatus, String conclution, int numberOfGroupPsychotherapy, int nuberOfInduvidualPsychotherapy, Doctor doctor, List<Dairy> dairyList) {
        this.numberInMedList = numberInMedList;
        this.firsName = firsName;
        this.secondName = secondName;
        this.yearOfBirth = yearOfBirth;
        this.gender = gender;
        this.addres = addres;
        this.phoneNumber = phoneNumber;
        this.dateOfRequest = dateOfRequest;
        this.numberOfMedCard = numberOfMedCard;
        this.life = life;
        this.mentalStatus = mentalStatus;
        this.conclution = conclution;
        this.numberOfGroupPsychotherapy = numberOfGroupPsychotherapy;
        this.nuberOfInduvidualPsychotherapy = nuberOfInduvidualPsychotherapy;
        this.doctor = doctor;
        this.dairyList = dairyList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumberInMedList() {
        return numberInMedList;
    }

    public void setNumberInMedList(int numberInMedList) {
        this.numberInMedList = numberInMedList;
    }

    public String getFirsName() {
        return firsName;
    }

    public void setFirsName(String firsName) {
        this.firsName = firsName;
    }

    public String getSecondName() {
        return secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public int getYearOfBirth() {
        return yearOfBirth;
    }

    public void setYearOfBirth(int yearOfBirth) {
        this.yearOfBirth = yearOfBirth;
    }

    public String getAddres() {
        return addres;
    }

    public void setAddres(String addres) {
        this.addres = addres;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getDateOfRequest() {
        return dateOfRequest;
    }

    public void setDateOfRequest(String dateOfRequest) {
        this.dateOfRequest = dateOfRequest;
    }

    public int getNumberOfMedCard() {
        return numberOfMedCard;
    }

    public void setNumberOfMedCard(int numberOfMedCard) {
        this.numberOfMedCard = numberOfMedCard;
    }

    public String getLife() {
        return life;
    }

    public void setLife(String life) {
        this.life = life;
    }

    public String getMentalStatus() {
        return mentalStatus;
    }

    public void setMentalStatus(String mentalStatus) {
        this.mentalStatus = mentalStatus;
    }

    public String getConclution() {
        return conclution;
    }

    public void setConclution(String conclution) {
        this.conclution = conclution;
    }

    public int getNumberOfGroupPsychotherapy() {
        return numberOfGroupPsychotherapy;
    }

    public void setNumberOfGroupPsychotherapy(int numberOfGroupPsychotherapy) {
        this.numberOfGroupPsychotherapy = numberOfGroupPsychotherapy;
    }

    public int getNuberOfInduvidualPsychotherapy() {
        return nuberOfInduvidualPsychotherapy;
    }

    public void setNuberOfInduvidualPsychotherapy(int nuberOfInduvidualPsychotherapy) {
        this.nuberOfInduvidualPsychotherapy = nuberOfInduvidualPsychotherapy;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public List<Dairy> getDairyList() {
        return dairyList;
    }

    public void setDairyList(List<Dairy> dairyList) {
        this.dairyList = dairyList;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public List<GroupPsychotherapy> getGroupPsychotherapyList() {
        return groupPsychotherapyList;
    }

    public void setGroupPsychotherapyList(List<GroupPsychotherapy> groupPsychotherapyList) {
        this.groupPsychotherapyList = groupPsychotherapyList;
    }

    public List<IndividualPsychotherapy> getIndividualPsychotherapies() {
        return individualPsychotherapies;
    }

    public void setIndividualPsychotherapies(List<IndividualPsychotherapy> individualPsychotherapies) {
        this.individualPsychotherapies = individualPsychotherapies;
    }

    public String getPsyNames() {
        return psyNames;
    }

    public void setPsyNames(String psyNames) {
        this.psyNames = psyNames;
    }

    public String getDates() {
        return dates;
    }

    public void setDates(String dates) {
        this.dates = dates;
    }
}
