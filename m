Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FBFB34324
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5A910E4BF;
	Mon, 25 Aug 2025 14:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fvYDCdH6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720F510E4BF
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:30 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Y8DM007851
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uJhqvqQDB3HVRz6gPABXZ4Z20PbjJ0Q4eZGeWqXXZ84=; b=fvYDCdH689Qc92QY
 XDgTTOW7ucZm+OLAYHd8f8/cxjUySobH98y8j9U+XUQtNeua1Z0CyEzuP/YkwE1o
 nSMAggzfsh6RjBsNf1DYg69EJbGDaruInTTPylL7FnJ1l/MyTtTOucUJrSuFcBCE
 6DVYZ11sWKuJune9ss157KL24+SZ2rDxdsXUkE75GM/0TBG2xcCGSma2cPoXip8O
 MBd765ieEazK7RYPDJfxLXFiEdKw4l8wP6T0qJ45ma4Okjp36z0aWDUMcqEYf6pH
 YNWWM9uZBkJ9Zpty8laI4/fGpLJa9ElFZBE7gHb0YqyHJH4NVFt5zsH5l8CPEbcJ
 bgiY4g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpneqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e6e71f7c6so4623413b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131509; x=1756736309;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uJhqvqQDB3HVRz6gPABXZ4Z20PbjJ0Q4eZGeWqXXZ84=;
 b=iODcffLoz8/8ndRmAkK/ffZ+1LcrdvcqK9aLOD/QFl9MdnwzgsZIqfrFvLSx94yNHM
 5ho5t/ASc6qmCB+ZvkUWhL+y+xV4a8Z2FyTN2rJZzFOs/jj7ZtSzFoXfEOebuuOEh9Mo
 TYEY+iIqgPMB8HsOXWsG+fD+JTjnBSIvKiy3zOGXSdcEtk1IQpnfFYNdLMh9lrfsUa54
 Wy7ZaVoN3t6ySXvEXEDlvPGlrieahEAccyP3Kg8IxlCjnt7ruWOc4SQYfwy2A2MLCUiI
 dp9baMilMTQA/4pl0WIASQbaUhLajIMkQqutzViHCQNHgxvOfYOKzBzXkRW9lmMm8vf0
 8z/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ7W0i/iYR4ICbjte3uJrmQ1sQunamUX4ER9V0FGP35rrziKh08SQRG6xjxuoP12Kq5OEfWu841P0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKOvOAFZa4kyLjDwueQk8vrHVaf4yIZclT6tcsAacgBljBCdG6
 3jICEaf6D5IPr2ZE6m77+gBN+8+QBEfBR+IhltluOJAJQMo9DzYfCexeVFPgNoSPYce/jlNnzcD
 o/jCU+35w/91/3bUgg6t3cFApBn1GYxI/2DudEBeq1gEdi35gc15baj4a9wzk0vKV9q+1h4k=
X-Gm-Gg: ASbGncuG0IxNZaRuQum5vbfFpz7KaY9XmFwgOebYICEIvGj9bmgrvImT0kvEr4bhYP4
 gyXuvoxeUHlb2YU8G3IYfCYMJX25FDaOInp00lDXCyPjilUozoRWxa43V9RnZk32ytz5YoNXVt3
 BypRGqUWlCVRqLhjVGWHSAxeYJeogvjkIU91QN+15qnE5ko1I/opFmbL7oH58vquCV9NUocQxzF
 QF2XFXm91/JnuYhfm2NWwlvSJ8UELa1sl8mv7la3IUHjYHRp1JKqAR9oI8d9pwIMaIp/qcl1PDn
 NeL55ebikE5p6974DzQMwqjCANXOrA9nU15WGsMb/ssxOn0js/r2BgkVUrHFmpi5PPdxZow=
X-Received: by 2002:a05:6a00:99d:b0:771:58e:5b10 with SMTP id
 d2e1a72fcca58-771058e5ff3mr5451521b3a.8.1756131508934; 
 Mon, 25 Aug 2025 07:18:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFNAi2rKuvat9119atkAeteEXRTs4Acy3AzEJ3ZC9cZKTCP+PnnhPW5x3T71qafgNzNby4LQ==
X-Received: by 2002:a05:6a00:99d:b0:771:58e:5b10 with SMTP id
 d2e1a72fcca58-771058e5ff3mr5451471b3a.8.1756131508321; 
 Mon, 25 Aug 2025 07:18:28 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:28 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:05 +0800
Subject: [PATCH v3 19/38] drm/msm/dp: no need to update tu calculation for mst
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-19-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131421; l=1000;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=k1m4e3VK8u1xpO29Y3ltxjmABJorHzY7vguJ8hjD3qQ=;
 b=VkBvuFrfB1Ql4nqRlzbxrdOEfh+A3k5m2zJ0uZQo+MCP9ZGY9kVnH5NQQ8GIU33xIhfE9xTnD
 t6SQXjThQ+0Cc5q6e25GBxtl56Isg88ZTWiukWaloHZXTwSQmZ40lsh
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac70b6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nb1SeSCrlpLBeGjklAIA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wtKjIShQbetu_SojvhUk1sqxzok9QA50
X-Proofpoint-ORIG-GUID: wtKjIShQbetu_SojvhUk1sqxzok9QA50
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX4P2O57Py6HVo
 paTrYGsfJTOM1j7YBNMdwh8r4YuUO3DjL5a87vYme5NezvCsWRXHNASyETUoN+emZnw4gOw9cxD
 btXkTAT2p9yt4AZW/YFpOSwfhUYfJidRNPLOl/nzNqqxca1v3eIv8RWuQtjnOQdcm9Xq6D3Q/55
 une18Xr/0hlFHNbqPZYvJNhlq5IIM5gpcAS7+uRYJ2Si/tmNCVKq6wSPgPjje5tBWgjckM8K8Xs
 MWMMJUQZeH/eLhMUdqz6/gEvhUwMkOK8gkmXdC3+f6PGqHHJkO2zmBmx4H5RslJfv3TtkCAJ5gL
 slD+9fbEof71TPZhmE+KzbK9DX9VW+VIB5nnQnFL6FhZRQFB+bpvb14CmImdMm6X0E2TylphbAo
 yCgL3u/f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP stream is transmitted in transfer units only for SST
case there is no need to calculate and program TU parameters
for MST case. Skip the TU programming for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d562377a8d2846099bf0f8757128978a162745c3..c313a3b4853a1571c43a9f3c9e981fbc22d51d55 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2685,7 +2685,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_panel_clear_dsc_dto(msm_dp_panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl);
+	if (!ctrl->mst_active)
+		msm_dp_ctrl_setup_tr_unit(ctrl);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.34.1

