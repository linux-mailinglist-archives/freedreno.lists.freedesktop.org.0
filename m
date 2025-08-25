Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2258EB34337
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDAF510E4D0;
	Mon, 25 Aug 2025 14:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLfLV2Q7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0E710E4CC
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:59 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8QZiV001408
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d4em/xcDonNf4m1zVAyxC0QlLlKFxyiAEUK6Ca1lpXA=; b=hLfLV2Q7e/tX9PDH
 8tY9n7qGH4XqYK9E8CLSsndvGf9zENYtnZzQY/sH8GrYKCo1RN0M0r7PKNvOj6iq
 lQED+8goMLEL9awCENLCbdqJRXyjOkHAu3yk202ibX9y4GrqEBc9vZykHlS3lTbO
 xIxlqL6tqynqZZCQzGjkLmp0ILEhw+JdRVtfIIUydoB7PDIYzwN4MRruIJqMsTIr
 /lx+1wX/d6sTa4nKAfv8pcyneW59p6uIfbvnchgDUKDX0XYUGGP4WjCVnuETVuRD
 16YQAvL5jfxIrjVnF1owZvm2Ro1WVTJ+xNgHtuXcJdb+rLqXMqKFW/qMy7VF/6dm
 m6rwKg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um5eh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-770562b1ed3so2548961b3a.2
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131538; x=1756736338;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d4em/xcDonNf4m1zVAyxC0QlLlKFxyiAEUK6Ca1lpXA=;
 b=B/VUMSZ/bv3Iumo6uUIcV5Llz+2VUglJ0TTLSwIjKKko07irdLpoNwRxtgiuRbKOOP
 2TSOOj+IDNa2DzqTunMgr/mPYWyy5wubhSYJVkFSKiymMIABAjJATgy4Y+WrrvoBYqRo
 FZDveduDtAEgXFkB4JKMBpvuORjFBdvWgU+sJa/KU1C2+52Fxv0WPpZuZ09C56maWoF8
 SfcfYJm4reb9+8DJlKM41hMprdaRPFCGmK26E5u9OpNLYMBAFpDJCycxMTxOZf9mChjm
 LVe/gMm73Y3zBwOnL8xIjN8BlnVnRhVzHt1q5Q8QgKXpdr0VdKDzZjrILOCtdsOeni0H
 2qdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/1XvtdgV6FHK6XPoy3izEwsdi6F0ZFbdsc3UavYSopxXPagu1xO1SajS5uZKeaqxLiVuBr1z8hyk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl3TjOd7a275T4TGOqYtOqqjMqiEkjjYe0KMpNbN6iMBUBE03c
 7EsuLdWOZMbg08bGMFvuUvTzHGdQgm4iTi3Hqhtl0BRAmrRyIitjiXzOqgzko4cuPZM2q/DUa/3
 jogKEcxnsVm3nq3ogNdLqXCjKKP5lZROuf2p9fr9kbzVer8YiZyhfpLSMn6N8g6pB/WU1Dnw=
X-Gm-Gg: ASbGncs38Lrj5V29XKT8VGy6t8n1ItGHX1CEyYmStq8hYSJc91RJZu1Nhich8rSwivg
 bwcyQxxWTrsWEJpPAUDcVCCO9b20ULnqHnKXas08VCmq4ZqY3aP+5PUdfyoYFrLfmfenVvI+Clc
 uorrDxTKdcn+7QgcGKw2wfyXDdO01hYWFVQN/V7xYuRLE8f1S4IfQLowa0KQLPoRfZIXDcm8bHf
 5PvdsA0XCza+3Uf1tf6nLNCgD6sHkk869TQlNy+viCr2LXjJGJNSUImlG3uBUv7e6mjOhhwEq0g
 o325b0ziYBpLFdM+rtLwgYNlp657kjcPNA+2+AnJlNurDXBUQAaSHeMiHgahjmKI/4Ctej0=
X-Received: by 2002:a05:6a00:190e:b0:757:ca2b:48a3 with SMTP id
 d2e1a72fcca58-7702fa048d1mr16349143b3a.9.1756131538023; 
 Mon, 25 Aug 2025 07:18:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcONK9QkiksV2iPZcOMhRszPAf8sw61weQPpzMqGsQNFrglfJdpF3Bk+hpt3laf8w+p1QW4A==
X-Received: by 2002:a05:6a00:190e:b0:757:ca2b:48a3 with SMTP id
 d2e1a72fcca58-7702fa048d1mr16349105b3a.9.1756131537494; 
 Mon, 25 Aug 2025 07:18:57 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:57 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:12 +0800
Subject: [PATCH v3 26/38] drm/msm/dp: add an API to initialize MST on sink side
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-26-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131423; l=3420;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=5rW/DfearqD7fwWZSsWrOun0WURd1EIi5z5yGV9n+1M=;
 b=EY7yhkz4fOACWjsghjS0efOMUzJwNpOWAwybbpu4RG1f01cD4hxc0M9fMrEN+mSjA4a4SCHrw
 JVNssBx1X0eCD1oIrpidZaR33X6TqT23B7AphT/54EqCJIX9ahQgaep
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ac70d3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=vCCEq3Mv4WXTdc8uXsoA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX0fK5T1NE7HKO
 0cY8f5JQV2o5tbfqDOk2LoXlnjZA1i6UjI82e6SWtQux5zuXwwAOuR4WQEpthFvWK6IC7LB7aE7
 rFH7vL0XZrcrmjpmfoYOQ+HdSTDkFK0RP3A7CycL37DgGWd+2ZWEvMPCVWULaXKATYcTRhMjAca
 /jRIlNySgm4rM8oe9kJEF/it0ZI2lGnzEn0Wtxe0v3RsOpi5JjlURXp1AWd/zmlYQ+AFUrsBuFw
 uZgRZl+JFe9ipn0NLwNIYId0Mac3S6YoBcU7NgvGBEjDK/D2KWps20dKjDrmyYAH+PoRh3WYCD1
 5sXIRcZzqnMjMm2f7XoWFRwPmGEyVOiPl6FEGaUMNxv6pOjLmDMOQ9iaTN0uWBLNat3QKBtSk0O
 O5edmiV1
X-Proofpoint-GUID: bCtHnWeBG6wJ-O00QOIC2cmRpPEzTx__
X-Proofpoint-ORIG-GUID: bCtHnWeBG6wJ-O00QOIC2cmRpPEzTx__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

If the DP controller is capable of supporting multiple streams
then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
DPCD register to enable MST mode.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 55 ++++++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cb433103d439ac6b8089bdecf0ee6be35c914db1..84df34306fb557341bea288ea8c13b0c81b11919 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -14,6 +14,7 @@
 #include <linux/string_choices.h>
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_edid.h>
 
 #include "msm_drv.h"
@@ -297,6 +298,35 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
 	return lttpr_count;
 }
 
+static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
+{
+	const unsigned long clear_mstm_ctrl_timeout_us = 100000;
+	u8 old_mstm_ctrl;
+	struct msm_dp *msm_dp = &dp->msm_dp_display;
+	int ret;
+
+	/* clear sink mst state */
+	drm_dp_dpcd_readb(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
+	drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL, 0);
+
+	/* add extra delay if MST old state is on*/
+	if (old_mstm_ctrl) {
+		drm_dbg_dp(dp->drm_dev, "wait %luus to set DP_MSTM_CTRL set 0\n",
+			   clear_mstm_ctrl_timeout_us);
+		usleep_range(clear_mstm_ctrl_timeout_us,
+			     clear_mstm_ctrl_timeout_us + 1000);
+	}
+
+	ret = drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL,
+				 DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
+	if (ret < 0) {
+		DRM_ERROR("sink mst enablement failed\n");
+		return;
+	}
+
+	msm_dp->mst_active = true;
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
@@ -315,18 +345,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
-	drm_edid_connector_update(connector, drm_edid);
+	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
+		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+		drm_edid_connector_update(connector, drm_edid);
 
-	if (!drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(dp->aux))
-			return -ETIMEDOUT;
-	}
+		if (!drm_edid) {
+			DRM_ERROR("panel edid read failed\n");
+			/* check edid read fail is due to unplug */
+			if (!msm_dp_aux_is_link_connected(dp->aux))
+				return -ETIMEDOUT;
+		}
 
-	if (rc)
-		goto end;
+		if (rc)
+			goto end;
+	}
 
 	msm_dp_link_process_request(dp->link);
 
@@ -349,6 +381,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	 */
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
+	if (dp->mst_supported && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
+		msm_dp_display_mst_init(dp);
+
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 	if (!dp->msm_dp_display.internal_hpd)

-- 
2.34.1

