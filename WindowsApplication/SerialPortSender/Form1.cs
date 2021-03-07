using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;

namespace SerialPortSender
{
    public partial class Form1 : Form
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

        private BackgroundWorker backgroundWorker = new BackgroundWorker();

        private bool isBwStopped = false;

        private SerialPort firstSerialPort;
        private SerialPort secondSerialPort;

        public Form1()
        {
            InitializeComponent();
            InitializeBackgroundWorker();
        }

        private void InitializeBackgroundWorker()
        {
            backgroundWorker.WorkerSupportsCancellation = true;
            backgroundWorker.WorkerReportsProgress = true;
            backgroundWorker.DoWork += BackgroundWorker_DoWork;
        }

        private void BackgroundWorker_DoWork(object sender, DoWorkEventArgs e)
        {
            while(!e.Cancel)
            {
                if(isBwStopped)
                {
                    e.Cancel = true;
                }

                if(firstSerialPort.IsOpen)
                {
                    firstSerialPort.Write(new string(Enumerable.Repeat(chars, 1500).Select(s => s[new Random().Next(s.Length)]).ToArray()));
                }
            }
        }

        private void btnOpen_Click(object sender, EventArgs e)
        {
            firstSerialPort = new SerialPort(cmbSerialPort.SelectedItem.ToString(), 2400);
            firstSerialPort.Open();
        }

        private void btnSend_Click(object sender, EventArgs e)
        {
            if(btnSend.Text == "Send")
            {
                isBwStopped = false;
                backgroundWorker.RunWorkerAsync();
                btnSend.Text = "Stop";
            } else
            {
                isBwStopped = true;
                btnSend.Text = "Send";
            }
        }
    }
}
