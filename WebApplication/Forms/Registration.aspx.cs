using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication.DataLib;

namespace WebApplication.Forms
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            // Populate values from database
            using (var context = new TechnicalTestDbEntities())
            {
                LoadPreferredPronouns(context);
                LoadLevelsOfStudy(context);
                LoadDisabilities(context);
            }
        }

        protected void Submit(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            using (var context = new TechnicalTestDbEntities())
            {
                var newSubmission = new Submission
                {
                    FirstName = FirstName.Text,
                    LastName = LastName.Text,
                    Email = Email.Text,
                    PreferredPronounsId = int.Parse(PreferredPronouns.SelectedValue),
                    LevelOfStudyId = int.Parse(LevelOfStudy.SelectedValue),
                    IsInternationalStudent = InternationalStudentStatus.SelectedValue == "Yes",
                    Disabilities = new List<Disability>()

                };

                foreach (ListItem item in Disabilities.Items)
                {
                    if (item.Selected)
                    {
                        int id = int.Parse(item.Value);
                        var disability = context.Disabilities.Find(id);
                        newSubmission.Disabilities.Add(disability);
                    }
                }

                context.Submissions.Add(newSubmission);
                context.SaveChanges();

                Response.Redirect("/Forms/List");
            }
            
        }

        private void LoadPreferredPronouns(TechnicalTestDbEntities context)
        {
            var pronouns = context.PreferredPronouns.ToList();
            PreferredPronouns.DataSource = pronouns;
            PreferredPronouns.DataTextField = "Pronouns";
            PreferredPronouns.DataValueField = "PreferredPronounsId";
            PreferredPronouns.DataBind();

            // Start with nothing selected
            PreferredPronouns.Items.Insert(0, string.Empty);
        }

        private void LoadLevelsOfStudy(TechnicalTestDbEntities context)
        {
            var levels = context.LevelsOfStudies.ToList();
            LevelOfStudy.DataSource = levels;
            LevelOfStudy.DataTextField = "LevelName";
            LevelOfStudy.DataValueField = "LevelOfStudyId";
            LevelOfStudy.DataBind();

            // Start with nothing selected
            LevelOfStudy.Items.Insert(0, string.Empty);
        }

        private void LoadDisabilities(TechnicalTestDbEntities context)
        {
            var disabilities = context.Disabilities.ToList();
            Disabilities.DataSource = disabilities;
            Disabilities.DataTextField = "DisabilityName";
            Disabilities.DataValueField = "DisabilityId";
            Disabilities.DataBind();
        }
    }
}