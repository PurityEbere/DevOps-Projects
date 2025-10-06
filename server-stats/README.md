Server Stats Script

This is a simple Bash script that checks how your Linux server is performing.
It gives you a quick overview of your system resources — CPU, memory, disk usage — and also shows the top processes that are using the most CPU and memory.

What It Does

When you run the script, it shows:

Total CPU usage

Memory usage (how much is free, used, and the percentage)

Disk usage (free, used, and percentage)

Top 5 processes by CPU usage

Top 5 processes by memory usage

It’s a quick and easy way to see what’s going on inside your server without needing to open multiple tools.

 How to Use

Create the script
Open your terminal and create a file:

nano server-stats.sh


Paste the script code
Copy your server-stats.sh content into the file, then save and exit (Ctrl + O, Enter, Ctrl + X).

Make it executable

chmod +x server-stats.sh


Run it

./server-stats.sh


You’ll get an output showing your server stats in a clean format.