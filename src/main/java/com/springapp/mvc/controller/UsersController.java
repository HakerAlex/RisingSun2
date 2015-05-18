package com.springapp.mvc.controller;

import com.springapp.mvc.domain.RulesEntity;
import com.springapp.mvc.repository.UserRepository;
import com.springapp.mvc.domain.UsersEntity;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import java.util.List;

@Controller
public class UsersController {
    private UserRepository userRepository;

    @Autowired
    public UsersController(UserRepository userRepository){
        this.userRepository=userRepository;
    }

    @PreAuthorize("hasRole('Admin')")
    @RequestMapping(value = "/tableuser", method = RequestMethod.GET)
    public String tableuser(Model model) {
        List<UsersEntity> users =this.userRepository.getAllUsers();
        model.addAttribute("users",users);
        return "tableuser";
    }

    @PreAuthorize("hasRole('Admin')")
    @RequestMapping(value = "/edituser/{id}", method = RequestMethod.GET)
    public String edituser(@PathVariable int id, Model model) {
        UsersEntity user =this.userRepository.findUser(id);
        List<RulesEntity> rules =this.userRepository.findRulesByUserID(id);
        List<RulesEntity> allrules =this.userRepository.findAllRulesByUserID(id);
        model.addAttribute("user",user);
        model.addAttribute("rules",rules);
        model.addAttribute("allrules",allrules);
        return "edituser";
    }

    @PreAuthorize("hasRole('Admin')")
    @RequestMapping(value = "/updateuser", method = RequestMethod.POST)
    public String edituser(@RequestParam("name") String name, @RequestParam("username") String username, @RequestParam("password") String password,@RequestParam("id") int id, @RequestParam(value="status" , required = false, defaultValue = "off") String status, @RequestParam("select[]") String[] rules, Model model) {
        UsersEntity user =this.userRepository.findUser(id);

        if (!user.getPassword().equals(password)) {
            user.setPassword(DigestUtils.md5Hex(password));
        }
        user.setName(name);
        user.setUsername(username);

        if (status.equals("on"))
            user.setStatus("ACTIVE");
        else
            user.setStatus("INACTIVE");

        this.userRepository.editUser(user);
        this.userRepository.updateRules(id,rules);

        return "redirect:/tableuser";
    }

    @PreAuthorize("hasRole('Admin')")
    @RequestMapping(value = "/adduser", method = RequestMethod.GET)
    public String adduserpage(Model model) {
        List<RulesEntity> allrules =this.userRepository.allRules();
        model.addAttribute("allrules",allrules);
        return "adduser";
    }

    @PreAuthorize("hasRole('Admin')")
    @RequestMapping(value = "/adduser", method = RequestMethod.POST)
    public String adduser(@RequestParam("name") String name, @RequestParam("username") String username, @RequestParam("password") String password, @RequestParam(value="status" , required = false, defaultValue = "off") String status, @RequestParam("select[]") String[] rules, Model model) {
        UsersEntity user =new UsersEntity();
        user.setName(name);
        if (this.userRepository.findUserByName(username)!=null) {
            model.addAttribute("error",1);
            model.addAttribute("username",username);
            model.addAttribute("name",name);
            List<RulesEntity> allrules =this.userRepository.allRules();
            model.addAttribute("allrules",allrules);

            String ourS;
            if (status.equals("on"))
                ourS="ACTIVE";
            else
                ourS="INACTIVE";
            model.addAttribute("status",ourS);
            return "adduser";
        }
        user.setUsername(username);
        user.setPassword(DigestUtils.md5Hex(password));

        if (status.equals("on"))
            user.setStatus("ACTIVE");
        else
            user.setStatus("INACTIVE");

        this.userRepository.addUser(user);
        this.userRepository.updateRules(user.getId(),rules);

        return "redirect:/tableuser";
    }

}
