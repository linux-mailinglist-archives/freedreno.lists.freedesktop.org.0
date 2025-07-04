Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0830AAF984A
	for <lists+freedreno@lfdr.de>; Fri,  4 Jul 2025 18:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AB310E355;
	Fri,  4 Jul 2025 16:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPh/6TZM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C259D10E34E
 for <freedreno@lists.freedesktop.org>; Fri,  4 Jul 2025 16:32:04 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564948Xv024889
 for <freedreno@lists.freedesktop.org>; Fri, 4 Jul 2025 16:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lCy3Mp26PN6RlYzqrLIVdWeBnpFYaVfs3jyvVwWycsk=; b=IPh/6TZM16S2tTdI
 hKVUt/DOxChP6B14zsxSMVAh+AMKmHC5Pfkq6nakLVpDdywDvWDJRVCrSJ2zsXFc
 gWjhvfRaGhs24QQx2Ay60I/2/pavVTerIVMbZPoEjq4bh0EPlhXduPsOyczGKqBX
 MU3zKZGN25OVffTKxZZZaH8+5goPbS06anXVBF7rt9+HaX8iOI5yDp8xj+2x+uwS
 7NPAhav4yAakW7+TkmaHAVCdT41n/AxHHLJVeDwqegn/lXA7EQO0/wU3r4gV/fQZ
 M4yt+MMfS8ZV3b+WUX2Af2hAWlA8ovuhfmuwbQ4MphpLz8byEFi79gTA/72D18WO
 F/GBaA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802c7bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 16:32:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d460764849so365632685a.1
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 09:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751646723; x=1752251523;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lCy3Mp26PN6RlYzqrLIVdWeBnpFYaVfs3jyvVwWycsk=;
 b=ilKiFzgGzv1XRjqnyuPHW6okRryB/yYpQ09T0CE8A6QrR6DOO+di1LTpAHAUanX9vN
 sylN1iKTTkAwpcM2IdbIF0OZOKMTwSmFo7TPBn45W0NJAhR0e+Wmu+zdkd9/BHhgHyIb
 dz6aj6QaXOJ799Oqf78WrVJ8CdOYkFWZiLLMfXB1bCDZWMckRY0DQuQ1mVU7uPWZ/W4P
 lAqeRAXHQUfRFob0zg5RA4XiB198LQvNazbEglCokyCHEyI1OnoDCTx9NN/NbyPqVNqP
 8eN76rbnfgZanjRkycv6yT6KYbsXaAr8t2go7aJae/3q0zG6Coy/JdCVSac27VI1NSq5
 pxyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxw26DmUupqq1J80WlLQiR118e4megTDWWCuSEafWA0lXcSHBj5dmlRF5Q2jIEhNknDpHZcQDNuz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1IKwBzNjzaRnox+fgHi1K/eAirNiiHrssW2SgEtHaNf0wXVJu
 7GwGPacw/rLMmT1kdb9ZrgSCcmIAPNOs27z43p38eRHPNQhllZT5fU2SzLZOZ6o/ON8UocJUzUu
 Vdw9wqV/qIUwTovZazT9z6aSfMAhhmwoId5md2K4W78rhy4Ex1Nd5vS0hDWtmfMcdE8MFvlcIHu
 Jpe46Jfg==
X-Gm-Gg: ASbGncu4lAdgV+Mak/oMxlG874ut2QKlb48WJNpAirdwqIqHX2/W5929MhVkh3TO5tc
 l6pU9fIfc2yCzibA3hj/vSPl16J0pWInKxV6gr0K+iNoKrhwEo04BdSa5pQVQBpBUt5roAsrqf5
 3v6hPDCCcd4CWXassmu1dnc8wH6pAdD9/aQKnpsONtqp7LPWLP85488nFhY65L0jSv1qQ+WI10o
 rYnIyj57VJ/HOX5nxIm/rpN+uSH4ye8fq2o9WKYimcYFGtkyjStwqW1DoZ+BdWx3vvLAR1RXTUP
 b6wKnl6clGuHPqnhX2chvltbHGKEp+pcrPMNxh6urSUbI4Z7jMlL4OT2gLlBqtiOBTpjLI3iCcV
 pqRS//tGGVY3f1eIl6UwrDEFr+MsKE2mw67Q=
X-Received: by 2002:a05:620a:1724:b0:7d4:3cf6:15f3 with SMTP id
 af79cd13be357-7d5dc6e3826mr542681685a.25.1751646722710; 
 Fri, 04 Jul 2025 09:32:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFjNhcyPXleZqxKkeBOedoEcBl5IqQ/zhQ/LmNX+iWVLvPoc6U8bH4uDJapqPQZMpf7V7c1A==
X-Received: by 2002:a05:620a:1724:b0:7d4:3cf6:15f3 with SMTP id
 af79cd13be357-7d5dc6e3826mr542676885a.25.1751646722210; 
 Fri, 04 Jul 2025 09:32:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1af83102sm2813571fa.6.2025.07.04.09.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:32:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 19:31:56 +0300
Subject: [PATCH 4/4] arm64: dts: qcom: sc8180x: modernize MDSS device
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mdss-schema-v1-4-e978e4e73e14@oss.qualcomm.com>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
In-Reply-To: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bAtnGsyPKQGjRv4wCht+S1dUXqoLPaKb8f4OFVueSmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaAH7eTzqlMVB/DjRgzBiEBYxLi08uNbOA1F97
 Vd0EtyyMZSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGgB+wAKCRCLPIo+Aiko
 1VkeCACEjcvsCOWvGzeerp5hPYD0fEONkveo55tJrQSZd19YanefgWVCovErRNlJ8+mMbndcfTi
 Gx9CSFn9ge59UYKObBArjFltpzQWnYQ+pJCm722MMoiEBssFUk6XozGFU233IQRNBN4SwnN1B7R
 gZgDvNjD3FMNb9mbXEmYJGe8qyPujcYlzyMT6p79fD4vs1d4vLln1hrDilvDr4HLjJ2Ilugb/wS
 9jg7eBzC3wyaQIwRnQHQSuOVh+YR68OVTRZbWse1SQz+VmDkj+rAXtrqgaRezVSiAqDvFrEjgGm
 ps2vw8RJsWNTJTVQG46WluyhtvQegOpPR2Y2x7u2Ylsaki21
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: A5lDZ9Ox7UDQfkgLDx1-jCOAxctchMR9
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68680203 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=WUOsL33OVTVxArewYC0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: A5lDZ9Ox7UDQfkgLDx1-jCOAxctchMR9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNCBTYWx0ZWRfX1GqhiIzPy73C
 uDzNeNXjxRlpqMQf8OK///Cu73eqOjRvlVKEAOZLmpoRbNrcB/CLCkQiYDaUcaQTAzpsy/wr0q+
 0UXcfBPZ5xW6uFgKd82riR2ueYOiz+wD05GOezeCV6Nht0SwTwb5i9UrXS7w9Ui4uxDc1YtGikD
 VrLN01ICJjKUgkIJr0EqnQS7+p+sBBnvLtMNOjjtDyBtnREtoxyo53FEIHmD+nsqCJ5/XQpNIfX
 tnTMJwKtqujPSLqYPXDqeYUjzEdc8s4db5E/uR5kENJBwHKngfsxJNzeunKhQUn087Dm9ixTFmd
 xVV+ydA7GrxNZB+4oZ2TAwxGOYPjAhSo70ZULkaKryvJuNxXyJ7Hp5EOILw7dyjzOIPYwxz5wFt
 N7eMWPnbaWdqDURZaSg/yzePI+s/MthlYFZJwYkiR1rN5gfBI8WAZ5/S8gXKZdsnL2YLoxvB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=951 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040124
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

Follow the lead of other platforms and update DT description of the MDSS
device:

- Use generic node names (dislpay-subsystem, display-controller, phy)
  instead of the platform-specific ones (mdss, mdp, dsi-phy)
- Add platform-specific compatible string to DSI controllers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index b74ce3175d209b569e634073662307964158b340..14775b8dc682221ada3d30773be66edb46138662 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2956,7 +2956,7 @@ camcc: clock-controller@ad00000 {
 			#power-domain-cells = <1>;
 		};
 
-		mdss: mdss@ae00000 {
+		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sc8180x-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
@@ -2996,7 +2996,7 @@ &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
 
 			status = "disabled";
 
-			mdss_mdp: mdp@ae01000 {
+			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sc8180x-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x3000>;
@@ -3090,7 +3090,8 @@ opp-460000000 {
 			};
 
 			mdss_dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc8180x-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -3156,7 +3157,7 @@ opp-358000000 {
 				};
 			};
 
-			mdss_dsi0_phy: dsi-phy@ae94400 {
+			mdss_dsi0_phy: phy@ae94400 {
 				compatible = "qcom,dsi-phy-7nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
@@ -3176,7 +3177,8 @@ mdss_dsi0_phy: dsi-phy@ae94400 {
 			};
 
 			mdss_dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc8180x-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -3223,7 +3225,7 @@ mdss_dsi1_out: endpoint {
 				};
 			};
 
-			mdss_dsi1_phy: dsi-phy@ae96400 {
+			mdss_dsi1_phy: phy@ae96400 {
 				compatible = "qcom,dsi-phy-7nm";
 				reg = <0 0x0ae96400 0 0x200>,
 				      <0 0x0ae96600 0 0x280>,

-- 
2.39.5

