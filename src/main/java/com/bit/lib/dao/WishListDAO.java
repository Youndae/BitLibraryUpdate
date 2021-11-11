package com.bit.lib.dao;

import java.util.List;

import org.springframework.web.bind.annotation.SessionAttribute;

import com.bit.lib.dto.RentDTO;
import com.bit.lib.dto.WishListDTO;

public interface WishListDAO {
	List<WishListDTO> selectWishList(@SessionAttribute("id") String id);
	void addWishList(WishListDTO wishListDTO);
	void deleteWishList(int wishListCode); 
	//예약
	void addReserve(RentDTO rentDTO); 
	void updateStatus(RentDTO rentDTO);
	//대여
	void bookRent(RentDTO rentDTO);
	void bookstUpdate(RentDTO rentDTO);

}
