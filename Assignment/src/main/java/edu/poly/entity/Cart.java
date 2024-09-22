package edu.poly.entity;

import edu.poly.key.CartKey;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "Carts")
public class Cart {
	@EmbeddedId
	private CartKey id;
	
	@ManyToOne
    @MapsId("username")
	@JoinColumn(name = "username")
	private Account accountCart;
	
	@ManyToOne
    @MapsId("productId")
	@JoinColumn(name = "productId")
	private Product productCart;
	private int quantity;
}
