package com.springapp.mvc.controller;

import com.springapp.mvc.domain.RulesEntity;
import com.springapp.mvc.repository.UserRepository;
import com.springapp.mvc.domain.UsersEntity;
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
    public String edituser(@RequestParam("name") String name, @RequestParam("username") String username, @RequestParam("password") String password,@RequestParam("id") String id, @RequestParam("status") String status, @RequestParam("select[]") String[] rules, Model model) {
        return "tableuser";
    }

}
