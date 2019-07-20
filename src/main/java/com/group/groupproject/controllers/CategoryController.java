package com.group.groupproject.controllers;

import com.group.groupproject.entities.Category;
import com.group.groupproject.services.CategoryService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author filippos
 */
@Controller
@RequestMapping("/")
public class CategoryController {

    @Autowired
    CategoryService categoryservice;

    @GetMapping(value = "categories")
    public String findAllCategories(ModelMap model) {
        List<Category> categories = categoryservice.findAllCategories();
        model.addAttribute("categories", categories);
        return "/category/listofcategories";
    }

    @GetMapping(value = "categories/{categoryid}")
    public String findCategory(ModelMap model, @PathVariable("categoryid") int id) {
        Category category = categoryservice.findById(id);
        model.addAttribute("category", category);
        return "/category/showcategory";
    }

    @GetMapping("categories/formAddCategory")
    public String showFormForAdd(ModelMap model) {
        Category category = new Category();
        model.addAttribute("category", category);
        return "/category/categoryform";
    }

    @PostMapping("categories/formAddCategory")
    public String saveCategory(ModelMap model, @ModelAttribute("category") Category category) {
        String isDone;
        if (categoryservice.saveCategory(category)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/category/listofcategories";
    }

    @GetMapping("categories/formUpdateCategory/{categoryid}")
    public String showFormForUpdate(ModelMap model, @PathVariable("categoryid") int id) {
        Category category = categoryservice.findById(id);
        model.addAttribute("category", category);
        return "/category/categoryformUpdate";
    }

    @PostMapping("categories/formUpdateCategory")
    public String updateCategory(ModelMap model, @ModelAttribute("category") Category category) {
        String isDone;
        if (categoryservice.updateCategory(category)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/category/listofcategories";
    }

    @GetMapping("categories/deleteCategory/{categoryid}")
    public String deleteCategory(ModelMap model, @PathVariable("categoryid") int id) {
        Category category = categoryservice.findById(id);
        String isDone;
        if (categoryservice.deleteCategory(category)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/category/listofcategories";
    }

}
