package edu.poly.entity;

import java.io.Serializable;
import java.util.List;

import org.hibernate.validator.constraints.Length;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
@Entity
@Table(name = "Categories")
public class Category implements Serializable{
	@Id
	@Length(min = 4, max = 4)
	private String id;
	@NotBlank
	private String name;
	@Column(name = "is_delete")
	private Boolean isDelete = false;
	@OneToMany(mappedBy = "category")
	private List<Product> products;
}
