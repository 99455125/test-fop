<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4" page-height="29.7cm" page-width="20cm" margin="2cm">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block>Hello, World!</fo:block>
                    <fo:table>
                        <fo:table-column column-width="150mm"/>
                        <fo:table-body>
                            <!-- 循环被保人,  一个被保人一个tablerow -->
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:table border="1pt solid black">
                                        <fo:table-column column-width="150mm"/>
                                        <fo:table-body>
                                            <!-- 家庭单姓名这一行的table row-->
                                            <fo:table-row>
                                                <fo:table-cell>
                                                    <fo:block>Cell 1</fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                            <!-- 循环受益人列表 一个受益人一个tablerow -->
                                            <fo:table-row border="dashed">
                                                <fo:table-cell>
                                                    <!-- 受益人， 一个受益人一个table 里面三个tablerow -->
                                                    <fo:table>
                                                        <fo:table-column column-width="50mm"/>
                                                        <fo:table-column column-width="50mm"/>
                                                        <fo:table-column column-width="50mm"/>

                                                        <fo:table-body>
                                                            <fo:table-row>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 1</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 2</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 3</fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                            <fo:table-row>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 1</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 2</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 3</fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                            <fo:table-row>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 1</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 2</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 3</fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                        </fo:table-body>
                                                    </fo:table>
                                                </fo:table-cell>
                                            </fo:table-row>
                                            <!-- 循环受益人列表 一个受益人一个tablerow 这是第二个-->
                                            <fo:table-row>
                                                <fo:table-cell>
                                                    <!-- 受益人， 一个受益人一个table 里面三个tablerow -->
                                                    <fo:table border="dashed">
                                                        <fo:table-column column-width="50mm"/>
                                                        <fo:table-column column-width="50mm"/>
                                                        <fo:table-column column-width="50mm"/>

                                                        <fo:table-body>
                                                            <fo:table-row>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 1</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 2</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 3</fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                            <fo:table-row>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 1</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 2</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 3</fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                            <fo:table-row>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 1</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 2</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 3</fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                        </fo:table-body>
                                                    </fo:table>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </fo:table-body>
                                    </fo:table>
                                </fo:table-cell>
                            </fo:table-row>

                            <!-- 循环被保人,  一个被保人一个tablerow  这是第二个-->
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:table border="1pt solid black">
                                        <fo:table-column column-width="150mm"/>
                                        <fo:table-body>
                                            <!-- 家庭单姓名这一行的table row-->
                                            <fo:table-row>
                                                <fo:table-cell>
                                                    <fo:block>Cell 1</fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                            <!-- 循环受益人列表 一个受益人一个tablerow-->
                                            <fo:table-row>
                                                <fo:table-cell>
                                                    <!-- 受益人， 一个受益人一个table 里面三个tablerow -->
                                                    <fo:table border="dashed">
                                                        <fo:table-column column-width="50mm"/>
                                                        <fo:table-column column-width="50mm"/>
                                                        <fo:table-column column-width="50mm"/>

                                                        <fo:table-body>
                                                            <fo:table-row>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 1</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 2</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 3</fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                            <fo:table-row>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 1</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 2</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 3</fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                            <fo:table-row>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 1</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 2</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 3</fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                        </fo:table-body>
                                                    </fo:table>
                                                </fo:table-cell>
                                            </fo:table-row>

                                            <!-- 循环受益人列表 一个受益人一个tablerow 第二个被保人的第二个受益人-->
                                            <fo:table-row>
                                                <fo:table-cell>
                                                    <!-- 受益人， 一个受益人一个table 里面三个tablerow -->
                                                    <fo:table border="dashed">
                                                        <fo:table-column column-width="50mm"/>
                                                        <fo:table-column column-width="50mm"/>
                                                        <fo:table-column column-width="50mm"/>

                                                        <fo:table-body>
                                                            <fo:table-row>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 1</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 2</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 3</fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                            <fo:table-row>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 1</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 2</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 3</fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                            <fo:table-row>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 1</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 2</fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell>
                                                                    <fo:block>Cell 3</fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                        </fo:table-body>
                                                    </fo:table>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </fo:table-body>
                                    </fo:table>

                                </fo:table-cell>

                            </fo:table-row>
                        </fo:table-body>

                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>