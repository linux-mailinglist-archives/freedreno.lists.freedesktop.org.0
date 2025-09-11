Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A03AB53035
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 13:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D719810EAA9;
	Thu, 11 Sep 2025 11:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtvCC23R";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1676A10EAA9
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBCUeF007124
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=; b=XtvCC23RsHklyInm
 c7KoMjxSHqMi8zxFc0624vmpxQrBILAimTeu1L3EMV8XcWYrGsc3sNOtO/pCUxnN
 9O+qTZ0stmuCoVdwWBvl8BA+hD2oDJEz3DrtZYOMq4wjLWCE8tKOEW3IiWWBPoru
 qeWvG4t81da0Wbfju6H3YPuKCe/pTeHx0X5yMLxGe1jSf/+uFRuGJxIynoY6LF2O
 zJhoiAQiwhYR3eeD5bJg/4ehuqh1uaVEpZrFg4kvvaaZpnT5UiOSHJgPAEEZENI9
 vv4mEynB3CXsgs4YIei2CJuPap5wIL/Yl+8e9Kmc10MePBahURBkKziFxoPlf1Rz
 Wg61vA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8afcc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2507ae2fb0fso5591755ad.0
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 04:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757589887; x=1758194687;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=;
 b=aOr/YBQytKcDgsepEI6CntSNcnxxCMsziLVFTC6StMmH4Z0hzg/ibeN1IL4SmVdg1J
 FGATXubKjimpjwrMi9pq/pjVwKZ3JH9tr6mpueOKR8OlYgVkm3YWiVGGgt/KSRbJ/GG3
 +nf/FUMrM7c/CBU2fVAwqkYCemZqGhv15nAYXCzsCgtKQTxf+5kBX8GdilTNfnjC/Egt
 8F8woystkUw069h2Uy8x6slIh+lEsXNCVxN+c7R9i7/TBjBUWT7R68TfzmbqpqSAnESD
 NHuiuyLrIb9U6sOz4dQes4pnwX/YhJHTkMyfByoqP4zX1L8YhAm22ENteN+IfZAb7DAk
 7n6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7eTVSRT1ivHBH/Nw4rHezMdWI4KIaTAGBTZhKbyg4D6hLbTmLzhtVZt2TWZSxbda9watCoFg6T90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6bdk+ld0Rn3hYn4pkAhZkPzq96ccUgjymSB9nuwQYQV0nDaze
 3Sfir1PvlBduv5zj6+L3NuwbV7Dh90QOh0kvIEIOstbNLxUFl1UZRSRSIfnb7afyodKxk2yY48E
 pWSoeRK6gb2VBK0TDTtuLxHayBOwA7pcyuukseiJbbpXNy7dGVLNUaUJ54dX37CA2E7l2CKw=
X-Gm-Gg: ASbGncv11Lctp/LQ651L+sdW2v3/bvaFX3lpiKSC4v6NttZ9bcDjs8jkH33y+j0G9xA
 32Pt0mVpMiPbHKi+rKp51rVxa7VpxZmSkK/NNmtd4LR0ZP05QIm7x8fnSSjB9g64ndfdFuhAhU9
 3MnrFu0KXhGZpY9X2XgXVW4yqTES7KbrMDzL60M4G2EquVo6UJ+lZ0kBrGnOuJ9jji/vkVQD+GQ
 PllAs0nQWBxqtgd0gYKnBRyujwjPC2OJ15L6JhuNBhWZbjCnnSJsZvhMzbVF2fUVw0jwo+nykI8
 8CRx2JnlZ/OqxnjYFK6wXunDG60wufpkU2drH7vsUQeYz3rO6UcIN/SA8oFxjFBy4grXDIGsYh7
 dixeA+q3DG8LxCUlquoL6XEbZfYgDFRyY
X-Received: by 2002:a17:903:2346:b0:24c:c190:2077 with SMTP id
 d9443c01a7336-25173119212mr269058965ad.38.1757589886650; 
 Thu, 11 Sep 2025 04:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6QZfPeqjAdNDP/IOs1Iw7mvPTxlF9kQau40+ELjQ7Q8xG9vYN+Qx9eo0Ez25ipgoMd6bCXg==
X-Received: by 2002:a17:903:2346:b0:24c:c190:2077 with SMTP id
 d9443c01a7336-25173119212mr269058525ad.38.1757589886162; 
 Thu, 11 Sep 2025 04:24:46 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c37294b17sm17005365ad.40.2025.09.11.04.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 04:24:45 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 19:24:05 +0800
Subject: [PATCH v12 5/5] drm/msm: mdss: Add QCS8300 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcs8300_mdss-v12-5-5f7d076e2b81@oss.qualcomm.com>
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
In-Reply-To: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757589847; l=988;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=f/HHi/48hqff50ItUhEpqZ+zfupVghiSAFK6cNZOm8A=;
 b=WpU6ED7a5F0yYamqUPXQmbEUElYlXxgI9Gy6Pj2DC+Dd2tBeAmG2l+2DtlQb/pKR2RcSjT3jd
 gjHYH2wDACyCQAfBTfxBjEIffU98xb0MjBM/hBwyufT2axZmE9F1DQq
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c2b17f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w6jnlB3v2fMHmChJ9ZgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: k0yo9fkPg_MyBcLMzyGlbtrI0xQ5sa1I
X-Proofpoint-ORIG-GUID: k0yo9fkPg_MyBcLMzyGlbtrI0xQ5sa1I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX99IZRS/ll4Ez
 dlVb3UjPblSMkxHOS9O1XMv50NLFP/raeyfCywB/Og+OVOlzFNl2MGdDi6cfsT4i04UXEF0n71e
 fji0UZlrjQPV4cmBzz36qmjZ/qJM+96CuZBmtLxb6S+3/ZmarCpx1f7Wo03D+WQT/6N6nGIEP2M
 Sd24vwpWo7ndzmSui0YVNk11LCvh5zSknBhnDMaStGBkiZlwf6Fv+duVSOrj3cnvwo5kwi6vqU6
 pz947fm5O2Dw2IscR02n2wkEjGpbW7T3O1SOPX5BGFdLhTbJ5NLmy2j+DHbwCi3Gj3NxZ1fGjsB
 kMX2yZdtXwO6LYXQpk4Wu/h7/B751sUYzEqYaO+72A4k05VjdTBlt53B8xgtfnLCi1g6FpTphuw
 wWe4ynVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c04..db2f0064eb72 100644
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
2.43.0

