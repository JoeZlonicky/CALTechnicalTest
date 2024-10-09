using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication.DataLib;

namespace WebApplication.Forms
{
    public partial class Registration : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            // Populate values from database
            await Task.WhenAll(
                LoadPreferredPronouns(),
                LoadLevelsOfStudy(),
                LoadDisabilities()
            );
        }

        protected void Submit(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            
            var selectedPronouns = PreferredPronounsInput.SelectedValue;
            int? preferredPronounsId = null;
            if (!string.IsNullOrEmpty(selectedPronouns))
            {
                preferredPronounsId = int.Parse(selectedPronouns);
            }

            var levelOfStudyId = int.Parse(LevelOfStudyInput.SelectedValue);
            var isInternationalStudent = InternationalStudentInput.SelectedValue == "Yes";

            using (var context = new TechnicalTestDbEntities())
            {
                var disabilities = GetSelectedDisabilities(context);
                var newSubmission = new Submission
                {
                    FirstName = FirstNameInput.Text,
                    LastName = LastNameInput.Text,
                    Email = EmailInput.Text,
                    PreferredPronounsId = preferredPronounsId,
                    LevelOfStudyId = levelOfStudyId,
                    IsInternationalStudent = isInternationalStudent,
                    Disabilities = disabilities,
                    AdditionalRequirements= AdditionalAccessibilityInput.Text
                };

                context.Submissions.Add(newSubmission);
                context.SaveChanges();

                Response.Redirect("/Forms/List");
            }
        }

        protected void ValidateFullNamesMatch(object source, ServerValidateEventArgs args)
        {
            args.IsValid = FullNameInput.Text == ConfirmFullNameInput.Text;
        }

        protected void ValidateDisabilitySelected(object source, ServerValidateEventArgs args)
        {
            foreach (ListItem item in DisabilitiesInput.Items)
            {
                if (item.Selected)
                {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = false;
        }

        async Task LoadPreferredPronouns()
        {
            using (var context = new TechnicalTestDbEntities())
            {
                await BindListData(PreferredPronounsInput, context.PreferredPronouns, "Pronouns", "PreferredPronounsId");
            }
        }

        async Task LoadLevelsOfStudy()
        {
            using (var context = new TechnicalTestDbEntities())
            {
                await BindListData(LevelOfStudyInput, context.LevelsOfStudies, "LevelName", "LevelOfStudyId");
            }
        }

        async Task LoadDisabilities()
        {
            using (var context = new TechnicalTestDbEntities())
            {
                await BindListData(DisabilitiesInput, context.Disabilities, "DisabilityName", "DisabilityId");
            }
        }

        async Task BindListData(ListControl control, DbSet dbSet, string textField, string valueField)
        {
            var data = await dbSet.ToListAsync();
            control.DataSource = data;
            control.DataTextField = textField;
            control.DataValueField = valueField;
            control.DataBind();
        }

        List<Disability> GetSelectedDisabilities(TechnicalTestDbEntities context)
        {
            var disabilities = new List<Disability>();
            foreach (ListItem item in DisabilitiesInput.Items)
            {
                if (item.Selected)
                {
                    int id = int.Parse(item.Value);
                    var disability = context.Disabilities.Find(id);
                    disabilities.Add(disability);
                }
            }
            return disabilities;
        }
    }
}