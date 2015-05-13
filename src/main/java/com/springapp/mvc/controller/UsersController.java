package com.springapp.mvc.controller;

import com.springapp.mvc.repository.UserRepository;
import com.springapp.mvc.domain.UsersEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class UsersController {
    private UserRepository userRepository;

    @Autowired
    public UsersController(UserRepository userRepository){
        this.userRepository=userRepository;
    }

    @RequestMapping(value = "/tableuser", method = RequestMethod.GET)
    public String tableuser(Model model) {
        List<UsersEntity> users =this.userRepository.getAllUsers();
        model.addAttribute("users",users);
        return "tableuser";
    }

    @RequestMapping(value = "/edituser/{id}", method = RequestMethod.GET)
    public String edituser(@PathVariable int id, Model model) {
        UsersEntity user =this.userRepository.findUser(id);
        model.addAttribute("users",user);
        return "edituser";
    }

}
