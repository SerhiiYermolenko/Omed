package ua.vn.omedtool.servieces.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ua.vn.omedtool.entities.Doctor;
import ua.vn.omedtool.repo.DoctorRepo;
import ua.vn.omedtool.servieces.DoctorService;

import javax.print.Doc;
import java.util.ArrayList;
import java.util.Collection;


@Service
public class DoctorServiceImpl implements DoctorService, UserDetailsService {
    @Autowired
    private DoctorRepo doctorRepo;

    @Override
    public void add(String name, String secondName, String email, String phone, String password) {
        Doctor doctor = new Doctor(phone, password, name, secondName, email);
        doctorRepo.save(doctor);
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public Doctor findByLogin(String login) {
        return doctorRepo.findByEmailOrPhone(login, login);
    }

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        Doctor doctor = doctorRepo.findByEmailOrPhone(login, login);
        Collection<GrantedAuthority> grantedAuthority = new ArrayList<GrantedAuthority>();
        grantedAuthority.add(new SimpleGrantedAuthority("ROLE_USER"));
        return new User(doctor.getEmail(), doctor.getPassword(), grantedAuthority);

    }

}
