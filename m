Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023A7A9A7CE
	for <lists+freedreno@lfdr.de>; Thu, 24 Apr 2025 11:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CEE10E799;
	Thu, 24 Apr 2025 09:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdOFmMR2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBDB10E792
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7RH003417
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3h8IwCQygULBCYKUzhqZAZ0C4RUrKlRlSMDkS+Z3mD8=; b=GdOFmMR2dRM+TZyp
 glkhuB9JnKoiX4WZbUocXi127fgxsHI9BBa5LCyygPe6fkHgmIrJGdyUTS/it/iA
 ZNw8SBjDeFpKynHrkfdO+GaGro2wPZK3PsGdgf1HnncWKb2txEc+cb5AZwqf8Ep6
 qSDbxnuJQjcdulgUb0YYtpBbmJsmx8BfZThJTNRFV3srR+4nKmNgjQjvEQBouBWY
 5ukDgk3pNeWNvwzyVK35E6eP5Zg8ARcxP9AlURCpnEcjg0cJNOwYK/km4jQjujPe
 uiadU50Ba/fDt/zWqdV5fQ2MntkI6NWvtNc3NU70BK7alx3h3t1pCExX+urdSAIM
 J4nDsA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0my7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e8ffb630ffso13422756d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 02:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487034; x=1746091834;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3h8IwCQygULBCYKUzhqZAZ0C4RUrKlRlSMDkS+Z3mD8=;
 b=BTzeT1OFzt7NOfb4vIa8hPvfDXgav7ZZ9iH63pO8fkysZj9W0j+Wc0U1D9WMLfsMwm
 53Wt1nvq1scUC+RYJVvcsmbfoiKALIurt9n0gH06THhOZPv9Ba0PdLGyP8d7K6IhdL41
 kj/ZLEbgM1oG4+37eiey2E/CmiyL8/2ajJoh9Z5IaiKlcfPxAX7AD0bfkAMKLy9yEepr
 4OEzUJpvuf5ivx+q+H0SEdtuz4R1UHPNjZerV31tcEgEQ3NRebQEnaYcYuqCk/WdS98m
 Sn13PxmgKKGYHJDr/QVxjY90/KZU54gZ+kQ+XMibHaxKmGFBVehKo3Z8U8ZnBjeZlODV
 b/EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjQ6c5MgdbphNEJW/qCrzxN0DhMv1dwkAiGM41LydaVTcdZwQVmbE8/lzrI1wLJb6ISZ/Tezmn8tQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB77WvZwGzZ0cQHkhNLXwdzHXSgE9pnSMMAjHBoa72k5wgk9/3
 SxIBE59IDlqL+oqSCimx5V5dVtJrU7xDhIIh01PxO/o7LjNgToPHPH+52hzxlra9mF6w+Q2lH2V
 xxLVnk2b1xRMKmgG3ccZyA5CTVN3JMCmhv8ZssjZmieTyJFA423S8uALk5QVcft1wjDw=
X-Gm-Gg: ASbGncsL/TG2OaQCXzT9VNZvdjIytKnB2zYlYURVgrxLRY1Pr0YsWtTu9IqDw8nOHkT
 vU5n/pFm3cSYdYOy/8Z33iI4FzIysEGbE5ttB31HYPHlB8ZJsXETfUNmaRWKefh+9tbdmJJBH3f
 Nw8SrAuG2n13Q6WIv3boZk4nCRBTXSOwH5JPHstjfGQ5KKDxSPVbknf29WReb+NDy49HpKg++eJ
 NNfL6goFn/0ImgUOAjk37A60WrGujRFHaMvaTvBjw3ZzMUOfPbIpUZx7CTEgsBJoMdbGa7Q0bF8
 Ie0SPde46zmikpOPRnaf1idN/yMJo8OtNZoXJkOSTXrrxF4YTNTVdCRw4AR00X5lCA2NIlQy/tY
 cZI0ZiM1Idg/QonSldVVPad06
X-Received: by 2002:a05:6214:190:b0:6f4:c2e5:9dc5 with SMTP id
 6a1803df08f44-6f4c2e59fc6mr12092046d6.44.1745487034052; 
 Thu, 24 Apr 2025 02:30:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYiPdy8b33rsIWhjyFiQzIakpdZn+3nbe9+UAF3x7yXZ+JZYFOs7kqMnbbBxaZc8zFD/lqsw==
X-Received: by 2002:a05:6214:190:b0:6f4:c2e5:9dc5 with SMTP id
 6a1803df08f44-6f4c2e59fc6mr12091676d6.44.1745487033547; 
 Thu, 24 Apr 2025 02:30:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:30:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:09 +0300
Subject: [PATCH v3 05/33] drm/msm/dpu: inline _setup_dspp_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-5-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TzajbLeXFeWcm21J+7IjoKJq84HYxMWKTI0BXOLnjkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSqIqH1D8iy9QmolQ3g4lkccg43SLzxBrGRz
 ZKYMKQ4OPuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqgAKCRCLPIo+Aiko
 1YI/B/wOv26Yb4VFOEtRUKCRC69FKjk/WGSbZOZIhHasZ47DuPlZbmNbEoWj3roPkKbSqrb3uPH
 NOpCq5/ldcFkEgylrt5/V0ZjR6bLB5HuzX4wXuxWTnURrHP19zd/ELzooZaInwfVPG+Hc1/idn6
 ol84xTej46Af/zW3INNdYLJ0JIEA21ZN29TOb4JxBvFdTzKRT+kv4c25lx7IH+1jDHtKQWVBygH
 bWDJyKfZi+ZEEuwdwcOc1lDE8NVWmm+krlQISZ/DhLGX1zlkx3QqzIDxdLkYkyjT8XwibwAM2u8
 mYX4gdn+arbBz8u+PniC13dEB1hynNsB04Yzth2WfFOPhsIA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: YsRc38EMFewDcKMIWECaYecfts0-3M7v
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680a04c7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=ezFYmCdhRMHQQexkQpIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YsRc38EMFewDcKMIWECaYecfts0-3M7v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX0Tx+CSwE0p1v
 vDuB7pRtRiDh4QzLyMFaQvPdLgRiY+yf+f9EiAlsMMZn5I8Po5tL12Be8HbgaDDuRhxuJLRNY4X
 ojod0a8ddncYvsIDz2vsJ/DF/y5B/dKbMnN9vaY0fIcR8IK5oh1KruzIO+OZ38g2POC20GduHzg
 IXCAtJGDWaboulAI/5HxNicb/Of+nxHnmEshOfAaEv9Ck93KzNzDShSGs0/EHnIOSs5VEtk7xYE
 Tl82IrybBoFwetNHw4piq7Bc5H9fRF5j3cKNz0EwzqgEXe9/wmtg9AxVbUpd2bMBiOijXMtm1nE
 PGhbqS5J8a4M9UcszXILDeFCgKf3jxJw3xVj4Bnk9vGAKhe2oBfMtS/9OOSq6czcLwR78VvLwA4
 0HYqKIN4mu8dd3jjuXAmwFqN7Ie8Xwzot2hCAzwOKqACre6VeXTAPIG8NXfk1gVftF7svQ45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
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

