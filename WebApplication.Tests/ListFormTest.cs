using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using WebApplication.Forms;

namespace WebApplication.Tests
{
    [TestClass]
    public class ListFormTest
    {
        [TestMethod]
        public void ConcatDisabilityNames_EmptyList()
        {
            var disabilityNames = new List<string>();
            var expected = "";

            var result = List.ConcatDisabilityNames(disabilityNames);

            Assert.AreEqual(result, expected);
        }

        [TestMethod]
        public void ConcatDisabilityNames_NormalConcat()
        {
            var disabilityNames = new List<string> { "A", "B", "C"};
            var expected = "A, B, C";

            var result = List.ConcatDisabilityNames(disabilityNames);

            Assert.AreEqual(result, expected);
        }

        [TestMethod]
        public void ConcatDisabilityNames_Truncation()
        {
            var disabilityNames = new List<string>() { "A", "B", "C", "D", "E"};
            var expected = "A, B, C, ...";

            var result = List.ConcatDisabilityNames(disabilityNames);

            Assert.AreEqual(result, expected);
        }

        [TestMethod]
        public void LimitStringLength_GracefulWithNullString()
        {
            string s = null;
            int limit = 10;
            string expected = null;

            var result = List.LimitStringLength(s, limit);

            Assert.AreEqual(result, expected);
        }

        [TestMethod]
        public void LimitStringLength_UnderLimit()
        {
            string s = "ABC";
            int limit = 10;
            string expected = "ABC";

            var result = List.LimitStringLength(s, limit);

            Assert.AreEqual(result, expected);
        }

        [TestMethod]
        public void LimitStringLength_OverLimit()
        {
            string s = "ABCDEFGHI";
            int limit = 5;
            string expected = "ABCDE...";

            var result = List.LimitStringLength(s, limit);

            Assert.AreEqual(result, expected);
        }
    }
}
