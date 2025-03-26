/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
public class Dosen extends Model<Dosen> {

    protected String kode;
    private String nama;
    private String fakultas;
    private String password;
    
    public Dosen() {
        this.table = "dosen";
        this.primaryKey = "kode";
    }
    
    public Dosen(String kode, String nama, String fakultas, String password) {
        this.table = "dosen";
        this.primaryKey = "kode";
        this.kode = kode;
        this.nama = nama;
        this.fakultas = fakultas;
        this.password = password;
    }
    
    @Override
    public Dosen toModel(ResultSet rs) {
        try {
            return new Dosen(
                this.kode = rs.getString("kode"),
                this.nama = rs.getString("nama"),
                this.fakultas = rs.getString("fakultas"),
                this.password = rs.getString("password")
            );
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }
    
    public void setKode(String kode) {
        this.kode = kode;
    }
    
    public void setNama(String nama) {
        this.nama = nama;
    }
    
    public void setFakultas(String fakultas) {
        this.fakultas = fakultas;
    }
    
    public void setpassword(String password) {
        this.password = password;
    }
    
    public String getKode(){
        return this.kode;
    }
    
    public String getNama() {
        return this.nama;
    }
}
