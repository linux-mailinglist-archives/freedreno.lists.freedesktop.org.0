Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D623B0D293
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 09:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5550710E5EF;
	Tue, 22 Jul 2025 07:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVzq1frN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E660010E398
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIhARq012291
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z6ZwzV2fRLwP2rYYHbwT2Ikl/JBdsp6+MNb9lNC0zc4=; b=TVzq1frNL/SlSxtN
 WI+DdaVgz6Hgu1dXskmqVouqvahpmof/0OcnvL5kL65WYFsihlhnXTMxd5b7PDpS
 hRONCm69aDPDhuB34dNDT4mgIrOkPtc9h+UN+pqPnt14S1WUNzT5JaEmiR/55vK1
 Cfqa0LfPtFoxvqj3jZ2W1mIEMuUWsI+POp5dUBJqFhp+5tc0cE2Um8qxBCD+XoEI
 9J6i3JkXoR7bqPkdr3XnKIFt8S+n13rMwfomdNVnE7T/fkNftGYKJdkXMUCewhZA
 PdHJeUNUbaDwsulrdYQ4trXIV4URkJg3+94H30MxIXQMSmQvmLyw86MJJPT1p8ns
 3aPo/Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459pysw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-23c6ff64067so1614065ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 00:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753168952; x=1753773752;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z6ZwzV2fRLwP2rYYHbwT2Ikl/JBdsp6+MNb9lNC0zc4=;
 b=fCD95HDy/VWI+Bc/k4XrfCxL+OSEMesgpSKIl2CiTxsTJ7WsD/B88QOK6sJ6tVqsIq
 nr8EyRY1/amWGWuMvMCkjrgqzfuAKySTViQNuXf12d/dQtyYgGGqIoVNli7/KeGLCIRA
 Z3OpwVmw6I5v+8cOMcsXBPuFMmjCcC88L9aa+3mLe4q0UPTKTtMySiWAu+nYk5pv7o0c
 Pi/BMfFTJohAOOmSLYVs3BifAZJzkXGiUxrT4Cs2TT4eLzwBOmDlvgy6+UxaTTx2QS34
 Sxry8YHpbiixKonk6AtCquZfpy3A/mOoh7HMsV9ZAKqG0zfxpUDFj/nYvElpTWYoJvXv
 IM1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5nJqyqeLutJxBzPgAvlhQQSqPUb9ArO33rYglxrrjB+KOP9/gIq9lkBYJemFKzcPiUrPh1Xxu0r8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6+jD5L/MYH/6ASVRN6JM/D7v82lB03kOkaFgfp/AwL9slrGuB
 +nKn1LRR81Npo2Kq8r1CxzVp7Xa0iE6UBv863xntQSZYFr9b0wRyQ/eBm5Ncfz40AwwlZq9FkuT
 SeVO8lu3RD2Ueyivl9UIM/e2O7iQZ+Mk8aBRC7WD6XQ0Xi2EputMmBfQ+pb4mM4uM9k/VZt4=
X-Gm-Gg: ASbGnctn277bmhRUesYd8NNofYAU9ywkr4ioJVlRAc8/YIxsIestFU41jMR6KgxMEHJ
 mbkNSDf0iFI47wI1PTAB0SEGMwOzSRC2UlM4QePn7/7AVhck2NsPrQ+ibD0OoKHSoMkUs0RByXZ
 TIcdMA97dWrZwOgSXZyFXtDodKX5LpeILC0wAcmgBsrdUFASJN4hvcWlGCYYldD9YJDuo8FzY+G
 mwXN39SPbwy1KhEFVa3zaUCynCh6iQZtMJbfubT2b2gzt7k8Ipz7jy8S/lGuvppbMaE2DmP04Xh
 mQcx9rcnNPfSzzz0m7PHaTlXRSpMgEge8LmuOOvaCkk6zqSRS/PV/D6I1wrUXxGHhsEx12ZIGkM
 3apahPneU7nF/HR9838f1xFQVKrkS7hRjtbgzlXNnlxn1qW0505QW7rmm
X-Received: by 2002:a17:903:1cd:b0:235:ed02:2866 with SMTP id
 d9443c01a7336-23e24edf70bmr137444835ad.4.1753168951891; 
 Tue, 22 Jul 2025 00:22:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPbIpYG8v2ydgpk9/Rt6e8nvbsQWG0NcHT8nsJPhxyTxGZd676+Q8C/tNJcrl9ABEm52u2QA==
X-Received: by 2002:a17:903:1cd:b0:235:ed02:2866 with SMTP id
 d9443c01a7336-23e24edf70bmr137444575ad.4.1753168951408; 
 Tue, 22 Jul 2025 00:22:31 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:22:31 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:02 +0800
Subject: [PATCH v2 01/13] dt-bindings: display/msm: Document DP on QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-1-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168937; l=986;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=flVURwsSNZtWM0+fUgJqZKMxwfIi346lSujUoU8vBq4=;
 b=lFF3TC9IzWFZbCphEU+PcIbJicZ2nH4+jooaIfp3H+fpT8Ugr8/Lcb6A7g1w4zevBtfnOQzlG
 sTyaMHC/WnDCxaIyrA03rD90NFGzdqeY660ykfSFBWrYsobnqaFRMrc
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: jXNfByKZfRcFThu-WwXTcvrGx-pNC5ul
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687f3c39 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=CFpH1fyJroaNsTO7nwQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: jXNfByKZfRcFThu-WwXTcvrGx-pNC5ul
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX41naDu9NBaal
 zmI4WtxV57iynduVGw9+wyj/ViXas6DZox5lP+3xuK9fGptoub28e2mkeABVeFyBkAC8bXhcfrp
 ey+LO8GU2141fNS+fpNqaD31Yek9iS1Qdhpl0cz29jmWGx8EBqBRcZoG1feFb49qd5jafg+YhwF
 2ORRgHnQTfEg4kKpLqoj+UFSi7F6qyc7jZLSptQqXQgdtoY6lc4Z09Hm4XJR9iI2HokUpScnKDE
 HkIGbnPDb23Rnd0DxdU/cRwGp4XcOEU3hqmlus/uvqOlK6OytTctGSTZbbonDSyfTly3SMqwDmD
 ok6IekaByoM7Wg/Z/TYM6oBn0TDHQCclJcIRbi9a+R6hFvma8m0BqDqrDqrhp33VtKG3z6H/vdn
 mV+8OiyT7eU45iYl1q5M1+ictOoo4qNwmFOetaXmOeZfsKnTsjGuTX2eESmve0Prlp+YL4Nh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=950 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220059
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

The QCS615 platform is based on the SM6150 SoC. Since the DP hardware is
shared with SM6150, the compatible string qcom,sm6150-dp is used to
represent the DP controller on QCS615.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,sc8280xp-dp
           - qcom,sc8280xp-edp
           - qcom,sdm845-dp
+          - qcom,sm6150-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
       - items:

-- 
2.34.1

