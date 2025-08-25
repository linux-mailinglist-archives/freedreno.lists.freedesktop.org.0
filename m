Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FF6B334A9
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 05:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC25310E10B;
	Mon, 25 Aug 2025 03:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGgDr/Fz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8DE10E2D6
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OLYioJ010519
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=; b=pGgDr/Fz3Upj9d+I
 At0CdDfKw777H8QMjqQCBobmuLqKx+uNxEtgVEHKcwfFRS7BV8ezxeX6Yci6r9Fq
 NmyNYzh+kIrNMNtV3Amcyp343N1OPnFk+oSJGDlOQqTm5iu7SL//qTbvWU0mucvN
 1Ja5TsExp3z5vqtLS9ygTrR6yPdS+4rxwwbzI/9/3jiCDWRPQDHFrHiw3qS50eAc
 n4c5oFlmPnGeuOK46EGE1S+Aychkxpvk+l4iqNIO2oys6eZ0SS2NNgtiiqYlO1po
 m5A4M0PmBR43xwbmlA0P1pZKgYX/uwGMihjnDSc8fDHPj1Kr3qFJjP7QuxXnTA14
 rkQ5hQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thufxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-244581c62faso48964265ad.2
 for <freedreno@lists.freedesktop.org>; Sun, 24 Aug 2025 20:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756092977; x=1756697777;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=;
 b=VN7tSipLPAe0XWGrK3ADFZdUAsOt0llacglVwqpDudLqDD5qtg7ljU8x1vbK/26P1w
 BBRBF+65Z8jOfUWLSUh5uVjm3I4rpft0tXU1hBt7+5XvPBwxrKIye3k8/8W7WCXaBkLX
 7K3VAdEpuw0ZZ0skFqdslvHBMzBn0/wgPwfQ30+jMWMiMogKeYXOidzLjxK73SEY5nPJ
 W6I5zCGklUhJqTqVGcOvRJf4CWkfq/D57+R+2d7g3jVSLUgomwK58B2m5o2kY38dmLcV
 OgTcIGXqmIXOAt2G2IxNSEUsY1fJ40xvDXXqt6GCWFGNwio65764teKxCDvfQc7WJCGy
 z/lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfdtQsXGfKNysOlRddrjPZoCgOazJc2G4T1+xbKSXAhjJfZv0ZNfgvFU8lDJB+ursP20GSIJCugDs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzG0T0KjMnWZk5AUZ4cbx3VnolqRrcp7A4SBhCizJOzuJaSsP8r
 dXZaetZvSXIE2W6WGGhCEozPQRFgHtOLrKgNWZ4y6ZaXSjMOzDA4f4s6mOm/zJv2lfhZihmmJie
 3q13/FN8Im6Sgk5m2DgycQBSCZmdLuV+3raal1KanE6g0XKteQCUCoWeYRshlHrju5u6BZP8=
X-Gm-Gg: ASbGncsZOk0nCKC6/GK8kuTb2SPbmOUIruaJGA3U39TxLkaQibpNKW54gGlTRr6eL3H
 7c+M/K8dpFmMVmRbIGgAd8UtvoBg5hZFpY8UGiHM9glKrQJx90Gezmf76933pI1VPgihkCKbsi5
 KDto29rdJ9UIH9SZ2LoInECQ4eIUpKNmqXXuHXCodGcnKBzJ7mCuCUscG/GytmJhAgKh1oxhacv
 uiQ9Qi/E/tXwZks89E6OkbDx8fyicKqzexWHfw8u1IlOvm0b/boGNDGx3sTWplb7erVUdoOpYoa
 jl0MxlZCgxFfcBHLmzr81Yalt4EC3GqUoSxRZwf17u7IqoOW/PTL0Lz5JtxKHj6fJA2MmeA=
X-Received: by 2002:a17:902:c94c:b0:246:1c6a:7026 with SMTP id
 d9443c01a7336-2462ef5fceemr147015055ad.40.1756092977426; 
 Sun, 24 Aug 2025 20:36:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUHF1EOpueF6zxgZFcVMl7eVaFCuRiBqihrB66vAAoQ0pqCcjvsZWuWh8z1BidLoA1l+DrmA==
X-Received: by 2002:a17:902:c94c:b0:246:1c6a:7026 with SMTP id
 d9443c01a7336-2462ef5fceemr147014785ad.40.1756092976954; 
 Sun, 24 Aug 2025 20:36:16 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466877c707sm54859565ad.22.2025.08.24.20.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 20:36:16 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:34:25 +0800
Subject: [PATCH v9 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qcs8300_mdss-v9-6-ebda1de80ca0@oss.qualcomm.com>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
In-Reply-To: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756092927; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=;
 b=+HddgfRGfsccGRo6kGLEJNIBQn6m5wNdaACaxKf7tyrPNIGgvaclwhJLOqcbQW5QheaYxKVIC
 zxQVvicexOkAOWG5myMhf6iDOKDelASLJfIQjhcr7u8lGqcq2fdmsdi
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX+ZKBuIWnvw0X
 Atf6ec/c4fP3mbnGQWkhCRf6TC1o+bWbTF/AI5yPHSNsf+WLq5DoNyJq6pHU5b8HQ3wsRbN7M4f
 lMQ62iiHwYyMdhd3CzGYLGE69qpJAZAkk47uw3ElvfG1ZV3R+vO3PD+tmcDLuY20VQCIPzIjRUn
 /FlgrobNKdCMpOsc58dQvzes+bmG+5m/eYBPpzZvJzBrkWFjsXz/gC4l7Tt4h9lERw5EPd49E/n
 ugJDVPG2bTROPUYwb+Uai1rWcf+OHXi1L+ggSFQJ+w72i89DsnaA/2Mlz/13vA6y/dAiWtvV2bf
 xwOGZlQmhfiPptf6+Y7RmDS0pKf8dIFnvrFGNQ8aIQp/E3Cx3YqxvMc2+dNhzwE6FW6UMvxuYzU
 kPJ/fu1p
X-Proofpoint-ORIG-GUID: 1V6hjbegTz-yA0nkWbvnDm8lwU2JeQWx
X-Proofpoint-GUID: 1V6hjbegTz-yA0nkWbvnDm8lwU2JeQWx
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68abda32 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=E9mFum2VwHQHOKsBOicA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043
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

The Qualcomm QCS8300 platform comes with one DisplayPort controller
with same base offset as SM8650. But it requires new compatible string
because QCS8300 controller supports 4 MST streams. 4 MST streams will
be enabled as part of MST feature support. Currently, using SM8650 data
structure to enable SST on QCS8300.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..bb4660585849d1a67921a28e7e12422e0c327ab2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -187,6 +187,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
+	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1

