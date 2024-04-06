package com;


import java.net.Socket;

class FTPClient
{
    public static void main(String args[]) throws Exception
    {
        Socket soc=new Socket("192.168.1.14",21);
        transferfileClient t=new transferfileClient(soc);
        t.displayMenu();
        
    }
}