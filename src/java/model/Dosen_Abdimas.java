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
public class Dosen_Abdimas extends Model<Dosen_Abdimas>{
    private String kodeDosen;
    private int kodeAbdimas;
    
    public Dosen_Abdimas() {
        this.table = "dosen_abdimas";
        this.primaryKey = "kodeAbdimas";
    }
    
    public Dosen_Abdimas(String kodeDosen, int kodeAbdimas) {
        this.table = "dosen_abdimas";
        this.primaryKey = "kodeAbdimas";
        this.kodeDosen = kodeDosen;
        this.kodeAbdimas = kodeAbdimas;
    }
    
    @Override
    public Dosen_Abdimas toModel(ResultSet rs) {
        try {
            return new Dosen_Abdimas(
                this.kodeDosen = rs.getString("kodeDosen"),
                this.kodeAbdimas = rs.getInt("kodeAbdimas")
            );
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }
    
    public void setKodeDosen(String kodeDosen) {
        this.kodeDosen = kodeDosen;
    }
    
    public void setKodeAbdimas(int kodeAbdimas) {
        this.kodeAbdimas = kodeAbdimas;
    }
    
    public String getKodeDosen() {
        return this.kodeDosen;
    }
    
    public int getKodeAbdimas() {
        return this.kodeAbdimas;
    }
}
