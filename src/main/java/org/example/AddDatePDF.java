package org.example;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.pdfbox.text.TextPosition;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

public class AddDatePDF {
    public static void main(String[] args) throws IOException {
        // 加载 PDF 文件
        File file = new File("iutput.pdf");
        try (PDDocument document = PDDocument.load(file)) {
            // 获取最后一页
            PDPage lastPage = document.getPage(document.getNumberOfPages() - 1);

            // 提取最后一页的文本
            PDFTextStripper stripper = new PDFTextStripper() {
                @Override
                protected void writeString(String text, List<TextPosition> textPositions) throws IOException {
                    StringBuilder word = new StringBuilder();
                    int wordStartIdx = 0;
                    for (int i = 0; i < textPositions.size(); i++) {
                        String c = textPositions.get(i).getUnicode();
                        if (Character.isLetter(c.charAt(0))) {
                            if (word.length() == 0) wordStartIdx = i;
                            word.append(c);
                        } else {
                            word.setLength(0);
                        }
                        // 检查单词
                        if (word.length() == 4 && "year".equals(word.toString())) {
                            TextPosition pos = textPositions.get(wordStartIdx);
                            float fontSizeInPt = pos.getFontSizeInPt();
                            addTextAtPosition(document, lastPage, pos.getEndX() - 100, pos.getEndY(), String.valueOf(LocalDate.now().getYear()));
                            word.setLength(0);
                        } else if (word.length() == 5 && "month".equals(word.toString())) {
                            TextPosition pos = textPositions.get(wordStartIdx);
                            addTextAtPosition(document, lastPage, pos.getEndX() - 100, pos.getEndY(), String.format("%02d", LocalDate.now().getMonthValue()));
                            word.setLength(0);
                        } else if (word.length() == 3 && "day".equals(word.toString())) {
                            TextPosition pos = textPositions.get(wordStartIdx);
                            addTextAtPosition(document, lastPage, pos.getEndX() - 100, pos.getEndY(), String.format("%02d", LocalDate.now().getDayOfMonth()));
                            word.setLength(0);
                        }
                    }
                }
            };
            stripper.setStartPage(document.getNumberOfPages());
            stripper.setEndPage(document.getNumberOfPages());
            stripper.getText(document);

            // 保存修改后的 PDF
            document.save("output.pdf");
        }
    }

    private static void addTextAtPosition(PDDocument document, PDPage page, float x, float y, String text) throws IOException {
        try (PDPageContentStream contentStream = new PDPageContentStream(document, page, PDPageContentStream.AppendMode.APPEND, true)) {
            contentStream.beginText();
            contentStream.setFont(PDType1Font.HELVETICA, 12);
            contentStream.newLineAtOffset(x, y);
            contentStream.showText(text);
            contentStream.endText();
        }
    }
}