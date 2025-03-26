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
public class Course_Mahasiswa extends Model<Course_Mahasiswa>{
    private String kodeMatkul;
    private int nim;
    
    public Course_Mahasiswa() {
        this.table = "course_mahasiswa";
        this.primaryKey = "nim";
    }
    
    public Course_Mahasiswa(String kodeMatkul, int nim) {
        this.table = "course_mahasiswa";
        this.primaryKey = "nim";
        this.kodeMatkul = kodeMatkul;
        this.nim = nim;
    }
    
    public Course_Mahasiswa toModel(ResultSet rs) {
        try {
            return new Course_Mahasiswa(
                this.kodeMatkul = rs.getString("kodeMatkul"),
                this.nim = rs.getInt("nim")
            );
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }
    
    public void setKodeMK(String kodeMK) {
        this.kodeMatkul = kodeMK;
    }
    
    public void setNIM(int nim) {
        this.nim = nim;
    }
    
    public String getKodeMK() {
        return this.kodeMatkul;
    }
    
    public int getNIM() {
        return this.nim;
    }
}
