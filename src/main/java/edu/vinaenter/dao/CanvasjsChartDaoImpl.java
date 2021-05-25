package edu.vinaenter.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import edu.vinaenter.models.CanvasjsChartData;
 

@Repository
public class CanvasjsChartDaoImpl implements CanvasjsChartDao {
 
	@Override
	public List<List<Map<Object, Object>>> getCanvasjsChartData() {
		return CanvasjsChartData.getCanvasjsDataList();
	}
 
}  