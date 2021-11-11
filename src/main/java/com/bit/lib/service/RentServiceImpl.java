package com.bit.lib.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.lib.dao.RentDAO;
import com.bit.lib.dto.RentDTO;

@Service("rentService")
public class RentServiceImpl implements RentService {

	@Autowired
	private RentDAO rentDAO;

	@Override
	public List<RentDTO> getRentHistoryList(String id) {
		return rentDAO.getRentHistoryList(id);
	}

	@Override
	public List<RentDTO> selectRentNow(String id) {

		return rentDAO.selectRentNow(id);
	}

	@Override
	public void renew(List<String> chknos) {

		for (String chkno : chknos) {
			System.out.println(chkno + "////chkno");
			String bookNo = chkno;
			System.out.println(bookNo + "////bookNo");
			rentDAO.renew(bookNo);
		}
	}
		
	@Override
	public void bookReturn(List<String> chknos) { 

		for (String chkno : chknos) {
			System.out.println(chkno + "////chkno");
			String bookNo = chkno;
			System.out.println(bookNo + "////bookNo");
			rentDAO.bookReturn(bookNo);
		}
	}
	@Override
	public void updateReserveFin(List<String> chknos) {
		for (String chkno : chknos) {
			System.out.println(chkno + "////chkno");
			String bookNo = chkno;
			System.out.println(bookNo + "////bookNo");
			rentDAO.updateReserveFin(bookNo);
		}

	}
	
	@Override
	public void bookRent(List<String> chknos, String id) {
		// TODO Auto-generated method stub
		String bookNo = chknos.get(0).toString();
		System.out.println(bookNo + "///" + id + "rent");
		rentDAO.bookRent(bookNo, id);
	}

	@Override
	public void bookstUpdate(List<String> chknos) {
		// TODO Auto-generated method stub
		String bookNo = chknos.get(0).toString();
		System.out.println(bookNo + "rentup");
		rentDAO.bookstUpdate(bookNo);
	}

	@Override
	public void reserveCancel(List<String> chknos) {
		String bookNo = chknos.get(0).toString();

		rentDAO.reserveCancel(bookNo);
	}

	

}
