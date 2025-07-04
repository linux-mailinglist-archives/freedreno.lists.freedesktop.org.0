Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ADFAF9845
	for <lists+freedreno@lfdr.de>; Fri,  4 Jul 2025 18:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C825C10E348;
	Fri,  4 Jul 2025 16:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzJZNgZo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087C110E348
 for <freedreno@lists.freedesktop.org>; Fri,  4 Jul 2025 16:32:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564BVT3v010370
 for <freedreno@lists.freedesktop.org>; Fri, 4 Jul 2025 16:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qjHlmwArjTOMKWmC6+bgZpFfSvKDIyWSaR3a4YOlmAs=; b=pzJZNgZoGz5A7zuo
 dinNmipmBGQqxA76MP4Jan0muafX0QVn2EfCIw1yEcZAkF38webrqcQBW2BHWbD5
 OutQGEAqFDeB/WLDbImmiTGnWkUjamw7Q0s558jikPc8JKmYcNgtDAmav74BwPpR
 4T0fRbSwrcPiP+YJnKprkbvVj13LAbSeIExG6ceaQgJVX/aiSHnUbbfuLYnE/YM+
 AX36LvmKAQB1Gxo1jSMICHIpWtinERqnhXs5geNeUAoGzIF7iMThjJS9XQOjRIsZ
 mEZ0UOBM2e43c6xEi2ClE60/zhl9GWBz/RQxCRQEDu+ec5+hC2kd2DclFnhWJui2
 4kSPLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30hks4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 16:32:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d5e345a3fcso34835885a.1
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 09:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751646719; x=1752251519;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qjHlmwArjTOMKWmC6+bgZpFfSvKDIyWSaR3a4YOlmAs=;
 b=Dnh/8HYGNVROj1qD5cuTyTEQwpcMu4PhTqW0l5cV4kZTRBeO+K1iTQyfgvZTXQJL44
 nUwrJShUFZObDXXbC4F4XwccgXTKD4ggHnycXu4EK9bavUiwpZM00HcTffzRvtYkQQrM
 h+7m53KauWgfmFg34RRzpxTyLZYMyEh9TLpIPmibtAx0bsBIEDBANFtSmrYiZtF1g3mz
 sHFP9dwvP4zlcLbKkItJJh8teMU6QrtjbbpWQwBPLNGbl2cT6f/UwHgE2s0PxoKKtv4d
 SV/2WCArRJHBG3ZKbR+BuwqItkAwffb66vrBSJFpGhyI1axDfTTazCN2sGHQB54Ad62w
 XrXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbGtq/m8VoqbA/FrbZIcZAhCqC7BAxRFXs/QPOWlBHHdCqP3NfK10bDWS6TfhooSX4Sa+j4NmtjOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpjTAKCZkiO8ZWLCSyjo4bUZIJoTdhLsqKHLExyrfIs+PpbrHV
 dmBFSR5eDkfrtbZrSTAHcuZz33f7pqjrqwe3rdjw907yLLnmNJMeWXnePjIBULq4sxRTiGEn+Xk
 VhTrwEZ+7yb1o1MRu6yPCDCLba9cVG4biHsKso+NmWJ8jI8b3ux37Pd7VPN3XZpwnZbRhZyKHwA
 UQqaV+gA==
X-Gm-Gg: ASbGncuUru12Wn6ddKfUGMAnxZscpiXjeJdgxZXhG+LB+OY5A+Wvv8uOXvlne35aNVS
 SR1VwN4X6efYtPkMqZr/EdAleS+W2ifj7ABFYfOyVWlXB8mXdGw6HaqzU+o1YzJw9varrgVud8B
 U+NFhf+P58X0Q0zLd9Qyo/hqQkUTFt6mTjJhD6/yavyJYjdl1O7QTigNTOFdejInfjcYdsD6kae
 HDYooGOJhiWdbkq7IWF+dil7xaRpRWf3PsNk0pHgxdxGZ3bFkH3XI/NDrz/8OPINnO0OUDtHjFr
 lKBqaDzCwHPrV4IoYje/kpKPwmAmDXWE6LVtMkWleeve9AIUNOYdxqyn6V9BN42J7GyT3mpu/Ky
 dVj6XWgXZ3uYmQfqlLH9/XMQZ/sSOFx5j37U=
X-Received: by 2002:a05:620a:4114:b0:7d0:998a:2e64 with SMTP id
 af79cd13be357-7d5dcd40ec1mr456502285a.56.1751646718725; 
 Fri, 04 Jul 2025 09:31:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpMRUrk1CDVU+F2WTSjBGZWFGqazNAhn/w6PL2+6knrtMnP4ChdfOP+UWbEaeEkMn89T79Ag==
X-Received: by 2002:a05:620a:4114:b0:7d0:998a:2e64 with SMTP id
 af79cd13be357-7d5dcd40ec1mr456496585a.56.1751646718065; 
 Fri, 04 Jul 2025 09:31:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1af83102sm2813571fa.6.2025.07.04.09.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:31:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 19:31:53 +0300
Subject: [PATCH 1/4] dt-bindings: display/msm: dsi-controller-main: add SC8180X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mdss-schema-v1-1-e978e4e73e14@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wcfz4bb2UH4k4iauZC9yeDtbL/XAGvi5MpIvhkWE+84=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaAH6NdCA26k5w7rflaL/C0ZoQBv6Ah0F9ug1Z
 Y0jE0oTs9eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGgB+gAKCRCLPIo+Aiko
 1d3tB/49669MgQgqtdl5XpVt4x+mRqFwJOfQhto4TFrSToyu4TtQroVaUAA0a6PXNNJnQKjjNaI
 zFcWAAfwkbz2xbvtLvaz9CEuHTV7yq1UGmSJdfhIWDdx1UMkgcpTBkt03Z2JXQDiCdpYW9wHeQe
 VE6dOe0zm0s9ZZ0k8z/RoPPerz2ixTynYeSrH1FrVYczgX3FPjxmAHmPmWKgLoMDpe+GeyhhiaU
 kh2E7j7iwjoP5uijoLT9MNEVA+bqzIB6KAMqE5ohGphvVzjTpZqoH1bIxc7GsrlhMZwy9U5ujE1
 SwLVtNqyyAH5k88oPBL3fDVVygagjafuxZSgqDdaJgUc3fk8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=68680200 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=93dKIss0COAcHyiF0SEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: RyD70He0SFWN_9ttj7mJzliryo9samCH
X-Proofpoint-GUID: RyD70He0SFWN_9ttj7mJzliryo9samCH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNSBTYWx0ZWRfX7LZo5z184hLO
 2/A5a5t3pmtUEQ1ca2+nWLr9qbspANWrvaxg8qrWAkEJgmO7bbMNu8enILroAI+XYiZjwC7F8P8
 D/wn0pSbAHg/2gbd2aySJWsfhq6n2f/ZUbrK/HrD4uw4uL0JyA5HklKYHq2OoiiiqPgJXZAajAn
 uOG2XOkWwqZUSiXswZ5WtWZLToIIXlcoiv5KIFE8vdTwpFvusf1JwPmEoqNE5vZD/2iaHKvW1Rf
 kPjEXTQB2e3wFel8a3pQETrvb5BMuXPXFxsM1JD/6cxzvM7fgvG+pmwQaa6foGCqnksmTnOvxjP
 uMvVApy0DOqzUlMvMP7u5oWL2tMjba2yMKu1vGlcKOQGRG4kD8O9est1M/sAfk4nZP9KCUfpZs+
 ZCBc4O0ExS6eaZMN9ywt3BE5sd8gCklZQFKQ2HhMwHZC11ZC8P7CzIR4vuKXPN/TcpzbhD3A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=977 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040125
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

Describe the SC8180X-specific compatible for the DSI controller persent
on the SoC. While the current DT for SC8180X doesn't use this
compatible, all other platforms were updated to have one. This change
makes SC8180X follow the lead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index d4bb65c660af8ce8a6bda129a8275c579a705871..4400d4cce07227c2f8938f126c77213b2e4bb9a5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
+              - qcom,sc8180x-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm670-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
@@ -332,6 +333,7 @@ allOf:
               - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
+              - qcom,sc8180x-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl

-- 
2.39.5

