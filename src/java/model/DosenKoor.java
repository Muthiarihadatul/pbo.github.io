/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author LENOVO
 */
public class DosenKoor extends Model<DosenKoor>{
    private String kodeDosen;
    private String matkulKoor;
    private String kontakKoor;
    private String email;
    
    public DosenKoor() {
        this.table = "dosenkoor";
        this.primaryKey = "matkulKoor";
    }
    
    public DosenKoor(String kodeDosen, String matkulKoor, String kontakKoor, String email) {
        this.table = "dosenkoor";
        this.primaryKey = "matkulKoor";
        this.kodeDosen = kodeDosen;
        this.matkulKoor = matkulKoor;
        this.kontakKoor = kontakKoor;
        this.email = email;
    }
    
    @Override
    public DosenKoor toModel(ResultSet rs) {
        try {
            return new DosenKoor(
                this.kodeDosen = rs.getString("kodeDosen"),
                this.matkulKoor = rs.getString("matkulKoor"),
                this.kontakKoor = rs.getString("kontakKoor"),
                this.email = rs.getString("email")
            );
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }
    
    public void setKodeDosen(String kodeDosen) {
        this.kodeDosen = kodeDosen;
    }
    
    public void setMK(String kodeMK) {
        this.matkulKoor = kodeMK;
    }
    
    public void setKontak(String kontak) {
        this.kontakKoor = kontak;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public String getKodeDosen() {
        return this.kodeDosen;
    }
    
    public String getMK() {
        return this.matkulKoor;
    }
    
    public String getKontak() {
        return this.kontakKoor;
    }
    
    public String getEmail() {
        return this.email;
    }
}
