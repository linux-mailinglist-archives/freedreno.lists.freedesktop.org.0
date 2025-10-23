Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07E6C014C7
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 15:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDE110E903;
	Thu, 23 Oct 2025 13:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRJs/DMe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EFC10E8C7
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:16 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N760xV005697
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=KgSVmbG0CXT
 s53n44YyJiTznjurS7MAlfi9QKa58wbE=; b=dRJs/DMe/B2FAT5FnYpZzC1r7CV
 aN0SffoHW5d32GcH4bIL/wb3J87BwN4UA50SLQR4H952UwreSlK6qgScQtXem4Ln
 yWWb3q/jRqVjmdUTTX1ecYy8u7AdW6sOxGt5JD60mYxC/acZTlFIr7mcLIdyCnPf
 sU5oy4jvBxDPPthLj5CtKdbHifxsRXxB9IsW3sXU7nRRuLXQLKRFB2HAAV+Qgss3
 YOSWWxjkSmj49jTSf9bmQRyXChS93sk7m6739DnFn0ylZnOXvpIRQSmvxCMlHccW
 WE61PieIatYguwZjLwJwdUzSvOeCMWET40SCpNcwKdQxlcClju6f8I8gk7w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j7fx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-77e7808cf4bso469936b3a.0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 01:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206834; x=1761811634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KgSVmbG0CXTs53n44YyJiTznjurS7MAlfi9QKa58wbE=;
 b=UOUcK9IUoJSQZJ9thszbaCnMygdFfD1Jj9+wswHZrr2IK/R/eHpVHvuqCZLVAq6Rmq
 L6xCm52UcNz3zQ5aAyLPV6MmvLkPNtQYiq2n1kwxD+nSPAyt25+t8C+jBSaBn8N7GSXy
 LTgPIN2s+y5k473L9q56sq7pVqrGGe7o2DjmjdQ7kGoDhQeCCYmEvjVZMd4ljCtbMQn3
 MU3aLuZAnO/o1LHYWvzKBafaH/9vB62C3A/VZ4ij/oNFeRc+Rbpl+nzFqyjkSt29BqDO
 tj77u/kun9ACkjr9jFj2V30eetE4ikz13Bkh78fgiXMQIoXC/gJUbcNfZTGVJhU9/UFI
 v9Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIKUHcib/eODFRtFOVaxUx0gbaV0vMyyNsJExpkf1wqPclHFp1KPkHy4lG3hF92s2TdiqyjbQD10k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPBTL2oQ7/8pxgssiPeY4QVNuNFisnrDFSCi4VVTb8PuF09KXD
 l7iyCXCFTNUthiIE4Pjb4HgPNTp3S+P5ncgiPeFB2SsK4vA3V0WiqLx2N92dFftOYI9SJceytnn
 9J8svapynvxmApoMaWwbfd2s1DypTSJ2I3uVY+oVK/VvEw6JXo7IpTANCqSnUgePrZj/1rJo=
X-Gm-Gg: ASbGncvJrRMGrLKpNm1+KaByvhqzoZvsHwiYEKVql5rdiDvM0Nxl0F/uxqYe65OFRx0
 KWQcOi5qQIMar+zX4Gt6bmr4Jl9ubN4JzFkjCwkFAJt5jQjvrOObqht7hXqeu3ujIow3VRp8Ci3
 9UOf/RrSMdXvgMUP5i6ry+3jvenmJwDzhnOYSVWQcEhJ6zclACe7c8T7geHc6KA13qf6DBjYW34
 CZQJOZ4IWQ8ImVSUb8UIXZFhMAfOOwMPTJbb1lz6UcE/NzaAyCOLymLs4PiHXWQbJJpkjHw9np4
 y40ttiryY1mpd/ONaTwdiBL+Lk5cPJ2fpZ8aqDgECeg2nct55IAvIKgJPikRDuNULjQ3v0gzMVq
 r9nEaXlqkruJLqtocCoQZnLVlJ4zxoKIEmBZ7puaVKk4jWe+gHw==
X-Received: by 2002:a05:6a00:2182:b0:781:1e08:4459 with SMTP id
 d2e1a72fcca58-7a220ab550bmr33261070b3a.18.1761206834372; 
 Thu, 23 Oct 2025 01:07:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQU6DsEGqLwTWykfWX9a0n5WaLRPXfiL2M9UpRfxSjYlgMKuoDnFRY1LaCZvZ8nIr2wQVy2w==
X-Received: by 2002:a05:6a00:2182:b0:781:1e08:4459 with SMTP id
 d2e1a72fcca58-7a220ab550bmr33261043b3a.18.1761206833922; 
 Thu, 23 Oct 2025 01:07:13 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 01:07:13 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
Date: Thu, 23 Oct 2025 16:06:04 +0800
Message-Id: <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX8VM6SlzYTk0h
 EtSqt/zQTMhZWu6lXrIrhDavngXppUkW4LU71MgoO9dC8v5ezEymhBa3d5ZfUqnJkpJ//rusuwI
 evzpeVamB29HrIpTQThPrJ77owwZX603xuYUu/S2IT3etEmyVvvu00wLSf5ANxgrvuBU5tfJsQT
 IFhdp50S8FAGuL3u72Ucu3r0/3NBR8QYPIK1Kg6yi48J+BfQ6V+XV5F9lHWYrqGau/kTn9lRZW9
 cDZ73y2nvlY7Sd4kPe5ELnSIqUzQqbVa+9LTvXvfg7LoaoCJBB9Nm6IGAze1oKGn4khjNhgQtXR
 N3Yjiqdk8YsN2flr7KWEtOQAX0BCCHT/ja87VCuhrDxo57mO3AYGNxCa2IXUvnlM4EJnzLUbI2U
 O1K4yfhuxZXPr5q6XU248o14bJa2xQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f9e233 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=L7xdKIvrZdzy1bmArRUA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: od8K67vRZ-wd8VL8gE4pRItpop_KdfGI
X-Proofpoint-ORIG-GUID: od8K67vRZ-wd8VL8gE4pRItpop_KdfGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
X-Mailman-Approved-At: Thu, 23 Oct 2025 13:16:01 +0000
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
index d6a37d7e0cc6..7eda16e0c1f9 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
@@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
+	ret = regulator_set_voltage(ctx->supplies[0].consumer,
+				    1650000, 1950000);
+	if (ret < 0)
+		return ret;
+
 	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
-- 
2.34.1

