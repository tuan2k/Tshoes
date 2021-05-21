package edu.vinaenter.services;

import java.util.List;

public interface ICRUDService<T> {
	
	List<T> getAll();
	
	int edit(T t);
	
	int save(T t);
	
	int deleteById(int id);
	
	T getById(int id);
	
	T findOne(T t);
}
