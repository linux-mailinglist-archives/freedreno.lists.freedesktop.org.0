Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B054DB34323
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8914510E4B0;
	Mon, 25 Aug 2025 14:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCwYx+Mf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED2210E4B0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P895xf031245
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kuhCuvceT3eBUZZRoUj1Cw3I8qp6BdzHVaKzZZmWw2k=; b=BCwYx+MfjzN5j5XD
 UIx9+Rt8excXpF9pD7VrdHI5rvk5QXkgTN5XDRxlOgC9KBcIJewNtb3ewhjomSJX
 qGI0cTUEVBCfMElG4onIMoUEceD8jlbs1KiXDNqIjrobxy6jl6GoSjcw/OuhVUCT
 rxf8KrC0eRJHeU6VWsx+StfTFjQaDrnL2968NbMHA8ZICEf35KH5ZzS+cUltWLlb
 /ZR1uwVTX/hbQm2/i6GuqaWnkfyX/Gge57+y2FbTNtqkFM6OunU6TV9uSEF6hW4b
 X5LUG3KEwOUiRx9pODqlKNzP9tlHP3qvco3NYEAHFR/mY2QQj6G/BjdXj7CURFV4
 1dv6Gw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2nfch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e2eb6d2baso8844009b3a.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131505; x=1756736305;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kuhCuvceT3eBUZZRoUj1Cw3I8qp6BdzHVaKzZZmWw2k=;
 b=vtLQ6YzozHidO+EVqVjKS1buc3kgGe4xkaa7Ie6Io3zHY7K8tPG1s6IDUHFr0cQgGt
 3g7f6Do07546IzK3IUN4GPtN8RfYsA6GsHyv1XP72E1FQs4IhOLJAjLdBfwi54T78iHU
 gG0LEUklbF2WFZ3P8V0CqHBXLHC/GEyQtf1hMLKPvFu8ftOLHaP1Ga/QZhjbP++Kauu9
 Gjqg84PZbE6RKil6GkXnwwK/z1uJ3XOUDtArWCckCrxVmo4n5RX2frG20Um5l7aL0iEy
 JLJnyqL1NZHwk5TYGTgmYOD5kZVj50OSJb0k0T0xPua8uKJHtulsF/mn04YkrvrHMUAu
 PUxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+ysOQd90BuLnfSx5JAAZwWFPCTo24jF0XmpdSRLC/oy+uiVXHuxAPrTsHCNmMtARNsp6ijXMNtHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLHSNn7VHklrM1fz9X55Xvn1AcTeac7OBr/jg68BVedXwDeGt+
 tL7UwUBdh5E3KDY/84o7d+BvUIjmG3xcf3T+8J52KWmZ9ficSAkCE+A6HwnkQ0Ap7fEpEDFhbY9
 m2Vj9+Xk9eRVo+O0PA27iJ/fJubo9YC96v4oCyoiQvHww9ycxKYSo6EVYcrCZSPkhXmio9k4=
X-Gm-Gg: ASbGnctVB8//sP5w0Oxqyh8Zdgq1de89EnCI+l2yLcmM5yeHO8M4ohHybbTkm1xYsFu
 MlUvyrz7m8/hk162WDHpP43z66OgPu56jCdledzjPaVe84IlC8CjHLciKaddZcdwEtb5msPIuHb
 roUqFxnwA5JPc85WplAU6c3a9Qso1+Ajg5y9RC6qWKtHc3oJApbVnancYilVz9rzdefEg1mz0iT
 cFoI18DPwGGS4vqqblUfaA9XsoBwQPi70D2oFgOWBzVyeaMUyX1DaacLaG935ZZ9shqRMAtQLMb
 uQaNmQbgt+Hga/b1jJxLt9coOqpnwvg1w0cLyqM6LIDSIrHYTmIzv3VBCDFsMIzJBii1S1g=
X-Received: by 2002:a05:6a00:4601:b0:749:b41:2976 with SMTP id
 d2e1a72fcca58-7702fa09144mr15469472b3a.3.1756131504697; 
 Mon, 25 Aug 2025 07:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuyDMxEaj9hDf69kGJI/QXSxzc8wFRyqVUbHdT3W2rALNv1ZU3Zrh52CK35M7QFmouPkuDEg==
X-Received: by 2002:a05:6a00:4601:b0:749:b41:2976 with SMTP id
 d2e1a72fcca58-7702fa09144mr15469449b3a.3.1756131504198; 
 Mon, 25 Aug 2025 07:18:24 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:23 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:04 +0800
Subject: [PATCH v3 18/38] drm/msm/dp: Add support to enable MST in mainlink
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-18-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131421; l=2479;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=UgwUqVKQaiarblhKv5Vuldkk6W6tuFzzpm5QCSz9nNY=;
 b=8DFs8ZRIVpVv1RtAu9MVTMPn/Da8N8A3WndZ6AS5sI3ksGWJ6VP1jcWx8ja0GYtxcomfrqCUh
 tE3btu75o5UCx9G2f58LThPebkL58kLIDlLOrpqeb031npkDVpEMGiH
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ac70b1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=GJT6Fafo9oTAj6z5dyEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX36s/iOvbqfCZ
 TLpAoAl8sCjeBzT5QZKKCrqiYQBUblKvLSphUqq3d65rcYXT1ImKqEi5dSezX9HBrFsrTaRXYyF
 sOvLB6LZ4bW9Uvxu1oNuSpH3K7ntY3Qg8FfncMGmeykqk5JwAYjh2cZLLJ4blbiQPqhjU/rWQZk
 qxx8eVluW3U32MITRDnsq5MJvSCoZs0gGYQQ564BF9UWsUj4Caksxga66zBzG9H63vcnYFO/BRB
 WSOEf90ixakaT+J4G8ZVQSJdxfb230IUpgSSJ+rUteqVMJksVlANV4BSV0NF5iwB6nonE9TEc7+
 CfrRqwsy/kdYDWXqmQxhDT3F6HgMZf4lbYWzRFRG68nxppE7BwyKgZ8qQaH0vEGZR3bR+nJLjn8
 48a/QbUz
X-Proofpoint-GUID: -BOZbcfOLIkogmUaL6yOgfhhq4e6xmq0
X-Proofpoint-ORIG-GUID: -BOZbcfOLIkogmUaL6yOgfhhq4e6xmq0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
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

Add support to program the MST enable bit in the mainlink control
register when an MST session is active or being disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h  |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 16e5ed58e791971d5dca3077cbb77bfcc186505a..d562377a8d2846099bf0f8757128978a162745c3 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -254,6 +254,19 @@ void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
 	return;
 }
 
+static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable)
+{
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
+	if (enable)
+		mainlink_ctrl |= DP_MAINLINK_CTRL_MST_EN;
+	else
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_MST_EN;
+
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2656,6 +2669,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
 
+	if (ctrl->mst_active)
+		msm_dp_ctrl_mst_config(ctrl, true);
+
 	if (msm_dp_panel->stream_id == DP_STREAM_0)
 		msm_dp_ctrl_config_ctrl_link(ctrl);
 
@@ -2711,6 +2727,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy = ctrl->phy;
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
+	msm_dp_ctrl_mst_config(ctrl, false);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index de3d0b8b52c269fd7575edf3f4096a4284ad0b8d..fda847b33f8d0d6ec4d2589586b5a3d6c9b1ccf3 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -128,6 +128,7 @@
 #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
 #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+#define DP_MAINLINK_CTRL_MST_EN			(0x04000100)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)

-- 
2.34.1

