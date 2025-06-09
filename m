Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BB3AD2581
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 20:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0299510E42F;
	Mon,  9 Jun 2025 18:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7hFueSs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845F310E3E3
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 18:24:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55995dQv012128
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 18:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=F2gwz9xWCvt
 M03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=; b=i7hFueSs0hspbXU3m8LSLRGfgQ0
 oCWVIaU/SC8Q6wuVbDWHMy0gWZRDhhhCCen+GqFlbdNB1mM3sJQfi32BAxXb1Rp3
 5VIEtZaZeAharmseIr4Ofyb35rbK5JOjBZ0pI83Cqmsa1MtB16pftHmfbKhTYIgU
 A2mZh7YGzblRncTclgfEJik6uRxl3DVxLWB0a8IysK5uQbBuLikw6YyltzvJkb5S
 Lj83IgWXqoaxCIWhut8wmtvwNIb123aQm08VvrgDgYTquXGUvSvxlDSceY5LIPXz
 vJZE7JhMCgNYwaSaMMritFN/m0ypOiGA8x64mME0N6jVKdBjOCo9djK7OiQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv6tf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 18:24:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-742cf6f6a10so6270357b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749493484; x=1750098284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2gwz9xWCvtM03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=;
 b=ho33x84oJJIzacLPgMyacfnWnwLVyiU5jqQxsoX3axX9521sw75Z/sJmJfdyi+oMr7
 vhVL+dkPuLjnJy9roSurbzlD0pFoM+nO0JqQcINuHxkkXctxgfmwp51AZyLO1x0bEznx
 bOCvKD6S2I7id+U2qIXl4W8cAt+eCPRaCfvxyYJilhuDFNqShH1UP/7GDRalzckdIMQs
 zdsXju3Pm8rxL+gjHv4o2ohnBvpTdvd2WtbXsMwtvIgWWX4QcsuYF710Nb2mltg+OkAu
 utQUrWifbbZPtyx84lAzRBPdHYBJb9KeB/2aPwDNcofgNsYJnZKRr/75FNxkyUEXCtN4
 y/pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVXL0sB52Xz85nIF86JDC74kDKr09LXNJdA/5iz4izMarMy5WLK5m9agwNbOlF5DVCs2ZB4UwDrsE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN10WRS8CmjGA0Jk/wP1MQ18Wpj6EAccHDtswweUu9/N+8MVF5
 hm2TMUI1kz6F1h0tNdZfuszWeBYRVKKI6qW0G+0gI5Nh6V53JEGLnM7mFzaIdrnXRoSFdCdS2b9
 5xm3zECD74YLFuLcdom3aRzePWpU5/OfIruZeFCIb1peMxRNjVWimmjjyHybJfcD/6YvfJNk=
X-Gm-Gg: ASbGncu1Y5yQCbA0FGJq1mQ5BQZpFC58k1eO9IZb7SRV/QmTq8OK1nY7r//vz3dCkWF
 4Gv1E2qqoyJNMPPNWGM92crE3QnMTy5Fs6+LWSvq0tro7SHkXJqV1aeghMI2zev4Q3GykQutoSq
 6fNniLeuvY46gW3jfwPyAZTTo7mlH0+otUcIvTLF3luA7voTKa7ku32+NUeSo57DRRLu9SGxhPZ
 h2iBmzDnX8UcxO+fifVOEvYJIEbnOkUGOb1UAyZ+zvwjJduA2GJlZx+6sJgoqvW/Mih2cXMspox
 7K7pJ7xXjzUu3wXB7fOU0KahBJUB6Owj
X-Received: by 2002:a05:6a00:993:b0:746:2ae9:fc3d with SMTP id
 d2e1a72fcca58-74827f330a7mr17505744b3a.23.1749493484090; 
 Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE4XO4k7jfNXjeUp4cke4cx2uvEFDbj4Fl9AWPgXX5AvA95l91RUCPxIh1kKECvcbV1YQhTQ==
X-Received: by 2002:a05:6a00:993:b0:746:2ae9:fc3d with SMTP id
 d2e1a72fcca58-74827f330a7mr17505710b3a.23.1749493483727; 
 Mon, 09 Jun 2025 11:24:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af7a216sm5945104b3a.40.2025.06.09.11.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 11:24:43 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] drm/msm: Rename add_components_mdp()
Date: Mon,  9 Jun 2025 11:24:35 -0700
Message-ID: <20250609182439.28432-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KZTtPnLZkP1XsCbuVRehZKR0WRWQGRGw
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684726ed cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=vt6ngUXDG6_mDpkR7fcA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: KZTtPnLZkP1XsCbuVRehZKR0WRWQGRGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0MCBTYWx0ZWRfX9Fsd3YCrdBJk
 c4YnyFTZp4nY8iWET9WTtR3d+VmjgXz45DvthnCSD/NqqxkeGAA86/hl129Bqrn4R2jIMFqsAcc
 QncFGJC7oIMpv7fBm4F/J3sZsZ3afZom7mXgq02f4xReEGZWpVM2SBjqD76DkmZ6UjzeSE3EZXH
 AIir/W3oGPXxkFqFZtNfpSU74ZWlykia6vqQQmZfBZR5B/UaDiQ2HFav5kBoa2SPgt6jJkzzNcm
 /bcWIEIPlLy95SpP08xMoPt1QzE/g3au8GpMHLpLvdS1QoXMI3JVwx9pQVTVjRD4c5xS36jYvO/
 OwqNHRHDM1ANGQymHJCgMeoQuLUGpj8Id1PdIhTaBz0hCqXBeBMplWXADQuI1gRVDf7cywp3PbQ
 fX5PFwZMGMFy91U0NB68hD4s1tBaUSCX1GL4ljvdtrelVkmNqImcDLexRtW36rOTqM/e1D73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090140
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

To better match add_gpu_components().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 710046906229..87ee9839ca4a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -852,7 +852,7 @@ static const struct drm_driver msm_driver = {
  * is no external component that we need to add since LVDS is within MDP4
  * itself.
  */
-static int add_components_mdp(struct device *master_dev,
+static int add_mdp_components(struct device *master_dev,
 			      struct component_match **matchptr)
 {
 	struct device_node *np = master_dev->of_node;
@@ -997,7 +997,7 @@ int msm_drv_probe(struct device *master_dev,
 
 	/* Add mdp components if we have KMS. */
 	if (kms_init) {
-		ret = add_components_mdp(master_dev, &match);
+		ret = add_mdp_components(master_dev, &match);
 		if (ret)
 			return ret;
 	}
-- 
2.49.0

