Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A71DB0289D
	for <lists+freedreno@lfdr.de>; Sat, 12 Jul 2025 02:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2481910EB0A;
	Sat, 12 Jul 2025 00:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AsFoYw/H";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7007F10EB13
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:56 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0h0hZ001368
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0C88ySzlRVkPe1hio0ux/weKP4+LF6gD4q5Pn05V+2c=; b=AsFoYw/H0Y/6cHx/
 +C2RsolKjMFnDo7LMpuiorvS7yob2yWs4rOeezMSrgJbNsQVs66Zti4s7vw5DzgD
 Xtsuwy/k7cl6Cgu3uruw5rrBuvKCOrNP4CuuWKOppxHLO9CsVqUHgIK6S1fNm2Tm
 jQUSwUQQ8+nJhqZeBJUYc5mAQ1Ko55SShmcrNTScTwk/jFfKxFpPL1poYMlRrG8k
 k86wB22n3TJmPwXv0JwrLMR4gcibNgarCah7FsNfXv4JttMWRTqdhg29mhrpDF7t
 qJIGY5X8vtTqsRJOxK9DuKrdkpLNpHfa1hpVdsalWubr4Ytb9jurUq1/PWug611z
 EFSCBA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uddjr0q2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-315af08594fso2888455a91.2
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281935; x=1752886735;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0C88ySzlRVkPe1hio0ux/weKP4+LF6gD4q5Pn05V+2c=;
 b=XvdO36+26Pty1wKpRzW3KklfYTXOziXwzd6Rfy8OQzIrQfVkShskxxn6q0Os70WkMa
 W5MRawTkQhBIiVW4DPH4ixZDMoSvLR1evKb38k6fVCOxc/aZEGwYao/iXAsvB8nJQ2U7
 z8eaaUGrVokn3w+2t2zFcRJyiICuLINlKVEh3TNSMhSkgRACEdpvHyIiQYIw5PiaA/iU
 r2viXBYTCqdjX7eYUH9qlpXpDaqa6TilVZxFvH+8AHSOPXu2JOm6XWLy4pZtDmr4lNRT
 iWFBC9lybm7RFVxpHBtsEhIjUAMKf4c4ptuay/CYIsDu28ywozmca3uRj54UvkGfMpU+
 NfXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5FuQ0ziT2eCmS/5Nx2Hu54Gp5EufpFwjjGAlq+tBxYAVMrBO3BSFSH3eYmGtpeJzohaRXcAeOy8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1IKiXiH5dguTqfASbrjIRqyjPbY2eg/uYTIEKmikNkhGcIXeq
 fVEWkXS9axlMH7b1gIJLhc13efDXs1kWnqSMfjhtNTC+BYVCZjwJXr0US+XvftePyQIoiRz0sVx
 3d7IVNLdhYggxxh2n+BHhjFTbrZCcswvso/AmiuK10QAxqORadFO0zsC/Ck0O2Cj55ql2KiM=
X-Gm-Gg: ASbGncuw9ix6njUjOV3qhOxgLh1SjLaSfqaOZC9lXsvNsRW5kN2GOmqXig/FsxVDjYJ
 ZJ8ZyyrJjX8PiVkvD+WCrAnuxnCGxAV7HS6jJzf9xVhXBM0u728SJJsDV3Q7FwwvWgIkg8MzbYt
 TAhGnygpnrJQSGtkvmmtNTKLCW7b3FGNF8i+GYkqV2c69UY5scsNmVAR0ejo0aggo2LJAIri00l
 yfIqGxXjSYKEl1my9cyLUI0GsN402Tp7YZ9tPQVpXgriTZjBqcAuD2LndIxVxCMje0aAMK4VX7o
 swfFnPtudvWFS5boZ1mH8WzT8N+uIjVZWcS0JcaivKDQFUvG9bAgB79rzxdnqjm2bUOG698EktD
 2+lz05cjeHlkvs7NNUdVv2mvJ
X-Received: by 2002:a17:90b:3806:b0:313:352f:6620 with SMTP id
 98e67ed59e1d1-31c4f48b065mr6358986a91.4.1752281934871; 
 Fri, 11 Jul 2025 17:58:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSMo65Z+KjgTkv6KVMymiCmYn2CuabOGuLC9Bx4y8ORCEvQnAn1GjeeBbaCqqC88pcfO/NfA==
X-Received: by 2002:a17:90b:3806:b0:313:352f:6620 with SMTP id
 98e67ed59e1d1-31c4f48b065mr6358959a91.4.1752281934320; 
 Fri, 11 Jul 2025 17:58:54 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:53 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:23 -0700
Subject: [PATCH 18/19] drm/msm/dp: Move link training to atomic_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-18-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=3032;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=HYg9XWFkcmpF+zp7toVqFdfKLKICGtSNzR5KskC59d4=;
 b=7+gsmDRAKN2VpsBwMET5tAsE9ulwWLuSi/xwkZxe0AroYvNbWoU1IavIh8Q0oGY/KFhURfV7+
 fSMh0NidnKiAc5SKyTQ023CgPOMIPnYaXRICzE7VRl37GEZkUnNC+lK
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: FN8j2rfexpUVaaxMZoGymezI0arSCGJL
X-Proofpoint-GUID: FN8j2rfexpUVaaxMZoGymezI0arSCGJL
X-Authority-Analysis: v=2.4 cv=ZPrXmW7b c=1 sm=1 tr=0 ts=6871b34f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=lFCKDqVE_jtoW-ZCWqQA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNCBTYWx0ZWRfX9T5VO5yNWBpd
 NwV+rz+YBWyNXUZ6MBfDYNeXp1fSnNy65p3SJIovDLlqPbXq6BrCwJXBmBssrvJS9DlJI9Ruabn
 jhx8gr/U7r4okpX1i5PI+8fEB0jgoii4Qkn7Knmoomf7jXxCj2SveXckcJqE1kXCA0E2vS/wjyC
 VSRgO+/wrdsx8LK9ipZGqH+fSpNK63ey/1aqLHQ3q4KCFuW1NmMyyFMLADYwdAcjaiC+xpWeBlk
 2ZcurFA+Yv4VcKTkoOvpdwyQm9KAcul+UHmUoC4a/27WskaWP0Spbsl5n0NilOEBvd94BEpuiOP
 alsa5fZfioD+qaDzQcYy68SF9ipIFkQ/xa6tdvO24ycKHYYKyGfwACO/eh9Id5nnJZ9N4k6XrI7
 javH6WrU0YPalJK089TVV/54YXdzYKkEkFLCIzhxjiOVhAzK4sFQ18P0tOg1B0ht4VxLDjfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120004
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

Currently, the DP link training is being done during HPD. Move
link training to atomic_enable() in accordance with the atomic_enable()
documentation.

In addition, don't disable the link until atomic_post_disable() (as part
of the dp_ctrl_off[_link_stream]() helpers).

Since the link training is moved to a later part of the enable sequence,
change the bridge detect() to return true when the display is physically
connected instead of when the link is ready.

Finally, call the plug/unplug handlers directly in hpd_notify() instead
of queueing them in the event thread so that they aren't preempted by
other events.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
 drivers/gpu/drm/msm/dp/dp_drm.c     |  6 +++---
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 87f2750a99ca..32e1ee40c2c3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -410,11 +410,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
-	if (rc) {
-		DRM_ERROR("failed to complete DP link training\n");
-		goto end;
-	}
 
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
@@ -1561,6 +1556,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		force_link_train = true;
 	}
 
+	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	if (rc) {
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
+	}
+
 	msm_dp_display_enable(msm_dp_display, force_link_train);
 
 	rc = msm_dp_display_post_enable(dp);
@@ -1706,7 +1707,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		return;
 
 	if (!msm_dp_display->link_ready && status == connector_status_connected)
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		msm_dp_hpd_plug_handle(dp, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
-		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		msm_dp_hpd_unplug_handle(dp, 0);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index b12a43499c54..3bcdf00b2d95 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -26,10 +26,10 @@ static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
 
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
-	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
-		str_true_false(dp->link_ready));
+	drm_dbg_dp(dp->drm_dev, "connected = %s\n",
+		str_true_false(dp->connected));
 
-	return (dp->link_ready) ? connector_status_connected :
+	return (dp->connected) ? connector_status_connected :
 					connector_status_disconnected;
 }
 

-- 
2.50.1

