package com.eatit.domain;

import lombok.Data;

@Data
public class ProductVO {
   private int product_no;
   private String product_code;
   private String product_name;
   private String product_category;
   private String company_no;
   private String product_unit;
   private String product_price;
   private String recipe;
   
}
