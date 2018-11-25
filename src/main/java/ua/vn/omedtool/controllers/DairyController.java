package ua.vn.omedtool.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.vn.omedtool.entities.Doctor;
import ua.vn.omedtool.entities.Patient;
import ua.vn.omedtool.servieces.*;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@Controller
public class DairyController {
    @Autowired
    private DairyService dairyService;
    @Autowired
    private IndividualPsychotherapyService individualPsychotherapyService;
    @Autowired
    private GroupPsychotherapyService groupPsychotherapyService;
    @Autowired
    private PatientService patientService;
    @Autowired
    private DoctorService doctorService;

    @RequestMapping(value = "/dairies", method = RequestMethod.GET)
    public String dairiesPage(Model model, Principal principal) {
        model.addAttribute("dairies", dairyService.findByLogin(principal.getName()));
        return "dairyList";
    }

    @RequestMapping(value = "/dairies/add", method = RequestMethod.GET)
    public String addDairyPage(Model model, Principal principal) {
        model.addAttribute("indvPsy", individualPsychotherapyService.findAllByLogin(principal.getName()));
        model.addAttribute("groupPsy", groupPsychotherapyService.findByLogin(principal.getName()));
        model.addAttribute("patients", patientService.findAllByLogin(principal.getName()));
        return "addDairy";
    }

    @RequestMapping(value = "/dairies/add", method = RequestMethod.POST)
    public String addDairy(@RequestParam("date") String date, @RequestParam("indvPatients") String[] indvPatients, @RequestParam("indvPsy") String[] indvPsy, @RequestParam("groupPatients") String[] groupPatients, @RequestParam("groupPsy") String[] groupPsy, Principal principal) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date foramatDate = null;
        try {
            foramatDate = dateFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        dairyService.add(doctorService.findByLogin(principal.getName()), indvPsy, indvPatients, groupPsy, groupPatients, foramatDate);

        return "redirect:/dairies";
    }
}
