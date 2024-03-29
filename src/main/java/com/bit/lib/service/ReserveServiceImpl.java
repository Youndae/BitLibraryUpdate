package com.bit.lib.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.lib.dao.ReserveDAO;
import com.bit.lib.dto.ReserveListDTO;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService {

	
	@Autowired(required=false)
	private ReserveDAO reserveDao;
	

	
	
	public List<ReserveListDTO> getReserveList(String id) {
		return reserveDao.getReserveList(id);
	}

	@Override
	public void reserveCancel(List<String> bookNo) {
		// TODO Auto-generated method stub

		for(int i = 0; i < bookNo.size(); i++){

			String bookNum = bookNo.get(i);

			reserveDao.reserveCancel(bookNum);
		}


	}

	@Override
	public void reserveCancelup(List<String> bookNo) {
		// TODO Auto-generated method stub
		
		for(int i = 0; i < bookNo.size(); i++){

			String bookNum = bookNo.get(i);

			reserveDao.reserveCancelup(bookNum);
		}
	}
	



	


}