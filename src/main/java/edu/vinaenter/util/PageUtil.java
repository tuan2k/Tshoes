package edu.vinaenter.util;

import edu.vinaenter.contant.GlobalContant;

public class PageUtil {
	
	public static int getOffset(Integer page) {
		return (page-1)*GlobalContant.TOTAL_PAGE;
	}
	
	public static int getTotalRow(int totalPage) {
		return (int)Math.ceil((float)totalPage/GlobalContant.TOTAL_PAGE);
	}

}
