package com.masai.models;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.*;


@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class SellerDTO {
	
	
	@NotNull(message="Please enter your mobile Number")
	
	private String mobile;
	
	
	private String password;
	
}








//@Pattern(regexp="[A-Za-z0-9!@#$%^&*_]{8,15}", message="Please Enter a valid Password")
//@Pattern(regexp="[6789]{1}[0-9]{9}", message="Enter a valid Mobile Number")