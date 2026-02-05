# Cailar & Carla: Interactive Color Learning IoT
**Bachelor Graduation Project | Sep 2020 - Dec 2021**

---

## Repository Structure
This repository contains the complete source code for both the hardware and software components of the project:

* **/CC_APP**: Contains the **Flutter** source code for the interactive mobile learning interface.
* **/CC_ESP32.ino**: Contains the **ESP32 (NodeMCU32S)** firmware written in **Arduino** for color sensing and Bluetooth transmission.
* **/Circuit_Diagram.png**: Project schematics and technical wiring diagrams illustrating the integration of the 9V power system, LED light reinforcement, and sensor modules.

---

## System Architecture & Workflow
Cailar & Carla is a bridge between physical play and digital learning. The system operates through a seamless integration of hardware and software:

1.  **Sensing (Hardware)**: The **TCS34725 sensor** captures RGB values from the physical environment.
2.  **Processing (Edge)**: The **NodeMCU32S (ESP32)** processes raw sensor data into standardized color information.
3.  **Communication**: Data is transmitted in real-time via **Bluetooth** to the user's smartphone.
4.  **Interaction (Software)**: The **Flutter App** receives the data and triggers storytelling animations and gamified feedback.

---

## Hardware Design Highlights

<p align="center">
  <img src="Circuit_Diagram.png" width="600" title="Circuit Diagram">
</p>

* **Environmental Adaptability**: The integrated **LED Light Reinforcement** compensates for insufficient ambient light.
* **Power Efficiency**: The circuit uses a step-down module to convert 9V input into the precise voltage required for the ESP32 and sensors, ensuring long-term stability.
* **Low-Latency Feedback**: The system is optimized to transmit sensed data to the **Flutter App** immediately upon button press, creating a responsive learning loop for children.

---

## Tech Stack

### **Hardware / Firmware**
* **Controller**: ESP32 (NodeMCU32S).
* **Sensor**: TCS34725 Color Sensor.
* **Environment**: Arduino IDE (C/C++).
* **Protocol**: Bluetooth Low Energy (BLE).

### **Software / Mobile**
* **Framework**: Flutter (Dart).
* **UI/UX Design**: Adobe Illustrator.

---

## Key Features
* **Tangible Interaction**: A plush-covered device that encourages children (**ages 7–11**) to explore their surroundings physically.
* **Gamified Pedagogy**: Transforms abstract color theory into an engaging story-driven game.
* **Full-Stack Implementation**: Managed the end-to-end data pipeline from physical hardware sensors to a high-level mobile UI, ensuring seamless data flow and system stability.