Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1857DA9C44A
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 11:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C773A10E922;
	Fri, 25 Apr 2025 09:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+7V3tXs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0182810E91B
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:13 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T99D007382
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NPo6Q64R8Ie+grYGknWiayM+abt8O8HAhJ3oPPs/n34=; b=G+7V3tXs6P9jPY9Y
 Ss134wveIjwo+kW2gY/B+9zv69ehzifyGoON/whd07TrJe2SwXP0fwybchl0u+vF
 qiSs4PSHFGx+pqHVDJatoTX7wfO0VmxlWSfsxsbwwOCSlI2pg+MymoUnhgSK/XQh
 MJQuxd3oYUIAWjJwr8EIAkNiyJr9OZuKyDa5t+CZ/5PE882kgalhe82ZzPOc+hmD
 TDHgulhv221Yjkc/6i/lKemMNyreU6pEA+ymvpz8ip+FsKZzYaLwpsCdLuSEwKv9
 84AULNPK4qPfWX+Piip9ZbdBoxUezuuMXZQO92m18knQ7Oj5sD6E7LaXjKVP5Tmo
 aV+QtA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0retk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c955be751aso340511285a.2
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 02:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745574732; x=1746179532;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPo6Q64R8Ie+grYGknWiayM+abt8O8HAhJ3oPPs/n34=;
 b=VBOGXUUZaCooTeYfMFoTrsaFfmBbPsGaJS5yWzhfQrYTgaraHVps7KH27lYHqYOJpQ
 wyvTLZGQT+IMyCstscfuLVVex0/5+X7H7osesyfRPE3ykhjUyUi3jDDHUcJubvPxzBKH
 q8UdZae8u7RzkQ3nJqRpmMYAn7uW8iTa10qFfzG4WAZD8mTjD5/jy0BgiruAWYyTzQWu
 76BVGVePhktYggxXR5FduJ4U+4H5iFB58oVn82VM1jTx+E2T55cocwXL3B0//QSnmVH8
 sdEsgsEU6+/1liZyr35lQCzcKLiv339jdIOKZrCSCvIhXGIYhlnJ843XTOCr76pl0LiR
 eL2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqsVgdrhMTe4iF4RD65t3+qha+8OgRgTf87OzLKJRJ23SNifEBUEdmKK+nRrHPNEFnEdEJscROM/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx799AR3Rjq5EFl40hzUfqMgQ3ANSTYfdZHe2NhUj7ZzCg8vThI
 ujMiUlmt+pIqMxHDujiypZfj/av0Uf58gTljolCLtlBPpl2Pv2DfhatdMs0+mn6n/vgwERTkNy+
 cOze7vu9WXiffmU6GSVo/fIv9SgSh1V/VVdA4Q+YFBqZRWbyO/0BtuLrGvgavxUMI/Bw=
X-Gm-Gg: ASbGncvLuZgn4aWVXgOrPcuiP11tYNX96m/TDqMTc1stuvq68Xa4b7ystY4u8bo9YES
 4vM2rAIdHiTwMm6d3t/gZlbEpjyePSoFs3y95iwhLCAaOlr7JzVYJi4kKO74JjD/bMyq264f8fb
 q6lEfaiXbsXSCsHip45RzjiXaY6ol22pMdiD+f1ISDRCYjufJ26QzGd9Ak6dxUKONlZ7hgPJ3AM
 1gtKXzee4vJ/zz62/Ue28ckUT/8feV1lSCiLq/DfDsHKvAVEAZ5Qag2ay9Xyn9LlsVEhnO49qyD
 9wyn1/X7VwSwF+g1QR+MFu/Y96uV1hN8JPigZqq+/hxHPLyHsWTbY65/T9H9XPJrOLmbvKBOtQ8
 CnQ88uwCQllsD0x943qbovaOp
X-Received: by 2002:a05:620a:43a2:b0:7c5:4b18:c4c3 with SMTP id
 af79cd13be357-7c9619a84c3mr221796385a.30.1745574732240; 
 Fri, 25 Apr 2025 02:52:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxNIuYNNjaQb8PK7de3lCR9P9YcVtolbk+mly+U7z7/oU1wPkDB+IRFiFcg0g6m6VaQc/Dgg==
X-Received: by 2002:a05:620a:43a2:b0:7c5:4b18:c4c3 with SMTP id
 af79cd13be357-7c9619a84c3mr221791385a.30.1745574731855; 
 Fri, 25 Apr 2025 02:52:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:52:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:57 +0300
Subject: [PATCH v4 7/7] arm: dts: qcom: apq8064: link LVDS clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-7-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gTQKG0fLWpD8Mjgk4DoVlbsZZVw4cfaJYQqKJoHiGbg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s6eKqblmHbFW4oNBrTuCB4SRcfiIHrdxIln
 Z11Q7ZLLwyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOgAKCRCLPIo+Aiko
 1TWQB/9/M8KQR/dnVmy9NtEwx7xnrdi4/+6hjugHCYXxnOB/WAIT1s5H1KOWGVTHXCaw07Gdxl6
 v0jvX1yDPdUVVX9GYmZ60MW3p1eooDEw1NUbqvBbbQdPhQIw68HrZKdPpeoOBEFsbf6OW24FXX7
 PusgB4xwCfBNzefYVzBZrVX6gybe6g3rvNERHa2tROfi/4h+r1NdQZBdZfUNCGDU2hZu3tv65Qo
 OtW2TZGeffWeRa7Nr+5p4N5KRxATqLwMYZuVfq1fskGvmBQHWmG9jnOWGQgVmQKcfRmFaHMmnT4
 yDTiRIhPUbCzo+GRNTROdUaFD/fmODG5bTtU+8DxtypOzLyK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: G2fIIEk5z3-E5VO8w7dSkoRcCNS5NQGw
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680b5b4c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qzM9u8Bgc55Ixitz76cA:9
 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: G2fIIEk5z3-E5VO8w7dSkoRcCNS5NQGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX85uiMvCLgQk4
 CCx8ZAY15ESetDPoKPBcfx676TYuDbFm2pU5yYsjTjPNLcAvEW7QREhuOm+z8ObQ7UAkTpMoyux
 D3CKJuUFfr8KXwO80nheqtGcDjf55VLuGl8qacgjoA7OIM7Me3QvTqBu5VUUAmMpEtP/sr6zxsY
 IftYZODbVhb8hnHkeMzIDbsYlSWqm6zkf/W1e1URndm+yOxWh63g3N4bUn09HAN2SuUSDw85wHd
 j7yUcHOf7RymIgcoTPOLTw9eVZs/+aOvARE0skU25YnRX1awJR2b/RRth1DhvUHKFfRegWKvPuk
 JOXRCF7LmyVUJ82rFqjwAfe21Ih+JEfIlv1UyMbU2scTTEXtZ9FcQu+JtTTgD7qiq6Q9oCSvvaf
 WGCkV2wEZP6Y17nr5I3yLD2lsgSk5ixeL7wMZX1X9oBwSo/UTqAY0v8bpI7/XNZy/jTtBp+f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=725 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Link LVDS clocks to the from MDP4 to the MMCC and back from the MMCC
to the MDP4 display controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 5f1a6b4b764492486df1a2610979f56c0a37b64a..b884900716464b6291869ff50825762a55099982 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -737,7 +737,8 @@ mmcc: clock-controller@4000000 {
 				 <&dsi0_phy 0>,
 				 <&dsi1_phy 1>,
 				 <&dsi1_phy 0>,
-				 <&hdmi_phy>;
+				 <&hdmi_phy>,
+				 <&mdp>;
 			clock-names = "pxo",
 				      "pll3",
 				      "pll8_vote",
@@ -745,7 +746,8 @@ mmcc: clock-controller@4000000 {
 				      "dsi1pllbyte",
 				      "dsi2pll",
 				      "dsi2pllbyte",
-				      "hdmipll";
+				      "hdmipll",
+				      "lvdspll";
 		};
 
 		l2cc: clock-controller@2011000 {
@@ -1404,13 +1406,19 @@ mdp: display-controller@5100000 {
 				 <&mmcc MDP_AXI_CLK>,
 				 <&mmcc MDP_LUT_CLK>,
 				 <&mmcc HDMI_TV_CLK>,
-				 <&mmcc MDP_TV_CLK>;
+				 <&mmcc MDP_TV_CLK>,
+				 <&mmcc LVDS_CLK>,
+				 <&rpmcc RPM_PXO_CLK>;
 			clock-names = "core_clk",
 				      "iface_clk",
 				      "bus_clk",
 				      "lut_clk",
 				      "hdmi_clk",
-				      "tv_clk";
+				      "tv_clk",
+				      "lcdc_clk",
+				      "pxo";
+
+			#clock-cells = <0>;
 
 			iommus = <&mdp_port0 0
 				  &mdp_port0 2

-- 
2.39.5

