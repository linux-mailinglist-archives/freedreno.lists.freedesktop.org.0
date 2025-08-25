Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA229B34346
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C717410E4CA;
	Mon, 25 Aug 2025 14:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1N9EP1g";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C771D10E4CA
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:24 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8DrvL019419
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tEPgIOih29SfXqUD6GD70/nkYYFDZqCIEVkDEY8y1R0=; b=k1N9EP1gt6iwPhNj
 25fvbPhO9rivKyVGtAra6vy9gwHtbBkActx3a0D4O6d+hNOgAnj52cOlZni8hEUw
 bL9sw463f9EDG4M01mrQrtmibag5QBhjgapmaWP9DZsRTo8xsW6A5OyH16TcrFa0
 iDJX6Rw8Pv2fTB2dGDF/YouV+wThiWCfxEuzmz1iGGpHJO/VE40HP3WJgHQ7c7Ns
 Thg5jDC3Ua1Tz4p6MhThbPblAAV0bnHYfN5ZxOoluoym7iICVZ3yBntaajUUZr68
 S5EPEkfqcKWlfZLPz5PwivFu6zuD+L2ZQwDc1brEnDcRfPwkpqOqn5pwX6gD08R0
 CUsZJQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x85bhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e1ff27cfaso5089784b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131563; x=1756736363;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tEPgIOih29SfXqUD6GD70/nkYYFDZqCIEVkDEY8y1R0=;
 b=DcqmjgdSeAm4gk/hyjIumxvrjlv1m/MR0mpWLER1I7FtNleemelwsg3jEzC6BI5TE2
 SN1UrA4ydTh9oT1d5E0jB63jfKtRf7D9nRyxkRERmMvv1N7qB6JJxungtrkhdPSsB4SB
 3/feDnftvZWYKzyUBOrqGj3mtp+hGR5lD5udZf9z/FXSJIMZ/Xp2NOKHehymOMhPCLgI
 GSJNvM2qWc61gztLVDSa9MYcSKKiQfcm//698OAtbaTYEy0++XyP/VdqYyMNMsmkTNOo
 OHy224TmhJQmqmopzdtFIz8B0xv0QzmjTFOIORGjKaY348THHbxsK+Ctp8htJgaNECl1
 PoPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVTLJ/RPy2nsPRlJVGaeQtxNU94ZaeWpCxB0sEeBRtM2cfIviRaxRzgm3R/BBfmkMCVocKEHBtlZk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUfmOQIhbUjkuN82O5d592quD7Ikwb+KhVlmPbkJa7bSVMj0Fb
 9JPcyqb/zWvE1dqnebOmT+QQcYx7PN7cxAUu8DvrCACc1NXGSTF45+mAPqCHP+wwvmti0aLLMLg
 npC2EH891hd/cPdN2rBEhJkpHnEzNH41uv4tD6bofDIQnYjS82BUknT/aDrbMVpGMJyeMpSU=
X-Gm-Gg: ASbGncvZipF9efPVJtBEmpZ6o08+q24+JYn1wX7gpsmR73G3xkearWKHjH61ZZhSyxL
 H7OA06KMeYwJ0PeEXJYNoXd6Z+ZC/9S4I19IHYmesLnkAvrQaSiG3f5uUQqNHMQij8sq286Ahub
 BHLA3y3Iwy9Ldjg7y3hqFTID2Vl6g91/dvj/xlHH+e1Q83tqMFgyLCCMXmogesl+nfbazGDwvKh
 uRgfdDFCgLXXADYdlwmKcHnABn+3ywRBFSe+E3h0e37ozJea+4J774kCqeQN0cSq7P2zLo3gmQV
 QBDBv3hOYpcF8F8l6OBEUVIuKdcfhLj7mPOq2jUoZNnVEZwwdDPa7C5VxklXv6T7wF+m3A4=
X-Received: by 2002:a05:6a20:12c7:b0:238:351a:f960 with SMTP id
 adf61e73a8af0-24340ddef22mr16065129637.23.1756131563315; 
 Mon, 25 Aug 2025 07:19:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn/UQFw+QFZO7ZeEzYcaO43UKCC3B5zX/4Z//+93qCW2qAoRaZpQx7NZQp/wR6yGUsZE9cyg==
X-Received: by 2002:a05:6a20:12c7:b0:238:351a:f960 with SMTP id
 adf61e73a8af0-24340ddef22mr16065092637.23.1756131562810; 
 Mon, 25 Aug 2025 07:19:22 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:22 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:18 +0800
Subject: [PATCH v3 32/38] drm/msm/dp: propagate MST state changes to dp mst
 module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-32-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131424; l=3583;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=Lq0MtIPay+yjPJuGDAZ+6ZARtIebH7XslPSHc3Frkes=;
 b=6Rua6mrAFQFC4aqDHArUc8KL8d279NHxrdV8BPhkF8hRjzpFRngjpVLc2ONfWrtvF6Q9IgQpA
 +8cCNDXjaOABXaZBjw+L/8BDqhSGiAHRnq+vFgUd/2FqpbbrCAcLxCN
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: MkYjf11inyJdz1s7jEVsYAEagxxou1kB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfXz9cz3gNcghrq
 ETXEbWY5AIOET42f8rHVV1/Vvs4HTDegjRQGEWtbINCbFljnnWf2/az8vkrGmskZQZlmO/+tL1c
 iRZz4721dV9Vp0JEvjkqXtSa4EJMdLUt2QnGXJhXzsrbYG6k7buKKgVuxxFB6PwneS0YLv3i+7+
 3neNtkPEMkCgFwcvH1Fye8iArBNbIe7ByMnmwiV9k1fUzmByJMJCyaXY7CoqenZJif7XcfgUvHP
 5kHIjPB6Cn6YB4VZh1HkgJYT5kxVZ6lKHZTemur+2De5xc7wuFX6zMJ2W+TfCQscatznrN80rmi
 K+GRqHGjJyWTL1kfjjHbMOzrvdniRWtl+op5KyHRdm8BPkBH9p25Q1kqQV1vCuMhXxpqH7xwp8a
 2emSIG7L
X-Proofpoint-GUID: MkYjf11inyJdz1s7jEVsYAEagxxou1kB
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ac70ec cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=XT7MnVG-IMvVsVpEgAUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

Introduce APIs to update the MST state change to MST framework when
device is plugged/unplugged.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8..909c84a5c97f56138d0d62c5d856d2fd18d36b8c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -28,6 +28,7 @@
 #include "dp_drm.h"
 #include "dp_audio.h"
 #include "dp_debug.h"
+#include "dp_mst_drm.h"
 
 static bool psr_enabled = false;
 module_param(psr_enabled, bool, 0);
@@ -269,7 +270,6 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 		dp->panel->video_test = false;
 	}
 
-
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
 
@@ -386,6 +386,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
+	if (dp->msm_dp_display.mst_active)
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
+
 	if (!dp->msm_dp_display.internal_hpd)
 		msm_dp_display_send_hpd_notification(dp, true);
 
@@ -608,6 +611,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	if (!dp->msm_dp_display.internal_hpd)
 		msm_dp_display_send_hpd_notification(dp, false);
 
+	if (dp->msm_dp_display.mst_active) {
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
+		dp->msm_dp_display.mst_active = false;
+	}
+
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 331d08854049d9c74d49aa231f3507539986099e..ca654b1963467c8220dd7ee073f25216455d0490 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -924,6 +924,21 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 	return connector;
 }
 
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
+{
+	int rc;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+
+	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
+	if (rc < 0) {
+		DRM_ERROR("failed to set topology mgr state to %d. rc %d\n",
+			  state, rc);
+	}
+
+	drm_dbg_dp(dp_display->drm_dev, "dp_mst_display_set_mgr_state state:%d\n", state);
+	return rc;
+}
+
 static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
 	.add_connector = msm_dp_mst_add_connector,
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 5e1b4db8aea4506b0e1cc1cc68980dd617d3f72a..8fe6cbbe741da4abb232256b3a15ba6b16ca4f3e 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -87,5 +87,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 
 void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.34.1

