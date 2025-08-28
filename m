Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C7EB3ADAE
	for <lists+freedreno@lfdr.de>; Fri, 29 Aug 2025 00:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069AD10EAF3;
	Thu, 28 Aug 2025 22:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0dy2w/A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2509E10EAF4
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:25 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWjQt025093
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h4xG6gxGmUBVptNQ0Jx0EnSCowy9k6fTDk5k4/UIYcY=; b=p0dy2w/AdUiCNHf8
 3UWigGUTlIHNV0HeKwUGM09SoLtV5C11mc+2F9eEjurw63RC6FNozXI2wNylIyuP
 PA1xlK5lClKyOJ0Xkn5TCdK0z++9nr0Bs5Vdrp4O3L/VFGdcLjBvLmklws9q3RVj
 Q67ZWtiyAp0uDquksHPJspV1+zAJGKtqXY0zVaZU6EpLN1RIrnxAwZUUIkWhRC/o
 uR0qvU+60rYyVDNqwcECSCjdvTTWPtpduPB96+v6yowcUiTUS3Rj+sz6N6Yx/5G1
 QBfxguQG1ew7YGLS+Vi4mC1XXGmMC8QqcinP3F7duSYHEcVBZ6Vk1YWiFXBXmPya
 5ChdDw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615sy8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109c7e901so31784191cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 15:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421303; x=1757026103;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h4xG6gxGmUBVptNQ0Jx0EnSCowy9k6fTDk5k4/UIYcY=;
 b=rLNZ3IDS4846f3HRpl0Up+d0fVOsyJ70Rlzxk0/KBvaREy4FILg8TCzgbnfQor4Q11
 AJPBsT6wIdyJl5/B/hHbUQ4P6YPd0TCuzDi/oLPLbUZUMNtH/nzGWs6NBFVyJV2uve8P
 9KqvMXVuvJj19AIYe/amwsSVOqKdGEhzB/JWfi3+MkOVGaMnOHvc2tO7QoJVvJfdYEBX
 iWDR2X3wbCQwIZ218bmt8PB1lXLDgvxdxUfoE4aJYsztDwaE2S4Toz0ptVb/D+caNtG/
 qnQjg5WMsnQMsodS5wVc0UHM+Q/8vqFjmIQ8eHo1SiHjbwqjOCNr4G3cv3mS3FcMPKni
 haBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr59Heoyl6cxTsrxWgOJpT099qKalAnkgiep3fnfyoMB9xK0oUwhGYbcqN32nxUkekPv2aprrdwwY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0qhjF2pKujfbs1DXDhe2wcGmFIyh3fyJABXWzfS7XeNXFtx4F
 eCAjVhFYPodMPONTEpFuhETJOklfkefxALM4zwvqYa84YoyTpmuFkIqZaRUU35IdEENXDFxic/F
 B1mG1VUCkYE29JLYL5/C4cdRZZtHpxH+iKc+8Bw/pvzXcvw3mwgS/2JPhxXay5QeyDCH5gQc=
X-Gm-Gg: ASbGncvXzZpsUSCLmDhLI63KRyeYIXXkT5yiM8CRjeJzUv/ZyOakrU+IGsKA0jvmBdt
 otVvIAgJg7oNEOur9tEz0WXCpFR/GMkYCIFoKIAV8GQpJS9KhNcYIS96q2Kntvn4an7oHX5a7XX
 mvlDtlbqYnFjycT/yf41nMn39OspkwdnenP49BfVJdmu6sUVAB7mTg/0Hrpx9ipY+Gx4JPwyfzF
 Az44dzHNme1cAtwia6/XzwVikR87L0oBPCe4VKpChYCuSJD0JYxqyvIb/EDV9x+vLYYAocxm3u/
 Ozl6A6Evt0c4MFUzWk0PkzIvC+kqrxDzGVO/+MofnYygYTYDBdXwN7hV2T3Cak5NRE9VWk71cct
 00w9JEMP2xd5Nox76omLoH3Aug0GyTcdjGmEmgBs4Eii4Vj+8LO5i
X-Received: by 2002:a05:622a:1e89:b0:4b2:d607:16c8 with SMTP id
 d75a77b69052e-4b2d6071a31mr191750411cf.37.1756421303032; 
 Thu, 28 Aug 2025 15:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT7cyyzQ3Kf4dK4/z65Oa9WK91ZkCYZL6Cr2V249eIGzQpvoHtsFVnZjw8wzQhViVcb/WTnA==
X-Received: by 2002:a05:622a:1e89:b0:4b2:d607:16c8 with SMTP id
 d75a77b69052e-4b2d6071a31mr191750081cf.37.1756421302572; 
 Thu, 28 Aug 2025 15:48:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 15:48:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:15 +0300
Subject: [PATCH v7 2/9] dt-bindings: display/msm: dp-controller: fix
 fallback for SM6350
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-2-2b268a43917b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/sz4uD15qfpeXM2kvdoyrlAbCsNzt6KQNu1t0VjLU08=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNywp4OsQT1E4CJI1lZdVPf8echcYqGySBx5O
 omJr8Mg9UaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsAAKCRCLPIo+Aiko
 1TRxB/907NXfImpQV/stpw3mpwD+8toHKtrEP65UViVPZgbNaFMVOcWCWXVHtfd/38lF6hBoYeL
 +qI0rggASaXPpb+9wEmSjOc5GicpROgbZrQkHOeJ/qq1MYvUDUWV8tWLv32DXyB0SjMIXAwrznp
 ploOqrU7WPiFUvV9zd6xH7/UXx8JV1CLp7qzP5KVFDcv5Oi3fVgsf0udNb1ve37U9e1kzxI8FYl
 oqOkdADnlSv6Ldurd2msJ3zek8xyUST8a6zPGMsXCfNLCzneUl6TxseK0Zn9TIa81DB8RPhGTb7
 GCR/SxpE+Uy6qAwBeCdAfLCt1Y1c8u9NaYgdAtoPoy3hHv1G
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX6h1s8m919NP8
 X5TfGoVjrCmawJdZGhugR0ipSAc0XJghNrmky6f89gAr659unJtuyOP1x3qnLG/UnHxsVzBXHK7
 DxXDK44qGzrqW9lP/FDMDHoD8cPS9MqVJZTSqGH6uZiLy73qpZIxsE3AU0C0eTQg/t1IYCAE7zE
 lFAlXNTiKUFhZSKuof13jlg3LwcR3ZcWaMVynqHCyfDJW3jsyK1slh0ah8AudlWfqB/F1Fm12MQ
 nzHJ5Vlakl/QyRni5Hd8q6bVaJGT+GYqA1TjC1/3qifUqk0J8bWwaHdNsIW4CNPH/rvr/2QhZhU
 Ikwgos0eOCmaUKzdXo7/SUEFC0KsEPOnmOEyEzPzoqxz+ZXWKY1M5DYV24UrXTeXuK0bxstnv5a
 GUSt9Xmv
X-Proofpoint-GUID: ZYCYX0m9aR5Qw_S2Ca8vFduficyMCH3n
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b0dcb8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=MC5GR9oWvUQqojeRwHkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ZYCYX0m9aR5Qw_S2Ca8vFduficyMCH3n
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

The SM6350 doesn't have MST support, as such it is not compatible with
the SM8350 platform. Add new entry for SM6350 with fallback to SC7180
(which belongs to the same generation and also doesn't have MST
support).

Fixes: 39086151593a ("dt-bindings: display: msm: dp-controller: document SM6350 compatible")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml     | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aed3bafa67e3c24d2a876acd29660378b367603a..0f814aa6f51406fdbdd7386027f88dfbacb24392 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,13 +31,25 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
-              - qcom,sar2130p-dp
               - qcom,sm6350-dp
+          - const: qcom,sc7180-dp
+
+      # deprecated entry for compatibility with old DT
+      - items:
+          - enum:
+              - qcom,sm6350-dp
+          - const: qcom,sm8350-dp
+        deprecated: true
+
+      - items:
+          - enum:
+              - qcom,sar2130p-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+
       - items:
           - enum:
               - qcom,sm8750-dp

-- 
2.47.2

