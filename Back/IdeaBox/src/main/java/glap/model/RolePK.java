package glap.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the role database table.
 * 
 */
@Embeddable
public class RolePK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="idee_id", insertable=false, updatable=false, unique=true, nullable=false)
	private int ideeId;

	@Column(name="membre_id", insertable=false, updatable=false, unique=true, nullable=false)
	private int membreId;

	public RolePK() {
	}
	public int getIdeeId() {
		return this.ideeId;
	}
	public void setIdeeId(int ideeId) {
		this.ideeId = ideeId;
	}
	public int getMembreId() {
		return this.membreId;
	}
	public void setMembreId(int membreId) {
		this.membreId = membreId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof RolePK)) {
			return false;
		}
		RolePK castOther = (RolePK)other;
		return 
			(this.ideeId == castOther.ideeId)
			&& (this.membreId == castOther.membreId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.ideeId;
		hash = hash * prime + this.membreId;
		
		return hash;
	}
}