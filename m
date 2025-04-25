Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD500A9C440
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 11:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BA910E917;
	Fri, 25 Apr 2025 09:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9ujEnMQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A77C10E918
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:01 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T6uK016010
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 E8whSwmbROd5U4SW4xj7rGIwJr7viTDgjWVNxw4D21I=; b=S9ujEnMQR65qi47W
 HroSG4bST6eVXaxvIeG5r8dhhrSiZnEwFALHjWXSesZ21v0H2tEfaMpf2hPn8JKe
 o566I70ANHDNfFeIMpN4Kw0vp5Sh60cAAXTjpieLbeb+/Wq6m/k1YPD5fOK72Nqz
 DCxq6jSVvVwJagGU/2kk7RctbFx/x+Xn056EvcTS0CfoOJmsdjggz0FB8mRaxNP0
 OCcieAbc2cMV6IkVMFmBea9qud6nLRuGu3BurbSX6tb5mBPUYAHAzR6gOMlNklxZ
 jue7t46m21kJV8ZoslxemP1g4N5RqWENOir1RGoxK+YmNp+LNriF8UZDgQJytQZR
 DObfHw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh08jj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:51:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c760637fe5so369649385a.0
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 02:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745574719; x=1746179519;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E8whSwmbROd5U4SW4xj7rGIwJr7viTDgjWVNxw4D21I=;
 b=pKSCYAb3hPIlhWHNgGs2WrIoaSbSJyAwIsCOcAfzIkm/tZVAXPCsqgfRvm+mT9vo/C
 Gpr0hTyK82e2Pp3LakpirgrBK4x9REpOr6hcpATU5lkfwVi8Ws1GYotqD0Ee2qQbxoYi
 FWZ8BAFXRb4O2JnfT7eu6stlJGZlDRSv2fAehT2hJuXVF5QgaTZFhoO7mcl13LByzkZ7
 WyqslrNdUY8TrGmY+zEmnhiTQ3bl6iouTQhvbBF0DESS5KmeIYGCDr3RiO4w2famhics
 gwsm9iI0Dq7fFdzhq1aACilSe1tNf4LMNniqYK2mAwPZgMY0RUVObwNFl+BD7o5jHplB
 idxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKZ4z+Q4iWSRqLbXq3a4sMy0E5kkymjCocD5vBLxVSLWIj7h/vRZK62JtSrEjeSrs7oc45rDgrV+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXElArwJFhaV9O07dn2Tn2IxLcKFTBbCqB0sKY0jPbRmulWEZ/
 PNF2VumayWnlxLsjMlQ/ktemtcWHsYGjQfBHgxGTWToeENCtMdq+8GPBjfa8oDDS+Uv8D1GjNd4
 HncTzsSe4Ddx6ic4GPBr588gWmcelGS/Orwvtszv0mjrmePYNTZCmLVgxHxYIpeIqy0M=
X-Gm-Gg: ASbGncvKcL5xXI+IW/CXU1GAxKpV1CE+fCF+cX32YBYccLk2eKXH+HvgHvBr+yk8cRP
 KgQRAWBH1lhOqurqMnM42Fm7Kt7a/UDUIhnZDgCELo3TP9hkNbFicT0DmZti3Gasf5T5DH6R1ld
 XwZpBotHa5c+h05ZvFAbzYE/l5yUm212wKyU/xlSwBN2WypSd58YJSjk+Vj3P4ye2+djQJu1Lcb
 MSR4EreDeD1qNZLVjMpFqBgQE82J1OsubhJi76fLeAYy7xa5JLTYWlVc5REFJKh/CMN0kpWRp/R
 y7wa49dElAJuJb5HL5lG6Js8vZ6ekwGNMOrQo8ApoH/hkUbhVh1UhFa+3xXfcwaOPbRTJ8V9tF4
 pf+xZcrmFgzKadamAuZPrBurS
X-Received: by 2002:a05:620a:3727:b0:7c5:4673:a224 with SMTP id
 af79cd13be357-7c9607ac4e5mr267490585a.50.1745574719236; 
 Fri, 25 Apr 2025 02:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmYWemUx6sBPB/T3b50nXsfecUg6EReTeevtS+qwLs/fKOYNGbkFlAmCHLkfS2+zEw/XB0vQ==
X-Received: by 2002:a05:620a:3727:b0:7c5:4673:a224 with SMTP id
 af79cd13be357-7c9607ac4e5mr267487785a.50.1745574718908; 
 Fri, 25 Apr 2025 02:51:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:51:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:52 +0300
Subject: [PATCH v4 2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-2-6b212160b44c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jcu7uq6H+6YPyRALgxceXQ2tUNztuo1HlOXKZXH06DA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5U3r9aVtf/3nh7d3cM3tjHy0GNVxGrgrty
 ABAzdzfrgiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1RSiB/9bNTmnNuezj2sMP5aBdfaObPY0aMItydxeikXSRb/vuIv409ORenKD0alhIeO695iE8lZ
 aG5XdPUWHO9fgXhk3Iuoxbuxrke/rAONsRKGZc/9lP5Cc/gIG27iuLqTcCd6aGGdxiA6QegYMVK
 aVQhcrHrsfGfCIzaOueCHAES5+IThttFM6yWt9Prajk8UQJ7WDcF0UjWQsQe1fN/QquDJgTqAer
 frSmwKpldbpltLgT+QZysn3Nv8m7wXjSqg9pRpBzrmnHwz39Ep6rRk7FlUr5b0I6NxBvVcVfZvT
 OI79VECVQEcvGp2ACXiZFRqyn94aSdIDp0KjjUupWPN/3uXn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX5zAtyPzeJmFI
 rj62r0JIRwHcofSWuhkHq0RxixzX7Yrm4WetrmJkXtkyNdMZzMpALyJmFsFMYImXJGKrCjr32hF
 zZcxDC4LeXCbMYV2A39QQtYS7Kgx1OYhBPsNcIHteenbKXLz5NRzLWgK2GQtd8vbqt6LnBWYxRh
 057H8M5nXpOvzzQAqZUKo49jp48+lAgVTw9iPpKiZ4YA+at8NMqZ/nE3SgNb5uSsKCqskQBOZNA
 RVWTGabbSs5GednwtdongOYbMw8+741ahYJGU/O+OLG8oMoZrzW0H//zOl1GpYjSMZGe1cvheVV
 nEaw0NHwcDrtxPFwZv4CeBD2hcVZE+jdqrZckl8cKs8/IZI1aS3tZ3vOGgcEGQHDyNu/YreywmZ
 XEvarPoaa/PTYE9VhSmYllLzbmsK1BbqoHxdD/RIpNXKPHnbm7tW5dOdfjhGqYlcZuUjHlZR
X-Proofpoint-GUID: 2rXtAKr_Kl5k4bJS_d2sr5l0JW79zZZn
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680b5b40 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=QS4NkVPmAqbJGmbYc4kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2rXtAKr_Kl5k4bJS_d2sr5l0JW79zZZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
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

Drop the !COMMON_CLK stub for mpd4_lvds_pll_init(), the DRM_MSM driver
depends on COMMON_CLK.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 94b1ba92785fe55f8ead3bb8a7f998dc24a76f6a..142ccb68b435263f91ba1ab27676e426d43e5d84 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -207,13 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 }
 #endif
 
-#ifdef CONFIG_COMMON_CLK
 struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
-#else
-static inline struct clk *mpd4_lvds_pll_init(struct drm_device *dev)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
 
 #endif /* __MDP4_KMS_H__ */

-- 
2.39.5

