package com.bit.lib.service;

import java.util.List;

import com.bit.lib.dto.ReserveListDTO;

public interface ReserveService {

	
	void insertReserve(String id, List<String> chknos);
	void insertReserveup(List<String> chknos);
	
	List<ReserveListDTO> getReserveList(String id);
	
	void reserveCancel(List<String> bookNo);
	void reserveCancelup(List<String> bookNo);
	
}