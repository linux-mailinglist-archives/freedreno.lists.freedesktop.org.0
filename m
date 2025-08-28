Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F16EB3ADB4
	for <lists+freedreno@lfdr.de>; Fri, 29 Aug 2025 00:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9453710EAF8;
	Thu, 28 Aug 2025 22:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXaf2jas";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D42E10EAF4
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWd3o025053
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 atpsxElvXgCLWEtnfNMUFNLYSDL18dufzTm3oOR6c98=; b=pXaf2jaspyHIpMVn
 hprMkRQd/uIY90UJjgr9VTuftKB0btKHUysmgjAwaiq93j1kE3rbFPserZ/I9nyP
 S2XzYdTTjsXZ1r2pMYhqCXx6+vEKtYS62K+yQHT1wsjKQpPDxnS8SV0grGr50Gig
 qa8BqpVRp3+4b7w6hqVQt4w7lRnys6oVGvZnOIdE8nQzlcrfhi97RtMIZLymuaHf
 z6rv3rfPmw3lRsgxGFd1bBaTmsOHDdEO4W7fTd6e/fJQHydOfNxKvAXcJjunsxmi
 60AOOjWIgF04sqyZTogUj9KPeCUuPAvvPVBVWcC35KQv8n6FCmQmu73d0U3ppHe0
 Zb+0zQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615sy8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b28434045aso45944211cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 15:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421305; x=1757026105;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=atpsxElvXgCLWEtnfNMUFNLYSDL18dufzTm3oOR6c98=;
 b=a64vnrtCuupDnR5bfqzszDLI3G1ZDrIugYhIXZ1+THUZseA5wM0WE05umbgR6Lh93G
 hrOiuUCE34ItxAehTYG0Fos5F1kQ0Qm+9O/80UXqjCUYvrA2LciWIUlm6oBnBc9RzaBP
 3+G7UbPSapSukrbAO4aNuGdZpx3JgOj4qQ6t2UMhTEFhB3iq+docCQtS61crWEkYuJzk
 ff70rhO3/zdOY19ggpfZ4Yv3SQD+TS0B0Pdquk43EJ/nqBxotimaTRoBVYIDYaAkN5gK
 qILUMRzfJ1BZ1/FtTN3EnHEqKqifCaSv1KyBPDUiA6ubx+eTaX8JFa+ts4JQklWV7CBB
 RVtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWqo203ErGb5ZJP/0/dh6XlHzFchg4KnvRdTv/NwmE+C6uwozd6sa14z5yDcFo4jBukDyMd3c+7lI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwraoXpUF6eU6ClGbTFlbFAJueaaQ1pZ9tcDVNUmRhBeJRyYLGY
 DYPW4GIEdw6/ACrCpaN0fl19CbzYXu4le3mJFXpHDgb/885RVT4y6L0jgWQnDfJv7dArOT9AYLn
 0BfDeV0dcxgwoVy/d6MTZ+thEqOu/ip8B44UNFbIDFZTkoei56++FRf505rDRfzuUFgFbw+o=
X-Gm-Gg: ASbGnctm8c8iGIVUdat69/GrVyiunVgj/Cy3J9ho/k1os93G9d8rIRjsXS4KlwKsECN
 UOWmmfeG7bbJfI1q56Vb7eM3I2DI17iJkQUTMrYexMXUErGhCV12bOpovHBYHjIc2ziaBKvZ0aN
 EHOYpmafbrUO+4VS/7n81BqC2yQaGfgMVmiN2hx2DMR4g0jsRFRhSkaaRrpTc7qHWW3y0P7JQ0X
 Z0TvOtDG6G5IfobXXNx4aZ4D3hA6OkzqWVREltRFMT3pyY3+RxLZ0Rxuu9ZP5ZWAPRNCX/aC7c7
 FEdO5cNAOJGynNp2pA2D5JHyjgr+P4Nhu8EEiZdMGeU3syLInmPw7rR6aEPohP3X04KtFkg6yjJ
 gay0ylwZVJ4jO7zHWGfTHrqe9IUU5OfyEZ4hvItZCyPB/iWVCFT7q
X-Received: by 2002:a05:622a:1115:b0:4b2:8ac4:f077 with SMTP id
 d75a77b69052e-4b2aab8aca4mr318535011cf.73.1756421304714; 
 Thu, 28 Aug 2025 15:48:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOaOKIaf2gQXbFaTcYE3UUBr+6LweGy7t6jUudPKOzD+KugsPTc/esP3MeyEzVnJtBeiF1jw==
X-Received: by 2002:a05:622a:1115:b0:4b2:8ac4:f077 with SMTP id
 d75a77b69052e-4b2aab8aca4mr318534781cf.73.1756421304194; 
 Thu, 28 Aug 2025 15:48:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 15:48:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:16 +0300
Subject: [PATCH v7 3/9] dt-bindings: display/msm: dp-controller: document
 DP on SM7150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-3-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7SN93yAhsVlIHhAjv83yfgqh9HpWqOytsXh6bquwkv4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNyweOQwCO+rx4f83aSf6TE5GnLajMRr4KfVn
 ESULxvnJhmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsAAKCRCLPIo+Aiko
 1ZIRB/0SZBALvHgk3Yngot00vR5KhYi3qn2VB8YGMhU3sZV2nNCmtZdtrchmslJIRsHamS8NXeB
 ptLOSexHR7ZBf5yE4YERhMP4347hHPbisVx29VgP+kyu3htD4qNYwSvjMGQdlUbFQL0/6wiG3pE
 OtpkGZI/eHq4V/aA49PoUNRWXb/VUwE/UkxgrmImOSl9sku5HgXGyIMhrwspV772n2hry8aKlcU
 kYpYKniZxW2YreAZMtdFX7Io/brm2aTpZgpvmCJ9+zjqO9KKJx8uFT+gRBgi4XA6QaF+35KgQG4
 Yp8231dT3UaO6dt+1/ZlTyoGML5+dXWEdnzlJPiSxbtsDnqk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX62XKwuwnuQYd
 XrZ+ypkJ7OLrwJ6z53rq2nnCXMCCmd2lJV2nvIH1U34IdEev2VHWxVRSHy2jI2l0yuT4Hpb7Mo2
 uy3uPX2WrvBnYsKr3U0VxmJGtKt/LY5OrcncWjDTwGs+psiRGGqIZyVKZOkhGQZIpu9KjSPRq9S
 Qyb2YmSC9r5VbLEEgc0EB8nq/uSZhUdvwMdneOJY0lOMG7enZm7I39X4d6Dfu/8RguM+NZ56x9N
 BKI906o58ojvaX5ovB79pJAIW1Ah0FXGyJRPXf+r+ZbqQbOjx6apPlPm/NsVpiAT8tjPcOoavBV
 E5qHPKIFxRUSmm0lGgDdw29BUJcfAhZIjzwS+adlJva+TXgn9SWhxNhy47UNkT/UKBxVZWnr5vM
 4w2vv0sA
X-Proofpoint-GUID: p_2_U2uq6cdOhK1U4DqWza2rS_eZf6rU
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b0dcb9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=QYKTPsKsHukT_2dPOMMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: p_2_U2uq6cdOhK1U4DqWza2rS_eZf6rU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
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

The qcom,sm7150-dp compatible is documented in schema. Mark DisplayPort
controller as compatible with SM8350.

Fixes: 726eded12dd7 ("dt-bindings: display/msm: Add SM7150 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 0f814aa6f51406fdbdd7386027f88dfbacb24392..a18183f7ec21ac0d09fecb86e8e77e3e4fffec12 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,sar2130p-dp
+              - qcom,sm7150-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 13c5d5ffabde9b0fc5af11aad1fcee860939c66f..c5d209019124da3127285f61bf5a27d346a3d8a1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -61,7 +61,8 @@ patternProperties:
     additionalProperties: true
     properties:
       compatible:
-        const: qcom,sm7150-dp
+        contains:
+          const: qcom,sm7150-dp
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -378,7 +379,8 @@ examples:
         };
 
         displayport-controller@ae90000 {
-            compatible = "qcom,sm7150-dp";
+            compatible = "qcom,sm7150-dp",
+                         "qcom,sm8350-dp";
             reg = <0xae90000 0x200>,
                   <0xae90200 0x200>,
                   <0xae90400 0xc00>,

-- 
2.47.2

