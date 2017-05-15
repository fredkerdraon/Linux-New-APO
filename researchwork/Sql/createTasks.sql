create table tasks(
        ID int,
        Task varchar(25),
        Weight real,
        Complexity real,
        Duration real,
        Status varchar(25),
        Project varchar(25),
        StartDate datetime,
        EndDate datetime,
        TheoStart datetime,
        TheoEnd datetime,
        Deliverable varchar(25),
        Dependency int,
        Resource int
);
