package com.eatit.businessController;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eatit.businessService.DeliveryService;

@Controller
@RequestMapping(value = "/deliverys/*")
public class DeliveryController {

	private static final Logger logger = LoggerFactory.getLogger(DeliveryController.class);	
	
	@Inject
	private DeliveryService oService;

}
