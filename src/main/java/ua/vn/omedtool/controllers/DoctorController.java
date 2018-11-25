package ua.vn.omedtool.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.vn.omedtool.servieces.DoctorService;


@Controller
public class DoctorController {
    @Autowired
    private DoctorService doctorService;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registrationPage() {
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@RequestParam("name") String name, @RequestParam("secondName") String secondName, @RequestParam("email") String email, @RequestParam("phone") String phone, @RequestParam("password") String password) {
        doctorService.add(name, secondName, email, phone, password);
        return "redirect:/";
    }
}
