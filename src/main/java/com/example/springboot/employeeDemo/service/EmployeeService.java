package com.example.springboot.employeeDemo.service;

import java.util.List;

import com.example.springboot.employeeDemo.entity.Employee;

public interface EmployeeService {

	List<Employee> findAll();
	
	Employee findById(int theId);
	
	void save(Employee theEmployee);
	
	void deleteById(int theId);
	
}
