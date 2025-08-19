Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D25B2C29D
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 14:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD9210E5C4;
	Tue, 19 Aug 2025 12:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hrtw1sKo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7637010E525
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2XJ4s025503
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OPWsmdBgWK2fzbiKII489PmVXT2aCRqmtO36lTZIRwY=; b=Hrtw1sKofE2SkRn5
 eqE+EmbaHH+lURmilUFvUpZOSNvIo9oYtSr9HmBzIzK5XT/hDatw2LTi3QhFyeQr
 /xRh6j0VCu9RpRN8SPs8Mgar6t7snovEIyvU1i5aX29NaQQfrZ/XkkDanmRCg7Qs
 2RatRD4vD32mevX4ZVbsBjTepv2qbeF9cE2aDrn9fndepz6HheVzcTNeekZ+pLIT
 J+mEkbampmGuOOOquPe5d9NpXu+V+Zbw5G31MxLUBa6HwCWJUWQZ7Wv5DTGA2tNq
 R97EkBtJsMzxwQgg4txqtvcjntPr2qAr8C4yIPSbjivGQSp9zDnv8rZBe1jhbV9V
 aacaCA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71chr94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24458274406so117432295ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 20:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755574462; x=1756179262;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OPWsmdBgWK2fzbiKII489PmVXT2aCRqmtO36lTZIRwY=;
 b=pbltzAiEO8l5di5+rAkOirjeex7NwIbYKHaIqwknxn50VtxwG6e889rnQT/HN0LrWt
 hmuMw/jdUT/kHW1jmmt4rObsbJ1jtTu1i/2/gaBIXBaDFjJaCBga3h3pOxAJFXE14SJz
 JCbXDr8wsXYqqcolm7znybo+qaJ4lBCakR7FHLYsxLZ7DnUG1m7n2gaVtvIwSHFWT7QA
 xcFfKsIreIH3V61vRhWfRYDOMXvb/u+DCBS+hJw6jtF514xNuLJd66d928A0mTKoV+8N
 Zpev2lFGD2qB1i0bW48EcxGBx8s6vlMwDo9BTfir5ZynX8OSLmBER0sMNp4aDFHkWihb
 cHWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzcSrvRoiIXqwpwZ7gqCR7ArEkSEsyx7wmYRQWpcP7lRxPovnFcgN2fzRLIeNEOHlKfrcXctr8qP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMjqLEJM8Vdq86anfbyRAHsEpw7EpuxnHACTzQgaYAOsqlGTaT
 f10949d/C5YslavscAoeWRz8KYP3Ph13kh+sqCk6PJ0t1oclLCzgmQJ9T91l3/JNMEu2sO4dIbg
 5IFxXPBdc4VlSTz/SxcnmaUfGMpO5kqbLEBnTYS2/yhlF2YeMqgTgPMhimLiG5hbzyE8OZ8k=
X-Gm-Gg: ASbGncsjYSs7GYyhZpwv0IFBgyfROx+89RRFhO/Xh2za5io1rTuOvyUWr6fItKtI4vV
 gILBi52hkCf4ixndxvF/iceixWMsKIzqJMgJ0CTNmueK5oUI0O1FFzLhOiYyjxqqVZO6UrccIKY
 W8mgGLAkImqyFGV8txkL7zNFof9qkmpzunm/lhO7P5m9koo5lp7ydyzqYRT/qEqQd+TGQN+gVQI
 TbnpT+KrUbP1lQRaIM9wNEb0jwNDMeQDluw35pcwQxV1BYFsY18tBZv92ZmE1X+zTvZZUrZrVKv
 fR7yFJOh1LBf8OMSzK1+Dn5CcrYK84rosBQIKhX1bVNF6EQIVIuP4LfXj4RTQECL1DpvJIc=
X-Received: by 2002:a17:903:22c8:b0:224:23be:c569 with SMTP id
 d9443c01a7336-245e030d92cmr15552975ad.22.1755574462100; 
 Mon, 18 Aug 2025 20:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE13BxWQaZCSpPUM8Su6OLbnLn7Jh+VfY1RtFqcYmy31G07dgHHw7LC/2QnlPkdHOv24QeTAQ==
X-Received: by 2002:a17:903:22c8:b0:224:23be:c569 with SMTP id
 d9443c01a7336-245e030d92cmr15552605ad.22.1755574461668; 
 Mon, 18 Aug 2025 20:34:21 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d50f55esm94486325ad.82.2025.08.18.20.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 20:34:21 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 11:33:31 +0800
Subject: [PATCH v7 4/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs8300_mdss-v7-4-49775ef134f4@oss.qualcomm.com>
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
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755574427; l=1186;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jOpI4nmnKEmv8uXLQgSky6yvZ4rqxGLbRu05MSmbQfE=;
 b=Mhpyzs75r/w1fcnROY7DFyp/qHvsah/YEHiiC08YAODExISlfqMhgNgkJqs5WTOYQff50uSim
 Ynx34vWm+hVCP/Vw/bmQ/fifpDV9h6NMxRK+9bcfEyVEpmAPeZNaa9g
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: 09h1v5lmb4TJbQZUH9Z-fF4Cnv-OC6ws
X-Proofpoint-GUID: 09h1v5lmb4TJbQZUH9Z-fF4Cnv-OC6ws
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a3f0bf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX5JkcH5pboIiV
 5QD5NwZtd7fxvfudmwfDIE1QHEPj6lqUvB+coyBhQqMmxa6z+ullmQuo94X62BhwpBHzmQg05+h
 hfOTD3n/j6SWziP2t9TEBQdddXNLMaW0QiiflF2+JFWHr1mjha/JddJqCwGWlUtpEMRkPh4FIb3
 SHphhfHPe4gRKZJr8u38y08bqbyx1ZYPwaR1DciJMQ3ikR6TcltsscSq2PQNM3aJiFqLALNBfCS
 aGduDKD2GwJ24s6v2eFza5RdsX6Gdcy4Ycbp7KY8XDL24+9FExNwA7w5w0MApgVjR+YGwiCReNR
 sjsrQMsUOERkme8lTr9O5HImUwRKH/vYaeVSfHWgIdvF1/ivFt98dmO4Wi4HDOhkccvlMMl9k0P
 5oU6OLwV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147
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

The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
the SC8280XP as fallback for QCS8300 according to the specification.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1490a7f63767bba176e8e2e76891d7d2c424bb7f..b70627d40dc4c671b8a855a17d4b8ca2dd9952d5 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -236,6 +236,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
 	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
+	{ .compatible = "qcom,qcs8300", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
 	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },

-- 
2.34.1

