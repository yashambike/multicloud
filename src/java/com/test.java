/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author SAII
 */
public class test {
    public static void main(String[] args) {
        System.out.println(""+new test().portinput());
    }
    public int portinput()
            {
            ArrayList ar=new ArrayList();
            ar.add("20");
            ar.add("30");
            ar.add("40");
            ar.add("50");
            ar.add("60");
            ar.add("70");
            ar.add("80");
            ar.add("90");
            Collections.shuffle(ar);
            return Integer.parseInt(ar.get(0).toString())+250;
            }
            
}
