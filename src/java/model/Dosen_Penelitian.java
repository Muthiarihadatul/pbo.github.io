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
public class Dosen_Penelitian extends Model<Dosen_Penelitian>{
    private String kodeDosen;
    private int kodePenelitian;
    
    public Dosen_Penelitian() {
        this.table = "dosen_penelitian";
        this.primaryKey = "kodePenelitian";
    }
    
    public Dosen_Penelitian(String kodeDosen, int kodePenelitian) {
        this.table = "dosen_penelitian";
        this.primaryKey = "kodePenelitian";
        this.kodeDosen = kodeDosen;
        this.kodePenelitian = kodePenelitian;
    }
    
    @Override
    public Dosen_Penelitian toModel(ResultSet rs) {
        try {
            return new Dosen_Penelitian(
                this.kodeDosen = rs.getString("kodeDosen"),
                this.kodePenelitian = rs.getInt("kodePenelitian")
            );
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }
    
    public void setKodeDosen(String kodeDosen) {
        this.kodeDosen = kodeDosen;
    }
    
    public void setKodePenelitian(int kodePenelitian) {
        this.kodePenelitian = kodePenelitian;
    }
    
    public String getKodeDosen() {
        return this.kodeDosen;
    }
    
    public int getKodePenelitian() {
        return this.kodePenelitian;
    }
}
