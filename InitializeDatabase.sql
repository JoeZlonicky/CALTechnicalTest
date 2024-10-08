CREATE TABLE PreferredPronouns (
	PreferredPronounsId INT PRIMARY KEY IDENTITY(1,1),
	Pronouns VARCHAR(20) NOT NULL
);

CREATE TABLE LevelsOfStudy (
	LevelOfStudyId INT PRIMARY KEY IDENTITY(1,1),
	LevelName VARCHAR(50) NOT NULL
);

CREATE TABLE Disabilities (
	DisabilityId INT PRIMARY KEY IDENTITY(1,1),
	DisabilityName VARCHAR(50) NOT NULL
);

CREATE TABLE Submissions (
	SubmissionId INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR(100) NOT NULL,
	LastName NVARCHAR(100) NOT NULL,
	Email NVARCHAR(255) NOT NULL,
	PreferredPronounsId INT,
	LevelOfStudyId INT NOT NULL,
	IsInternationalStudent BIT NOT NULL,
	AdditionalRequirements NVARCHAR(MAX),
	CreatedAt DATETIME DEFAULT GETDATE(),

	CONSTRAINT FK_Submissions_PreferredPronouns FOREIGN KEY (PreferredPronounsId) REFERENCES PreferredPronouns (PreferredPronounsId),
	CONSTRAINT FK_Submissions_LevelOfStudy FOREIGN KEY (LevelOfStudyId) REFERENCES LevelsOfStudy (LevelOfStudyId)
);

CREATE TABLE SubmissionDisabilities (
	SubmissionId INT,
	DisabilityId INT,
	PRIMARY KEY (SubmissionId, DisabilityId),
	CONSTRAINT FK_SubmissionDisabilities_Submissions FOREIGN KEY (SubmissionId) REFERENCES Submissions (SubmissionId),
	CONSTRAINT FK_SubmissionDisabilities_Disabilities FOREIGN KEY (DisabilityId) REFERENCES Disabilities (DisabilityId)
);

INSERT INTO PreferredPronouns (Pronouns) VALUES
('She/her'),
('He/him'),
('They/them'),
('Ze/zir'),
('Xe/xem'),
('Other');

INSERT INTO LevelsOfStudy (LevelName) VALUES
('High school graduate'),
('Undergraduate'),
('Graduate');

INSERT INTO Disabilities (DisabilityName) VALUES
('ADHD'),
('Autism'),
('Chronic illness'),
('Deaf or hard of hearing'),
('Learning disability'),
('Mental health'),
('Neurological'),
('Physical or mobility'),
('Vision'),
('Other');