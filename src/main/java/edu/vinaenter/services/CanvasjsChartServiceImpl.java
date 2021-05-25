package edu.vinaenter.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.dao.CanvasjsChartDaoImpl;
import edu.vinaenter.dao.OrderDAO;
import edu.vinaenter.models.Order;
 
 
@Service
public class CanvasjsChartServiceImpl implements CanvasjsChartService {
	
	static Map<Object,Object> map = null;
	static List<List<Map<Object,Object>>> list = new ArrayList<List<Map<Object,Object>>>();
	static List<Map<Object,Object>> dataPoints1 = new ArrayList<Map<Object,Object>>();
 
	@Autowired
	private CanvasjsChartDaoImpl canvasjsChartDao;
	
	@Autowired OrderDAO orderDAO;
 
	public void setCanvasjsChartDao(CanvasjsChartDaoImpl canvasjsChartDao) {
		this.canvasjsChartDao = canvasjsChartDao;
	}
 
	@Override
	public List<List<Map<Object, Object>>> getCanvasjsChartData() {
		return canvasjsChartDao.getCanvasjsChartData();
	}
	
	public List<List<Map<Object,Object>>> getDataChart(int year){
		List<Integer> revenue = new ArrayList<Integer>();
		for (int i=1;i<=12;i++) {
			List<Order> listOrders = orderDAO.GetByMonthAndYear(i,year);
			int total = 0;
			for (Order o : listOrders) {
				total += o.getTotal();
			}
			revenue.add(total);
		}
		int min,max;
		min = revenue.get(0);
		max = revenue.get(0);
		for (int i=1;i<=11;i++) {
			if ( min > revenue.get(i)) {
				min = revenue.get(i);
			}
			if (max < revenue.get(i)) {
				max = revenue.get(i);
			}
		}
		for (int i=1;i<=12;i++) {
			map = new HashMap<Object,Object>(); map.put("x", i); map.put("y", revenue.get(i-1));
			if (revenue.get(i-1) == min ) {
				map.put("indexLabel", "Lowest");
			}
			if (revenue.get(i-1) == max) {
				map.put("indexLabel", "Highest");
			}
			dataPoints1.add(map);
		}
		
		list.add(dataPoints1);
		return list;
		
	}
 
}  