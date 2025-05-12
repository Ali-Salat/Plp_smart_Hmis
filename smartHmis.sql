USE smart_health_system_Db;

-- Table: division: where different units are placed
CREATE TABLE division (
    divisionId INT AUTO_INCREMENT PRIMARY KEY,
	divisionName VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100)
);

-- Table: specialty: expertise of doctors
CREATE TABLE specialty (
    specialtyId INT AUTO_INCREMENT PRIMARY KEY,
    specialtyName VARCHAR(100) NOT NULL UNIQUE
);
-- Table: Patients
CREATE TABLE patients (
    patientId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    gender VARCHAR(50),
    ContactNumber VARCHAR(15),
    dateOfBirth DATE NOT NULL,
    address TEXT,
    email VARCHAR(100) UNIQUE
    
    );

-- Table: Doctors: doctor records & links to division and specialty  
CREATE TABLE doctors (
    doctorId INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    specialtyId INT NOT NULL,
    divisionId INT,
    ContactNumber VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY (divisionId) REFERENCES division(divisionId),
    FOREIGN KEY (specialtyId) REFERENCES specialty(specialtyId)
    
);

-- Table: Appointments: patients with doctors and  appointment details
CREATE TABLE appointments (
    appointmentId INT AUTO_INCREMENT PRIMARY KEY,
    patientId INT NOT NULL,
    appointmentDate DATETIME NOT NULL,
    doctorId INT NOT NULL,
    priority TEXT,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patientId) REFERENCES patients(patientId),
    FOREIGN KEY (doctorId) REFERENCES doctors(doctorId)
);

-- Table: Prescriptions issued per appointment
CREATE TABLE prescriptions (
    prescriptionId INT AUTO_INCREMENT PRIMARY KEY,
    patientId INT NOT NULL,
    doctorId INT,
    appointmentId INT NOT NULL,
    Dosage VARCHAR(50),
    DateIssued DATE NOT NULL,
    FOREIGN KEY (appointmentId) REFERENCES appointments(appointmentId),
    FOREIGN KEY (PatientId) REFERENCES Patients(PatientId),
    FOREIGN KEY (doctorId) REFERENCES doctors(doctorId)
);

-- Table: MedicalRecords
   CREATE TABLE MedicalRecords(
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    appointmentId INT NOT NULL,
    Diagnosis TEXT NOT NULL,
    Treatment TEXT NOT NULL,
    DateOfEntry DATE NOT NULL,
    FOREIGN KEY (appointmentId) REFERENCES appointments(appointmentId),
    FOREIGN KEY (PatientId) REFERENCES Patients(PatientId)
);