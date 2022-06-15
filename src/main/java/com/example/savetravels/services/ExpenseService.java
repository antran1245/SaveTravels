package com.example.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.savetravels.models.Expense;
import com.example.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	private final ExpenseRepository expenseRepository;
	
	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;
	}
	
	public List<Expense> allExpenses() {
		return expenseRepository.findAll();
	}
	
	public Expense createExpense(Expense expense) {
		return expenseRepository.save(expense);
	}
	
	public Expense findOneExpense(Long id) {
		Optional<Expense> optionalExpense = expenseRepository.findById(id);
		if(optionalExpense.isPresent()) {
			return optionalExpense.get();
		}
		return null;
	}
	
	public Expense updateExpense(Expense expense) {
		Optional<Expense> optionalExpense = expenseRepository.findById(expense.getId());
		if(optionalExpense.isPresent()) {
			Expense newExpense = optionalExpense.get();
			newExpense.setName(expense.getName());
			newExpense.setAmount(expense.getAmount());
			newExpense.setDescription(expense.getDescription());
			newExpense.setVendor(expense.getVendor());
			return newExpense;
		} else {
			return null;
		}
	}
	
	public void deleteExpense(Long id) {
		expenseRepository.deleteById(id);
	}
}
