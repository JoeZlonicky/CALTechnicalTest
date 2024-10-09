using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication.DataLib;

namespace WebApplication.Forms
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string idParam = Request.QueryString["SubmissionId"];
            if (string.IsNullOrEmpty(idParam) || !int.TryParse(idParam, out int id))
            {
                Response.StatusCode = 404;
                Response.End();
                return;
            }
            LoadDetails(id);
        }

        private void LoadDetails(int submissionId)
        {
            using (var db = new TechnicalTestDbEntities())
            {
                var submission = db.Submissions.Find(submissionId);
                if (submission == null)
                {
                    Response.StatusCode = 404;
                    Response.End();
                    return;
                }
                FirstName.InnerText = submission.FirstName;
                LastName.InnerText = submission.LastName;
                Email.InnerText = submission.Email;
                PreferredPronouns.InnerText = submission.PreferredPronoun?.Pronouns ?? "N/A";
                LevelOfStudy.InnerText = submission.LevelsOfStudy.LevelName;
                InternationalStudent.InnerText = submission.IsInternationalStudent ? "Yes" : "No";

                var disabilities = submission.Disabilities.Select(d => d.DisabilityName).ToList();
                Disabilities.DataSource = disabilities;
                Disabilities.DataBind();

                if (string.IsNullOrEmpty(submission.AdditionalRequirements))
                {
                    AdditionalAccessibilityRequirements.InnerText = "N/A";
                } else
                {
                    AdditionalAccessibilityRequirements.InnerText = submission.AdditionalRequirements;
                }
                
            }
        }
    }
}