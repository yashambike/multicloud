package com;


import java.net.Socket;

class FTPClient
{
    public static void main(String args[]) throws Exception
    {

        try{
        FTPClient.start("192.168.1.14","sham.txt",1);
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public static void start(String ip,String fname,int ch)
    {
        try{
        Socket soc=new Socket(ip,21);
        transferfileClient t=new transferfileClient(soc);
        t.displayMenu(ch,fname);
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}