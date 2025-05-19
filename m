Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B083ABC37D
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 18:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BDC10E428;
	Mon, 19 May 2025 16:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O15bjRQr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE5110E3E7
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9iobJ005266
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QsdXMngD9SpY831RMUEtLxHZK24x3eyrHN3Zu861eo0=; b=O15bjRQrwouQ4gH4
 /OZUS+7lB2JzWiYwAYee3JeZeLdnzfCvuRPuxD8OzXCjaJ0QsEDeiDOxCKb+rMBq
 ZBPWOU15UXsj57gErb6CG4YgYpfzSKQUWmBiVuBDa6urlO+A01FnIXv739AhZuay
 UewdFVWZnq3zqhKY93d+2H7GYd0GQ3RMSUhdYcUHtsr3xW9fOcfgBRTwlLk/0rt0
 bwJsGM2ox4iG4bfKkcQhhFw9YS6Ze2wOHPthyScWIZWirOcb7QVG9uGT/L0KQfL5
 Prr/jy1H23u8fqWMdavrStaAgwl/G6OAvE7CMddxZ7qDav+T/8oGcrYWPEif3W2+
 Zqygig==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4vy19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b26e0fee53eso2582148a12.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 09:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670665; x=1748275465;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QsdXMngD9SpY831RMUEtLxHZK24x3eyrHN3Zu861eo0=;
 b=GY1oP7Xx+ekmgje6KojkuvmLgZANsHBOvtcdxZITk70jArgUqJKaS7/wWSN3ezFZC3
 qCwxwpehblcnvFTPgWbBGy0pt+rBzWCqsCfMRLBdY+nSq5r/p01/GCO7ULSKqb2w6Exj
 mDsGWUiu511ZvYbh5DK0PQ6rvKBvmWEK5xLnQyKa2zAgJyAHzFMMfyjDRwfmdKXR+dRb
 6LqTelhPkOAw1JTDHZc8vtfb84J07Noo8MJwkBsjSuRSj7WVMn05dtD5stJM7i3zD4it
 S8LIn7GkQQ/QwFrADRbMg1x4W9FBnewv5doBDxmUhdDj9zQ1BESKL2Y3uV3En33irVNz
 kDBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/AWFeR3c2/9jz0O1PXCuhlaJGSLcBkGnUiNmfiFd39spOaJcbDucIw1wZYqL4LLDkSdrnbNQryoM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBdj0ZnsMHV8uKtb6LchAYjPZ4oQ3a59l7xF19otF2bID/E/bZ
 ggDAMF0qJwwZqYBXFpxWZJzgjNaKfBpVqRJWf1vhUqGZWrRWxqvHwLIiGPYI7WOxS21+pYFmnpM
 lHHHMgLD/EOCIedQuMUzDHHODhcWYdOIlUUnSmvM4gfp0t2q4q5eiCizpg8851/20wY1nauM=
X-Gm-Gg: ASbGncujQoaOc0/1eZiynbVQ7ndPhWOzZOwZu3/SgkODmZBGs0YwhegAl8DdCaLRgqa
 X6Gv69YFBQPqJOQqkHHdst+cwRmJEqdJ7FcMteSTQThlwtIR2d1DcV8HvZCybX1DGhir9LkCfz0
 fdCdXXYtF2FOYCvqWP4HsDSyp8lf+BCrC9h9+4dK0W+q2VBC4SbyWF9zFcIRL/8b3w97rvTQkg5
 jELpimQ6SpaKYaJytKoeKgDcFGN1LNLjE3Gjo1ut1k7Y2rX8csA36MZGh0U3OlvtIIAYMLdyaUz
 QzBJKrVwLet1fUbRNjH9AS/OD4NyHrqrSJQfr1m89NZu0P0C2ffpUlRJWK1F02ZAxaYlrSSv9IU
 rmxk4yDkXcEy2WF9QG/AZAKLu
X-Received: by 2002:a05:6a21:3189:b0:1f3:1eb8:7597 with SMTP id
 adf61e73a8af0-2170ce8b3c7mr19611710637.35.1747670665421; 
 Mon, 19 May 2025 09:04:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAgP2IpHkPQc5mpQRAJ6cLOgiawQf+qDVCqKg7kLh9hrIasJ2kAl7ht4NNQm+BB69NkOXXsQ==
X-Received: by 2002:a05:6a21:3189:b0:1f3:1eb8:7597 with SMTP id
 adf61e73a8af0-2170ce8b3c7mr19611662637.35.1747670665007; 
 Mon, 19 May 2025 09:04:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:07 +0300
Subject: [PATCH v4 05/30] drm/msm/dpu: inline _setup_dspp_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-5-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tqpu072eQ+5A23S4ttcnG6A8dqH81CwtIIeKlnCS8Qo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z6J3GY8B6sAJkvuS5gDSIB00Ld6uwXdzuLA
 WEc4uG8uZiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWegAKCRCLPIo+Aiko
 1YeaB/94imUZK2omzTlTl9/OQoGQVUgiYj8QkPc2PhQnu5YxOeIs+2KgLQVCdE7OMLRm/45k467
 bptb05cQ+3z47kX9uDr9/unZdbVMoOIEQA+zc5Cl02URSnlvtvHADVRLoFAx2WuhXSuaTohnQYS
 Wul3+N8m8tI/Ek0fsoqnFYa2PWPs5wwYJq1miJaKWTe54EXP/scEKCMqojzInJr+YgqHcr5Z5W8
 87fznBKE8psaVEC5gqPyFqhCgaKqWPSyAsLj8MPtcitLrUj8ZlmhrrcbqfPsVAocRuP5bK5QMTl
 SczLhhnV55Cue4zUsxiKBmO/++PXG7iOosq7RqEkdhHpu4t6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b568a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ezFYmCdhRMHQQexkQpIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: alFbuIrvAxB1Dw1gaCSplXRnzeTtN1Sy
X-Proofpoint-GUID: alFbuIrvAxB1Dw1gaCSplXRnzeTtN1Sy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXxhMPXyiyVZxZ
 Vnnjo2Bh/UcBpf4aBGA1ASoXGba5Q0ZIjprInzcp1PyT+ctDs716REHy9ZC2Snoqxmlox8MWITz
 /2HiTb3koSn+7kXfmnAJessSb5zFxSkZdjlk0HRMMSrEaUsiOTmFsGsbPR0HGEaY0znorLxzRAN
 BrswMl/L1W6C9wqQvLIW47ieAG2xCD8xhAFtNleA6QriiDuHUHUMv6HjKX7onMT0Dhh4V7atbk0
 ufX5EuPuLbmH5DTw88kOJIw5fqsskhu6Su+Fzx/cnGe39FWd9XT9b8ZvhidHHKbB+4TcBQLtkw9
 ZioOdxjiawpIFFozYhF0WeS0dNPMD5CGlvMG574QA++AAP6kfjULleGKPDMuJHHIJem/tctT1z2
 K7qFPO0alX4KfsUfbjMX3q4/gtzMmC/H5ZfIjCDgRry5eCQbRz2yIpHvnwUmX8o+giGn4Jaq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150
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

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
@@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
+	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;
 }

-- 
2.39.5

