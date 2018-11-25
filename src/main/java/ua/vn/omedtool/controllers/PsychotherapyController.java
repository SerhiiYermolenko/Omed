package ua.vn.omedtool.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.vn.omedtool.entities.IndividualPsychotherapy;
import ua.vn.omedtool.servieces.DoctorService;
import ua.vn.omedtool.servieces.GroupPsychotherapyService;
import ua.vn.omedtool.servieces.IndividualPsychotherapyService;

import java.security.Principal;
import java.util.List;


@Controller
public class PsychotherapyController {
    @Autowired
    private IndividualPsychotherapyService individualPsychotherapyService;
    @Autowired
    private GroupPsychotherapyService groupPsychotherapyService;
    @Autowired
    private DoctorService doctorService;

    @RequestMapping(value = "/psychotherapy", method = RequestMethod.GET)
    public String psychotherapyPage(Model model, Principal principal) {
        model.addAttribute("individualPsychotherapy", individualPsychotherapyService.findAllByLogin(principal.getName()));
        model.addAttribute("groupPsychotherapy", groupPsychotherapyService.findByLogin(principal.getName()));
        return "psychotherapy";
    }

    @RequestMapping(value = "/psychotherapy/addindv", method = RequestMethod.POST)
    public String addNewIndvPsy(@RequestParam("nameOfIndividualPsychotherapy") String nameIndv, Principal principal) {
        individualPsychotherapyService.add(nameIndv, doctorService.findByLogin(principal.getName()));
        return "redirect:/psychotherapy";
    }

    @RequestMapping(value = "/psychotherapy/addgroup", method = RequestMethod.POST)
    public String addNewGroupPsy(@RequestParam("groupPsychotherapy") String nameGroup, Principal principal) {
        groupPsychotherapyService.add(nameGroup, doctorService.findByLogin(principal.getName()));
        return "redirect:/psychotherapy";
    }

    @RequestMapping(value = "/psychotherapies/group{id}/delete", method = RequestMethod.GET)
    public String deleteGroupPsy(@PathVariable Integer id) {
        groupPsychotherapyService.delete(id);
        return "redirect:/psychotherapy";
    }

    @RequestMapping(value = "/psychotherapies/indv{id}/delete", method = RequestMethod.GET)
    public String deleteIndvPsy(@PathVariable Integer id) {
        individualPsychotherapyService.delete(id);
        return "redirect:/psychotherapy";
    }

    @RequestMapping(value = "/psychotherapy/allindv", method = RequestMethod.GET)
    @ResponseBody
    List<String> getIndvPsyNames(Principal principal) {
        return individualPsychotherapyService.findNamesByUserLogin(principal.getName());
    }

    @RequestMapping(value = "/psychotherapy/allgroup", method = RequestMethod.GET)
    @ResponseBody
    List<String> getGroupPsyNames(Principal principal) {
        return groupPsychotherapyService.findNamesByUserLogin(principal.getName());
    }
}
