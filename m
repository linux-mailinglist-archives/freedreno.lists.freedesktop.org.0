Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B288AC13FE
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 21:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE8310E7FB;
	Thu, 22 May 2025 19:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c3mb5SO8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF09D10E7FB
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:03:55 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MEc9xV031677
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DVSKO5Tz7Xwh54RBpw6e9ejvFwUu+HWI/6GMShXKYcw=; b=c3mb5SO8ybDVB2FJ
 IE6JfkbXyx5MmfklP8Jl+s3auExSL+0ksHdQ/+t3NPEUToq33SCyGcG8cgG71Adr
 pVXUuI96kUwgyWj+jWaM2p8MAk27JEFi2RgDKPQ0wX51ZJAtXIXMIRwEVrw86kKI
 ub7Oi76H7nBMCjLWI7Fda8Oxp027KJrM5sSSsqVi7f7jI/yQk2jaW2SCqpZSMnI6
 SgpZx6JKniqRT0UW0iQCj1zKfIbFnpYk4QKHb24fK+k1XVGqsfeVt45GP+4P+FYK
 2QfNoN0kx2CEkFzhUXOoWdyn/cmvF2H+Q4EXWfvZS/y2RLhMkefUX+fTzqmqXloT
 f2BaLg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c264d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:03:55 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-72b846873b2so7328755a34.2
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940633; x=1748545433;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DVSKO5Tz7Xwh54RBpw6e9ejvFwUu+HWI/6GMShXKYcw=;
 b=VLz+s8OLaoJteo6oUWvWRfdU0nq7ViI44gg2pMxL1WYieR92P1y0qcf/6UWP5X26Bb
 ACNM/KsuIUfUdEF/rAdmVhPbDzThZxfQXm+wgleglEV78HfJ4LoF6t5zWUuwVrwtk3ph
 cB88Wx6nVIcu8RqgJN5pkhTDsQyRxWoOkQ0MWSLnLOZzL4JjLW5HDsrE49lJqT6FEFzx
 9RrBTATYYDzrR/RCIqlMFZqhsf4Z3iRj01g/suO00ViWWuaO3YbnHQxHaLRgL7Ax39rR
 BDem1bLpa+nU0h4mdscKh7TEIV3/0QIY+JpWSFf+1WjghRy1bMKYuTqDwnYJjNDKS9SQ
 mrmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeCpd2OGduDdkIKQUjyeakGoOmswR8KbdI7VPYdTonh+l4bUXimhJuF9EmAwX35o2YUKNV3ch8zy0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwANltmAiT9XtJnkm5Wf+drF50a7iqOd8WszAVuJhqJ9G4UEbbc
 iUhhfSeTOJneboersxWpkjmZ0K6vsnstSRmQCV76H6QFnQUdDreq73hZ/XhWi/jnl0pDaszzzro
 gb2v5+4UipAdHbmbNxWzQM72PGo/DtViVPZ9IIB/Omv3qomZkATCOBi6KJedPNlXvKzlkIV0uI9
 aUpjU=
X-Gm-Gg: ASbGncsRoYBAwUZ1n301x97SFz6iZy81zmdKHZjMbK6RZ1Y9ID7ZXx+yQKOei6/i+XT
 bhYsE4hAu02048cjA+NQsvMu9QXsXozor8+tL7z8jLUYhg0oqzzrX7i0VZ3CGXtDeEhASCXmh6u
 mafcV23YmN99ikkuc7VnRhLHSX1rCJwXA1ZBqcO/SF0hIZabDY/zD8qrXdLTZSeOhTvXsuaClIi
 5ReJgDbtbrmPKTBtY+OgztiMoIMXr3uv+mNDVa1jpR1vmg0VE7/xxOXa5SYgCBhJyfNYgTWDeWW
 CMWjgWe8uHjVU2Izb/3FlELCF5nSUklaui99CPWyj0g8bZtDmEjPdhg3VJanW/lGADLZMTU0/u2
 XeebFLeb018YPjhc8rZ0jS77o
X-Received: by 2002:a05:6830:4902:b0:72b:8e84:3150 with SMTP id
 46e09a7af769-734f6b855d4mr20241956a34.24.1747940633141; 
 Thu, 22 May 2025 12:03:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/jT6jn1Z060H1BWgbFPP/zII0OmBF9bsCViyPeLmWLw3ZixHCeAogA41QGyYKJQBsWAf6tg==
X-Received: by 2002:a05:6808:4445:b0:3f9:f923:cc46 with SMTP id
 5614622812f47-404d8698a37mr17537811b6e.9.1747940621967; 
 Thu, 22 May 2025 12:03:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:03:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:24 +0300
Subject: [PATCH v5 05/30] drm/msm/dpu: inline _setup_dspp_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-5-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FhcUxkN33lcwKaCVhynJTwrCtUJjENXomVxBonQ7s00=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T8SI8KCVGVVr1Y9EWMFHMO9KEgvuRRKVX0J
 x20oP/lOPiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/AAKCRCLPIo+Aiko
 1fXWB/9Fo45s651Gj1TyeLBW5+ITB5kjKlbCn9FNuFukuVufMW+UMpWeTehBYxmQlc+7z6FC7wf
 YlI97N7+IcRbAfH96cIN8hTe5YTgkS+9oqT90LjP2M0ppBYZsHGvquHUkmFnhIH/EHSZ86Gz8z5
 R7Hcqh++KiHzQsWOizm4qPLOEO0PHhrPk0atiF8vC/xvKj9+MDzNMfk2JMOuCXOjGIKQypVKmJy
 QzC2NY9Dh7MF7ZufSrqpf0bhiB7rxFbrZveBnE7dz6KEnmo1CY5RfvCVY4/ngoJ31kcauX7w8a3
 QvWCjw3jl87N7QTx+4yp1nA8qu8Q3UXN8qo9uy3rFymXOuNj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX1+AFDftQuMdN
 qA08KsRL23zaZwXvegS3+QBMJQvkOJxGq8Oj1nNKkmx+3Tb1kmw1CRfOFbSdnQajl1WQgCDMr4H
 1ph25iESi7x9jNWPd0mrGkQrsDQMwXVcAx+7amP25jL8avpYs5aE+fGMQKjyNJ3oz1lhHAzYESx
 hhXV5/071/8T9HMXMEKbNe4cqpCyP8DwgE2gbjh2lVg/KrOz5PNy8XIGZbvw6SgwolTYugFNMYO
 5aup170fsrihaM21R2Ls4jkkwwmxCe814FpVXtuCsTeY1k/qE4ctJJ5SoI9fTIT6fsNpTYR0odU
 Ifa34wEmhX4qWY1PnI+TUvIZ8659zquCOslByK26EYNgz9c6OEvf+K5y+voA0fT/ZIWq01mVPhn
 a64p8tJZacBpeV0rTpRVRz3iTBV7p+OVlysAhf9b3yDZzjfvN7bMdbAva16AQsnVs3dkNRMC
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f751b cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ezFYmCdhRMHQQexkQpIA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: D9viHiqU6vXeXSR3sVan_hDYfXSCHTw2
X-Proofpoint-GUID: D9viHiqU6vXeXSR3sVan_hDYfXSCHTw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220191
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

