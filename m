Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69358B2C299
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 14:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4376410E5BC;
	Tue, 19 Aug 2025 12:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBOq9EoF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DBD10E528
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:30 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57INe1nl007298
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c7ZlGnJLq3+8VPdDBGrjVATTNbjOXYsVFry4SHltG84=; b=jBOq9EoF/fhoB11d
 p/8AZMQlBQkJLJl1pz1YzheO7gBtxEC3pb81u2V4V2gvrfZvq2r/4FDxTkKbecgS
 5eG8kDSO/TlPhTImxtVrbePWdrtCS1lV5WC8bWmlWXLh/r4ynV5gka8QBw6EN1nO
 iOvYF499PhiS8KfmZ+jvDonAE0CP4vD/WNGPOiBo98Y1zZe0Wf6P65iGJup+Dw2u
 6eATT6JK7jmg7YRPbKDpNWtzOAspNgUL71Un8eBtqxUxreYWJ0C1DtQk+LXKlGwW
 B2+F4hGOZKp/35KMDVghHwuz28kKBJzVHvHNoAVd1VaDinDBcVLmKfDREOSxGbjJ
 7I0ong==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2uf3bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24457f59889so50666695ad.0
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 20:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755574469; x=1756179269;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7ZlGnJLq3+8VPdDBGrjVATTNbjOXYsVFry4SHltG84=;
 b=H+vCdSwb4bfxscnscBisEGKOhyfbuH9+I941RszYuhGorLl8Z1zzJddTnYmg2K8hem
 ntdHCfjNSNZ+895AcU8VFHyjZvIy+rLNRzvXCkmqgTxp+cwP9l4k5B5ALqw2+yrOcmuE
 O/8eGqSsQ23oMIUVqwafZ1f0xbmjje7AJNpAwifKYCk6Rd7bTDVzDYdYP/5Srs7081m0
 8cu/hqFbTvVoPA3yYHvQ44jiNekkujy5zZGyHgr7t2g/X7YnI4/lecgbjkB7CSIEIthG
 4c8gqKH3z1dkiMHzJqsztpGhzgSbJq87H5AQrXouVkhBL2f7Lzh0qRq3k+WIQVC6nbCz
 p2Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC+7JGiBpflUl69LECRgVs21Vsq+zh+ySunU57bHeoY4mghbUIhsPtlPnD0eWX7g4Z3bgTIKn1r5s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBqtuBwuRvgluXqjB6pNxEq3rDhlb1ut9012vI+aTDE9B+8J7B
 5FmPMVxeJrgoint1kjv81DwX2bzNaUp/RTtYnNk1t7WVnGkRtqiFnxQ538DjuYFY24m7E6oLpYh
 rTN/jKqANralZDwOj+c4clRJAuvr1nSn5WU8iIBHZ7WLc+tR44373eKxoc4MuWuJWDQXioK4=
X-Gm-Gg: ASbGnctiGQtRwPC6svyvBDuNLiKt0WUvsrMkJaSNV4AkA22vxg1nb8ybFqL1pGvVXi4
 /YTHISA3FurMFbI3ifC2pyeAWeVS49dxuUYVYclEWiBm8ujpWlEOp778k2KFlaHNsNntjfTS8Fk
 iHFtKJtwHUsnJDxqjJRtEogvssiCZoH3CA5VOfdY9cayAI5j5+nA8ejBYJI/H/Dz6SNJODxh31z
 MOUxq2klil+H1/OOGWHza1oLn0ev4bW+Xl6Dxv5O8Kt0BdJbvOnDEkJ/Bn1A08p65yTg564UR1T
 6IOV5zvyCo5pf8M3Th1/iRzksk9x+lfJwwqD5G/Rc34J31GXyJUDgXcgjc1+/2YsRlK45os=
X-Received: by 2002:a17:902:d4cc:b0:235:eb8d:7fff with SMTP id
 d9443c01a7336-245e0482f9fmr10590005ad.28.1755574468900; 
 Mon, 18 Aug 2025 20:34:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1JFgru4hf1iy17i0CObbmSg5dyLheaV4AtduwGDjvOBwcV3Gq7ppd6xpwIwMmE6ACKsiVUA==
X-Received: by 2002:a17:902:d4cc:b0:235:eb8d:7fff with SMTP id
 d9443c01a7336-245e0482f9fmr10589795ad.28.1755574468461; 
 Mon, 18 Aug 2025 20:34:28 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d50f55esm94486325ad.82.2025.08.18.20.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 20:34:28 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 11:33:32 +0800
Subject: [PATCH v7 5/6] drm/msm: mdss: Add QCS8300 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs8300_mdss-v7-5-49775ef134f4@oss.qualcomm.com>
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
In-Reply-To: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
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
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755574427; l=977;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jx21lmx5MGZ/FfsdeqVGZncpC/OsVU2to6SdDDH2l5M=;
 b=ImYRC7sd2hDvtu9kDUR4j9uSNjtTCgqBVkh1MYWwvd6QNeGLrdTV3xFIkGqkEQEAfQekghy19
 TIZij5TnEnoBeShRac//+ic8blMQwGeM0RSHAJpsmLH3sryOvrEhsrP
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a3f0c6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=56KCLgTT6E_AFdM1kc8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: dZTIvF_Q7Z_vm5MpmgsyUZrorKmzCbuo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX61GkjSQkP221
 bRfcXqUjblnXKsvmU+BjOeBaW7yT9T4C3mWEyI23GrXBJwMSh9uACpJyBk7+sGkAsSXM3ec2+tX
 yPYhvPZrlYrisMbR8PV5Eo8vyn89yIFa/d6ElfAbwZIs4EsMh5DF+JJOgFDoIeEM4f73FpMLyJc
 fdsctHzieb7ovWkPW53T9+Tw6QaSb29rrf5GQLy/WMVzuhKWz9re1zmKlgVpoIDPas/sLxWky6m
 CRp7tF2MrxIGVuzPebXGbbQ01WAKu0m9eY65yoTIxK1nZsVS3ccRzDHBxC8TJ7SYhKRecJBZ8tl
 Vn3ggqaaxHyrUZ6+EinCudOs0PlsaGI9Xvhd3E0Q4hiJWpqblHU9SYx0j1monaKFTYRb7UERDwE
 +8DP/x0Z
X-Proofpoint-GUID: dZTIvF_Q7Z_vm5MpmgsyUZrorKmzCbuo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031
X-Mailman-Approved-At: Tue, 19 Aug 2025 12:04:42 +0000
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

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..db2f0064eb72e8a990ff4806f60be74d3ff8dfa9 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -555,6 +555,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },

-- 
2.34.1

