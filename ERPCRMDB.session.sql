--@block
-- Accounts -- 
ALTER TABLE Accounts
ADD PRIMARY KEY (AccountID)

--@block
-- Leads --
ALTER TABLE Leads
ADD PRIMARY KEY (LeadID),
MODIFY LeadID INT AUTO_INCREMENT,
ADD FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID),
ADD FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)

--@block
-- Clients --
ALTER TABLE Clients
ADD PRIMARY KEY (ClientID),
ADD UNIQUE (License);

--@block
-- Users --
ALTER TABLE Users
ADD PRIMARY KEY (UserID),
MODIFY UserID INT AUTO_INCREMENT,
ADD UNIQUE (Email);

--@block
DELETE FROM Clients WHERE ClientID = 100010

--@block
-- Opportunities --
ALTER TABLE Opportunities
ADD PRIMARY KEY (OpportunityID),
ADD FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID),
ADD FOREIGN KEY (LeadID) REFERENCES Leads(LeadID),
ADD FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
MODIFY OpportunityID INT AUTO_INCREMENT;

--@block
-- Sales --
ALTER TABLE Sales
ADD PRIMARY KEY (SaleID),
ADD FOREIGN KEY (OpportunityID) REFERENCES Opportunities(OpportunityID),
ADD FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
MODIFY SaleID INT AUTO_INCREMENT;

--@block
-- Orders --
ALTER TABLE Orders
ADD PRIMARY KEY (OrderID),
ADD FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID);

--@block
ALTER TABLE OrderDetails
ADD PRIMARY KEY (OrderDetailID),
ADD FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);

--@block
ALTER TABLE SupportTickets
ADD PRIMARY KEY (TicketID),
ADD FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID),
ADD FOREIGN KEY (ContactID) REFERENCES Contacts(ContactID)


--@block
INSERT INTO Clients VALUES (100100, 'Demo', '8a86f6082c7249d18c65', 1, 1)


--@block
ALTER TABLE Leads
ADD PRIMARY KEY (LeadID)

--@block
UPDATE Users
SET License = '9b2a012a1a1c425a8c86'
WHERE (ClientID=100000)

--@block
ALTER TABLE Leads
ADD FOREIGN KEY (CreatedBy) REFERENCES Users(Email)

--@block
DELETE FROM Sales

--@block
DROP TABLE alembic_version

--@block
