package com.example.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.savetravels.models.Expense;
import com.example.savetravels.services.ExpenseService;

@Controller
public class ExpenseController {
	@Autowired
	ExpenseService expenseService;
	
	@RequestMapping("/")
	public String index() {
		return "redirect:/expense";
	}
	
	@RequestMapping("/expense")
	public String display(@ModelAttribute("expense") Expense expense, Model model) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "index.jsp";
	}
	
	@RequestMapping(value="/addExpense", method=RequestMethod.POST)
	public String addExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if(result.hasErrors()) {
			return "index.jsp";
		}
		expenseService.createExpense(expense);
		return "redirect:/expense";
	}
	
	@RequestMapping("/expense/edit/{id}")
	public String editExpense(@PathVariable("id") Long id, Model model) {
		Expense expense = expenseService.findOneExpense(id);
		model.addAttribute("expense", expense);
		return "edit.jsp";
	}
	
	@RequestMapping(value="/expense/edit/{id}/edited", method=RequestMethod.POST)
	public String edited(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		Expense editExpense = expenseService.updateExpense(expense);
		expenseService.createExpense(editExpense);
		return "redirect:/expense";
	}
}
