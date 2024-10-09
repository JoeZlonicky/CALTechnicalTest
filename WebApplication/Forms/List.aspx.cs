using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication.DataLib;

namespace WebApplication.Forms
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            LoadSubmissions();
        }

        private void LoadSubmissions()
        {
            using (var context = new TechnicalTestDbEntities())
            {
                // This needs to be done in two steps since concatenating the disabilities can only be done once the data is loaded
                // Otherwise there is an error due to the LINQ expression not being convertable to SQL
                var data = context.Submissions.Select(s => new
                {
                    s.SubmissionId,
                    s.FirstName,
                    s.LastName,
                    s.Email,
                    s.LevelsOfStudy.LevelName,
                    DisabilityNames = s.Disabilities.Select(d => d.DisabilityName),
                    s.AdditionalRequirements
                }).OrderBy(s => s.SubmissionId).ToList().Select(s => new
                {
                    s.SubmissionId,
                    s.FirstName,
                    s.LastName,
                    s.Email,
                    s.LevelName,
                    Disabilities = ConcatDisabilityNames(s.DisabilityNames),
                    AdditionalRequirements = LimitStringLength(s.AdditionalRequirements, 200)
                }).ToList();

                SubmissionsTable.DataSource = data;
                SubmissionsTable.DataBind();
            }

            foreach (GridViewRow row in SubmissionsTable.Rows)
            {
                var submissionId = SubmissionsTable.DataKeys[row.RowIndex].Value.ToString();
                var viewDetailsButton = (Button)row.FindControl("ViewDetails");
                viewDetailsButton.PostBackUrl = $"/Forms/Details?SubmissionId={submissionId}";
                viewDetailsButton.Attributes["aria-label"] = $"View details for submission {submissionId}";
            }
        }
        static string ConcatDisabilityNames(IEnumerable<string> disabilityNames)
        {
            if (disabilityNames.Count() <= 3) { 
                return string.Join(", ", disabilityNames);
            }

            var firstThree = string.Join(", ", disabilityNames.Take(3));
            return firstThree + ", ...";
        }

        static string LimitStringLength(string s, int maxLength)
        {
            if (s != null && s.Length > maxLength)
            {
                return s.Substring(0, maxLength) + "...";
            }
            return s;
        }
    }
}