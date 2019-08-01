package com.group.groupproject.controllers;

import com.group.groupproject.entities.Category;
import com.group.groupproject.services.CategoryService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
@RequestMapping("/categories/")
public class CategoryController {

    @Autowired
    private CategoryService categoryservice;

    @GetMapping
    public String findAllCategories(ModelMap model, @ModelAttribute("isDone") String isDone) {
        List<Category> categories = categoryservice.findAllCategories();
        model.addAttribute("categories", categories);
        return "category/listofcategories";
    }

    @GetMapping("{categoryid}")
    public String findCategory(ModelMap model, @PathVariable("categoryid") int id) {
        Category category = categoryservice.findById(id);
        model.addAttribute("category", category);
        return "category/showcategory";
    }

    @GetMapping("formAddCategory")
    public String showFormForAdd(ModelMap model) {
        Category category = new Category();
        model.addAttribute("categ", category);
        return "category/categoryform";
    }

    @PostMapping("formAddCategory")
    public String saveCategory(ModelMap model, @Valid @ModelAttribute("categ") Category category, BindingResult result) {
        if (result.hasErrors()){
            return "category/categoryform";
        }
        String isDone;
        if (categoryservice.saveCategory(category)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/categories/";
    }

    @GetMapping("formUpdateCategory/{categoryid}")
    public String showFormForUpdate(ModelMap model, @PathVariable("categoryid") int id) {
        Category category = categoryservice.findById(id);
        model.addAttribute("categ", category);
        return "category/categoryformUpdate";
    }

    @PostMapping("formUpdateCategory")
    public String updateCategory(ModelMap model, @Valid @ModelAttribute("categ") Category category, BindingResult result) {
        if (result.hasErrors()){
            return "category/categoryformUpdate";
        }
        String isDone;
        if (categoryservice.updateCategory(category)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/categories/";
    }

    @GetMapping("deleteCategory/{categoryid}")
    public String deleteCategory(ModelMap model, @PathVariable("categoryid") int id) {
        Category category = categoryservice.findById(id);
        String isDone;
        if (categoryservice.deleteCategory(category)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/categories/";
    }

}
