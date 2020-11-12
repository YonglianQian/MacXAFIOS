using NUnit.Framework;
using System;
namespace NUnitTest
{
    [TestFixture()]
    public class Test
    {
        [Test()]
        public void TestCase()
        {
            Assert.AreEqual(1, 1, "haha");
        }
    }
}
