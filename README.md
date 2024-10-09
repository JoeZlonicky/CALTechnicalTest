# CAL Application
An ASP.NET Web Form application for submitting and viewing CAL registration details. Uses Entity Framework (database-first).

## Running
Requirements:
* Visual Studio (developed with 2022)
* .NET Framework 4.8
* SQL Server (developed with SQL Server 2022 Developer)

Setup:
* Database needs to be named `TechnicalTestDb` and tables need to be set-up using `InitializeDatabase.sql`.
* SQL Server needs to be running.
* The connectionString in `WebApplication/Web.config` needs to be configured.
  * `data source=...` will need to be updated at the very least.

Running:
* Run in Visual Studios

## WCAG
Used [w3.org](https://www.w3.org/TR/WCAG20-TECHS/) as reference.
The following was taken into consideration regarding accessability:
* Every `input` element has a matching `label` element (H44).
* Registration form is fully navigatable and editable using only keyboard (G202).
* Required fields are marked with an asterisk (H90).
	* This convention is declared at the top of the form.
	* Each asterisk is an abbreviation with a "required" title.
	* Asterisk size is increased for those with impaired vision.
* The first element insides each fieldset is a `legend` element (H71).
* Text identifies required fields that were not completed (G83).
* Text identifies when email falls outside accepted format (G85).
* Client-side validation is performed on all fields (SCR18).
* Submission list uses table markup to present tabular information (H51)
	* Zebra table styling is used to improved readability
* Responsive design maintains functionality at 200% zoom (G142)
* Used browser tools to ensure every page meets text contrast criteria (G18)

## Implementation
**Database:**
* Created SQL database initialization script
	* `Submissions` table stores submission information
	* `Disabilities` table stores disability names
	* `PreferredPronouns` table stores pronouns
	* `LevelsOfStudy` table stores education levels
	* Foreign key constraints
	* Populate `Disabilities`, `PreferredPronouns`, and `LevelsOfStudy` for form options
* Configured Entity Framework as an ORM using database-first

**Default page:**
* Updated card container to be responsive for mobile screens
* Updated button text to improve clarity
* Updated application name

**Registration page:**
* Added required fields explanation for a11y.
* Added section for personal information.
* Added email regex validation.
* Populate preferred pronouns dropdown list from database table.
	* **Assumption:** Field not marked as required to match task breakdown.
* Populate level of study dropdown list from database table.
* Added international student status radio buttons.
* **Assumption:**  didn't match field name exactly for the sake of improved clarity.
* Populate disability information checkbox list from database table.
	* Implemented custom server-side and client-side validation to ensure at least one is selected.
* Added additional accessibility requirements multi-line textbox.
* Added consent section.
	* **Assumption:** Used CAL intake form as a reference for contact information.
* Added custom validation to check that full name and confirm full name are equal.
* Added required validation to all required fields.
* Submit creates a new submission record and redirects to submission list.

**Submission list page:**
* Added responsive table to list basic submission information.
* Added "View Details" action for each row
	* **Assumption:** I labelled them "View Details" instead of "View" to improve clarity.
* Implemented a limit of 3 disabilities before an ellipses is used, to keep table concise since "View Details" shows the full list.
* Implemented a 200 character limit on additional requirements before an ellipses is used.
* Add a "New Application" button that goes to registration page.

**Details page:**
* **Assumption:** I didn't display a "full populated form" per-say, rather it just shows all the information in a formatted view. If I had more time I would have matched this idea closer and/or double-checked what the expected result of this feature is.
* Uses query parameter to fetch and display all submission data.
* Sends a 404 status if query parameter is missing/invalid.
	* If I had more time I would have liked to have a proper 404 page.

**Tests:**
* As of now, none were implemented.