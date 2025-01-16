package org.example;

import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.apache.fop.apps.FOUserAgent;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.OutputStream;
import java.io.FileOutputStream;

public class Main {
    public static void main(String[] args) {
        try {
            // Load the XSLT file
            File xsltFile = new File("src/main/resources/template.xsl");

            // Configure FopFactory
            FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());

            // Setup output stream
            OutputStream out = new FileOutputStream("output.pdf");

            // Setup FOP
            FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

            // Setup Transformer
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

            // Setup input for the transformation
            StreamSource src = new StreamSource(new File("src/main/resources/data.xml"));

            // Resulting SAX events (the generated FO) must be piped through to FOP
            SAXResult res = new SAXResult(fop.getDefaultHandler());

            // Start the transformation and rendering process
            transformer.transform(src, res);

            // Clean up
            out.close();

            System.out.println("PDF generated successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}