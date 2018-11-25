package ua.vn.omedtool.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.vn.omedtool.entities.Doctor;
import ua.vn.omedtool.entities.Patient;
import ua.vn.omedtool.servieces.DoctorService;
import ua.vn.omedtool.servieces.PatientService;

import java.security.Principal;
import java.util.HashSet;
import java.util.List;


@Controller
public class PatientController {
    @Autowired
    private PatientService patientService;
    @Autowired
    private DoctorService doctorService;

    @RequestMapping(value = "/patients", method = RequestMethod.GET)
    public String patientListPage(Model model, Principal principal) {
        model.addAttribute("patients", patientService.findAllByLogin(principal.getName()));
        return "patientList";
    }

    @RequestMapping(value = "/patients/add", method = RequestMethod.GET)
    public String patientAddPage(Model model) {
        model.addAttribute("patient", new Patient());
        return "addPatient";
    }

    @RequestMapping(value = "/patients/add", method = RequestMethod.POST)
    public String patientAdd(@ModelAttribute Patient patient, Principal principal) {
        patient.setDoctor(doctorService.findByLogin(principal.getName()));
        patientService.add(patient);
        return "redirect:/patients";
    }

    @RequestMapping(value = "/patients/{id}/delete", method = RequestMethod.GET)
    public String deletePatient(@PathVariable Integer id) {
        patientService.delete(id);
        return "redirect:/patients";
    }

    @RequestMapping(value = "/patients/{id}", method = RequestMethod.GET)
    public String showPatient(@PathVariable Integer id, Model model) {
        model.addAttribute("patient", patientService.findById(id));
        return "patient";
    }

    @RequestMapping(value = "/patients/{id}/edit", method = RequestMethod.GET)
    public String editPatient(@PathVariable Integer id, Model model) {
        model.addAttribute("patient", patientService.findById(id));
        return "editPatient";
    }

    @RequestMapping(value = "/patients/{id}/edit", method = RequestMethod.POST)
    public String editPatient(@ModelAttribute Patient patient) {
        patientService.add(patient);
        return "redirect:/patients/{id}";
    }

    @RequestMapping(value = "/patients/all", method = RequestMethod.GET)
    @ResponseBody
    public List<Patient> patientFindAll() {
        return patientService.findAllPatients();
    }

    @RequestMapping(value = "/patients/search", method = RequestMethod.POST)
    @ResponseBody
    public HashSet<Patient> searchPatients(@RequestBody String search, Principal principal) {
        return patientService.search(search, doctorService.findByLogin(principal.getName()));
    }

}
