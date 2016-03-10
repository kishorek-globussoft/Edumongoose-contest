/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edumongoose.controllers;

import com.edumongoose.entity.Person;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping("/")
public class TestController {

    @RequestMapping(value = "controller")
    public String test(@RequestParam(value = "name", required = false) String name, ModelMap model) throws JsonProcessingException {
        System.out.println("Test");
        Person person = new Person();
        person.setAge(10);
        person.setGender("male");
        person.setName(name);
        model.put("person", person);
        
        return "test";
    }

    @RequestMapping("/index")
    public String index() {
        System.out.println("Test");
        return "index";
    }

}
