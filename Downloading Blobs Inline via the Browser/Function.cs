public async Task<FileStreamResult> View(string container, string file) {

    // Get the file from storage
    var storageAccount = CloudStorageAccount.Parse("<connection string>");
    var blobClient = storageAccount.CreateCloudBlobClient();

    var uri = new Uri($"https://<bloburl>/{container}/{file}");
    var Blob = await blobClient.GetBlobReferenceFromServerAsync(uri);

    try {
        HttpResponseMessage message = new HttpResponseMessage(HttpStatusCode.OK);
        Stream blobStream = await Blob.OpenReadAsync();

        var fileName = string.Format("{0}{1}", DateTime.Now.Date.ToString("ddMMMy").ToUpper(), Path.GetExtension(uri.AbsoluteUri));

        Response.Headers.Append("Content-Disposition", "inline; filename=" + fileName);
        return File(blobStream, Blob.Properties.ContentType);
    }
    catch (Exception ex)
    {
        HttpResponseMessage message = new HttpResponseMessage(HttpStatusCode.BadRequest);
        return;
    }
}