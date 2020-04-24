EESchema Schematic File Version 5
EELAYER 34 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
Comment5 ""
Comment6 ""
Comment7 ""
Comment8 ""
Comment9 ""
$EndDescr
Connection ~ 5400 3500
Connection ~ 5400 4400
Connection ~ 5900 4400
Connection ~ 5900 3500
Connection ~ 5300 4400
Connection ~ 3950 4400
Connection ~ 4300 4400
Connection ~ 4650 4400
Wire Wire Line
	3500 3450 3600 3450
Wire Wire Line
	3600 3450 3600 3550
Wire Wire Line
	3600 4400 3950 4400
Wire Wire Line
	3950 4400 4300 4400
Wire Wire Line
	4300 4400 4650 4400
Wire Wire Line
	4650 3700 4900 3700
Wire Wire Line
	4650 3800 4900 3800
Wire Wire Line
	4650 3900 4900 3900
Wire Wire Line
	4650 4000 4900 4000
Wire Wire Line
	4650 4400 5300 4400
Wire Wire Line
	5300 3500 5400 3500
Wire Wire Line
	5300 4400 5400 4400
Wire Wire Line
	5400 3500 5900 3500
Wire Wire Line
	5400 4400 5900 4400
Wire Wire Line
	5900 3500 5900 3900
Wire Wire Line
	5900 3500 6300 3500
Wire Wire Line
	5900 4100 5900 4400
Wire Wire Line
	5900 4400 6300 4400
Wire Wire Line
	6300 3500 6300 3900
Wire Wire Line
	6300 4400 6300 4100
Text Label 3600 3650 2    50   ~ 0
MOSI
Text Label 3600 3750 2    50   ~ 0
CS
Text Label 4100 3650 0    50   ~ 0
MISO
Text Label 4100 3750 0    50   ~ 0
SCLK
Text Label 4650 3700 0    50   ~ 0
SCLK
Text Label 4650 3800 0    50   ~ 0
CS
Text Label 4650 3900 0    50   ~ 0
MISO
Text Label 4650 4000 0    50   ~ 0
MOSI
$Comp
L power:+3V3 #PWR0103
U 1 1 5EBDBC20
P 4100 3550
F 0 "#PWR0103" H 4100 3400 50  0001 C CNN
F 1 "+3V3" H 4115 3720 50  0000 C CNN
F 2 "" H 4100 3550 50  0001 C CNN
F 3 "" H 4100 3550 50  0001 C CNN
	1    4100 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0102
U 1 1 5EBC2AE5
P 5400 3500
F 0 "#PWR0102" H 5400 3350 50  0001 C CNN
F 1 "+3V3" H 5415 3670 50  0000 C CNN
F 2 "" H 5400 3500 50  0001 C CNN
F 3 "" H 5400 3500 50  0001 C CNN
	1    5400 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5EBDADF6
P 3500 3450
F 0 "#PWR0104" H 3500 3200 50  0001 C CNN
F 1 "GND" H 3504 3280 50  0001 C CNN
F 2 "" H 3500 3450 50  0001 C CNN
F 3 "" H 3500 3450 50  0001 C CNN
	1    3500 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5EBC37F3
P 5900 4400
F 0 "#PWR0101" H 5900 4150 50  0001 C CNN
F 1 "GND" H 5904 4230 50  0001 C CNN
F 2 "" H 5900 4400 50  0001 C CNN
F 3 "" H 5900 4400 50  0001 C CNN
	1    5900 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5EBC2CFD
P 5900 4000
F 0 "C1" H 5992 4045 50  0000 L CNN
F 1 "100n" H 5991 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5900 4000 50  0001 C CNN
F 3 "~" H 5900 4000 50  0001 C CNN
	1    5900 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5EBC3076
P 6300 4000
F 0 "C2" H 6392 4045 50  0000 L CNN
F 1 "10u" H 6391 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6300 4000 50  0001 C CNN
F 3 "~" H 6300 4000 50  0001 C CNN
	1    6300 4000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5EBE3979
P 3600 4300
F 0 "H1" H 3700 4350 50  0000 L CNN
F 1 "MountingHole_Pad" H 3700 4260 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965_Pad" H 3600 4300 50  0001 C CNN
F 3 "~" H 3600 4300 50  0001 C CNN
	1    3600 4300
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5EBE5D29
P 3950 4300
F 0 "H2" H 4050 4350 50  0000 L CNN
F 1 "MountingHole_Pad" H 4050 4260 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965_Pad" H 3950 4300 50  0001 C CNN
F 3 "~" H 3950 4300 50  0001 C CNN
	1    3950 4300
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 5EBE6A0D
P 4300 4300
F 0 "H3" H 4400 4350 50  0000 L CNN
F 1 "MountingHole_Pad" H 4400 4260 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965_Pad" H 4300 4300 50  0001 C CNN
F 3 "~" H 4300 4300 50  0001 C CNN
	1    4300 4300
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 5EBE7A8B
P 4650 4300
F 0 "H4" H 4750 4350 50  0000 L CNN
F 1 "MountingHole_Pad" H 4750 4260 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965_Pad" H 4650 4300 50  0001 C CNN
F 3 "~" H 4650 4300 50  0001 C CNN
	1    4650 4300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Top_Bottom J1
U 1 1 5EBD1757
P 3800 3650
F 0 "J1" H 3850 3850 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 3850 3875 50  0001 C CNN
F 2 "Connector_Molex:Molex_Nano-Fit_105314-xx06_2x03_P2.50mm_Horizontal" H 3800 3650 50  0001 C CNN
F 3 "~" H 3800 3650 50  0001 C CNN
	1    3800 3650
	1    0    0    -1  
$EndComp
$Comp
L BLDC:ams-as50487d U1
U 1 1 5EBBE666
P 5350 4000
F 0 "U1" H 4850 4550 60  0000 C CNN
F 1 "AS5047U" H 5000 4450 60  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 5350 4000 60  0001 C CNN
F 3 "" H 5350 4000 60  0001 C CNN
	1    5350 4000
	1    0    0    -1  
$EndComp
$EndSCHEMATC
