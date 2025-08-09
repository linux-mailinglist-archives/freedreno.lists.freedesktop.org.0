Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AA2B1F188
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 02:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C3510E999;
	Sat,  9 Aug 2025 00:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQOW6Jk5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BB910E99D
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578EidBU003895
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bu9JC9zHNP1OllCJIaZCuXVLfyKeem9bnATi8oCUDNY=; b=iQOW6Jk5GUU0bVVd
 I1yLLuufa0Dp0XT/yBvhy6m6tdQloQG8ZG6GODWIrpFUhQRotWzBRIK9fh/epbhj
 qbuy+htC/toDLwF3Ee6Qmjtay9yAs8tfQeYIuYJTDUn7AEBdpmxJZ//By1qvUURm
 XlQJkrTDQxY8OAsM5iSxv1xejiha0EEQq+bRdVUQzftoN5NCSebpefUpttDFzwdW
 XUShqAY8Um3sy1gOgHAtbsUu7V6Q7HNM1jiVj4o6OWAsDPzK3rYR+vp45n3+QeRw
 2Ob3aadfCaS3x3F47UP9hbpQbqlex52VVMVs5e9E1qT24pKd6u7A7cJIKm7j3QFd
 7PRcaQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyakhvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-240607653f4so23054045ad.3
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699745; x=1755304545;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bu9JC9zHNP1OllCJIaZCuXVLfyKeem9bnATi8oCUDNY=;
 b=ue4PRhoRbTz2JjLvNsFWD6nN2XJM3DX5NUY2NGvKDg1Nx/7GyXBfj8TvBL5x8tZ/q4
 dNdrsoOsFo5ZQ65WfQRRzdnZzJfTZySu7YjcCkQlXmF1+ZegRLKVOaQP9lBQn/D+bmZg
 C/S38qbMnykiVfYV12d2oXzFbPni3QfecrvTbQo5LKgfUxGbzQv0SNeRXawONQosOFDv
 4GeU2aNGh5tFZtrSXe0oOqgvb99G+ijKFo/dOgOb7wjNZ8rNhLCp5SfG1XPSUIhICGo7
 rLvctJ8Hxun07VidwnsEtrbX0r0I3uTGJQ/+PNV2AaCJQN/01AwKMOv2acfXZbL4N9A6
 zrPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyNLRuSKsQhB1CK5b5IofBlkxYs4Av2pf1nmllVAwTWI2KYm9TWx8ZyvaH29N4zQc2mUIyjk2w0N8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/yQqfTzd6AqYFHmPRH5zEXLWbCFnJELGejHzrOuHDIKV+LqR2
 Ta9aP2oo2I0+KCcjz8sG4S5MRT5YtH4cGB6qHPClT2UPvr8kWQfVFK+xuetIFZeazXaGgCIiNTI
 lfgKbxzY/q5a4qsnEKFQ43wByqbkzJfZPif+kMaMn/Gvx1WAr97kEpIhIKqwPMH9uL992hd4=
X-Gm-Gg: ASbGnctXIi8dBoRiD2dkkIpNdGUPiDhwFQ3NGcVRAxNDfwGKzxrpKiyEbAdyp7h97XR
 +6792SuQUnl0HkD+QdjJ0HYWuHKW3MuxKbJS4dyUWbGRS3H56hoKmrq/WVDwrEGsXuxnNtUPL94
 BWQZPi4hYsUQcoK5gEetTEl5iz6qYzX0VOn/asIKQddTogRdlFwAmKG0qmgxunNVD5+SR6mMWY8
 r5QS/y7Z6KqqMnXA+gLP+JsUUM5pNAP8dVNqZEFSJTQvC7hZRBlBe56OQf8JWkzKp7VcSef+29K
 mDIEyAmPpkcGST5L05PfJ0NDVZq897pKA//eQtcvqEIzfSePLa91yAQyhdL1Ks+G8hswdDQdmCz
 0hu0rVDXKz82mZ9jZCHuCES7L
X-Received: by 2002:a17:903:46cb:b0:242:9bbc:3647 with SMTP id
 d9443c01a7336-242c225d0a3mr72360865ad.57.1754699745395; 
 Fri, 08 Aug 2025 17:35:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5oheQKh0vVLh3BuayrDEhBZWfIYUi6SiluwbsB/hAdJ7WViVAEgmlUVSgsmClxqPvza/2KA==
X-Received: by 2002:a17:903:46cb:b0:242:9bbc:3647 with SMTP id
 d9443c01a7336-242c225d0a3mr72360555ad.57.1754699744953; 
 Fri, 08 Aug 2025 17:35:44 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:44 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:19 -0700
Subject: [PATCH v2 07/12] drm/msm/dp: Handle internal HPD IRQ in hpd_notify()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-7-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=8145;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=NtDdlTY6ajF5Cn/Kyk0d5E8/TBSy+P52roB0OK+a+7s=;
 b=64v9EwkavX5hcUROjX+cegb6NBCEoeYw/F/oKT/Tc6EqSzROzgIrBsc2z38w2ux/J6JTTHum6
 sAUi7lWbSrFCV+iW5DyNMJjgX2bi90kVLqy/my+e8KKkhgiY9sKxEnJ
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: MGCvqbPXCimk0U-mRVTKvn00P95QdAYa
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=689697e2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Wiw9OC-66MpX0Jk431gA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXwWkgpYquqbkD
 J3cnM+NzgWQAqPUELLodANhKkqJFH333uLNHw5weNkJ6M4YetUST6H6cGmBJ3wriFwZ6IYZi+Uq
 IBtRY9pDxsMmeTIewNbzZ9VagfXZpXsL71aPpJHenhxU5FW0eJzWg5GzMIULQjIUQan5vVGnZ8s
 FqBH0TXn4vpTmTQoX7dJ4rAPm/mwtFRXbVupiW0UMBqrjPR4qiDfxrMVlI/rOud7rKHvwtUCIfv
 3pOz0JMdzcGaSEBOS9RWK4asMbEceVIA7OKkSx+cJ6DYBM2Q6yOEjpT8zN4g3t+HVHQB+BX1AA1
 mwn9yHnZ9BnxuO23FPK8t9ryyJxtA6WrC35+fVgLeDuf4fxAEVSS8xFKSj2uby2JejOw+rOtT0t
 oMKHdh+m
X-Proofpoint-GUID: MGCvqbPXCimk0U-mRVTKvn00P95QdAYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

Switch to using a threaded IRQ to handle HPD IRQ events and moving
handling of internal HPD IRQ events to hpd_notify().

This will simplify the handling of HPD events by unifying the handling
of both external and internal HPD events in hpd_notify(). Also, having
internal HPD IRQ use the DRM framework calls removes the need for msm_dp
to track the HPD state internally.

Note: The setting of linked ready is moved out of
*_send_hpd_notification() as it should only be set after the plug/unplug
handling has been completed.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 127 +++++++++++++++++++++++++-----------
 1 file changed, 90 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8779bcd1b27c..b9e2e368c4a8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -96,6 +96,10 @@ struct msm_dp_display_private {
 	/* wait for audio signaling */
 	struct completion audio_comp;
 
+	/* HPD IRQ handling */
+	spinlock_t irq_thread_lock;
+	u32 hpd_isr_status;
+
 	/* event related only access by event thread */
 	struct mutex event_mutex;
 	wait_queue_head_t event_q;
@@ -345,14 +349,8 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	/* reset video pattern flag on disconnect */
 	if (!hpd) {
 		dp->panel->video_test = false;
-		if (!dp->msm_dp_display.is_edp)
-			drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
-							 connector_status_disconnected,
-							 dp->panel->dpcd,
-							 dp->panel->downstream_ports);
 	}
 
-	dp->msm_dp_display.link_ready = hpd;
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
@@ -407,6 +405,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
+	dp->msm_dp_display.link_ready = true;
+
 	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
@@ -420,7 +420,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
-	msm_dp_display_send_hpd_notification(dp, true);
+	if (!dp->msm_dp_display.internal_hpd)
+		msm_dp_display_send_hpd_notification(dp, true);
 
 end:
 	return rc;
@@ -489,7 +490,16 @@ static int msm_dp_display_notify_disconnect(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	msm_dp_display_send_hpd_notification(dp, false);
+	if (!dp->msm_dp_display.is_edp)
+		drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
+						 connector_status_disconnected,
+						 dp->panel->dpcd,
+						 dp->panel->downstream_ports);
+
+	dp->msm_dp_display.link_ready = false;
+
+	if (!dp->msm_dp_display.internal_hpd)
+		msm_dp_display_send_hpd_notification(dp, false);
 
 	return 0;
 }
@@ -1182,40 +1192,56 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
 static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 {
 	struct msm_dp_display_private *dp = dev_id;
-	irqreturn_t ret = IRQ_NONE;
 	u32 hpd_isr_status;
-
-	if (!dp) {
-		DRM_ERROR("invalid data\n");
-		return IRQ_NONE;
-	}
+	unsigned long flags;
+	irqreturn_t ret = IRQ_HANDLED;
 
 	hpd_isr_status = msm_dp_aux_get_hpd_intr_status(dp->aux);
 
 	if (hpd_isr_status & 0x0F) {
 		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
 			dp->msm_dp_display.connector_type, hpd_isr_status);
-		/* hpd related interrupts */
-		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 
-		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
-		}
+		spin_lock_irqsave(&dp->irq_thread_lock, flags);
+		dp->hpd_isr_status |= hpd_isr_status;
+		ret = IRQ_WAKE_THREAD;
+		spin_unlock_irqrestore(&dp->irq_thread_lock, flags);
+	}
 
-		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
-		}
+	/* DP controller isr */
+	ret |= msm_dp_ctrl_isr(dp->ctrl);
 
-		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+	return ret;
+}
 
-		ret = IRQ_HANDLED;
+static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
+{
+	struct msm_dp_display_private *dp = dev_id;
+	irqreturn_t ret = IRQ_NONE;
+	unsigned long flags;
+	u32 hpd_isr_status;
+
+	if (!dp) {
+		DRM_ERROR("invalid data\n");
+		return IRQ_NONE;
 	}
 
-	/* DP controller isr */
-	ret |= msm_dp_ctrl_isr(dp->ctrl);
+	spin_lock_irqsave(&dp->irq_thread_lock, flags);
+	hpd_isr_status = dp->hpd_isr_status;
+	dp->hpd_isr_status = 0;
+	spin_unlock_irqrestore(&dp->irq_thread_lock, flags);
+
+	/* hpd related interrupts */
+	if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
+		msm_dp_display_send_hpd_notification(dp, true);
+
+	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
+		msm_dp_display_send_hpd_notification(dp, false);
+
+	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+		msm_dp_display_send_hpd_notification(dp, true);
+
+	ret = IRQ_HANDLED;
 
 	return ret;
 }
@@ -1231,9 +1257,13 @@ static int msm_dp_display_request_irq(struct msm_dp_display_private *dp)
 		return dp->irq;
 	}
 
-	rc = devm_request_irq(&pdev->dev, dp->irq, msm_dp_display_irq_handler,
-			      IRQF_TRIGGER_HIGH|IRQF_NO_AUTOEN,
-			      "dp_display_isr", dp);
+	spin_lock_init(&dp->irq_thread_lock);
+	irq_set_status_flags(dp->irq, IRQ_NOAUTOEN);
+	rc = devm_request_threaded_irq(&pdev->dev, dp->irq,
+				       msm_dp_display_irq_handler,
+				       msm_dp_display_irq_thread,
+				       IRQ_TYPE_LEVEL_HIGH,
+				       "dp_display_isr", dp);
 
 	if (rc < 0) {
 		DRM_ERROR("failed to request IRQ%u: %d\n",
@@ -1413,6 +1443,7 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 	dp->wide_bus_supported = desc->wide_bus_supported;
 	dp->msm_dp_display.is_edp =
 		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
+	dp->hpd_isr_status = 0;
 
 	rc = msm_dp_display_get_io(dp);
 	if (rc)
@@ -1822,13 +1853,35 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+	u32 hpd_link_status = 0;
 
-	/* Without next_bridge interrupts are handled by the DP core directly */
-	if (msm_dp_display->internal_hpd)
-		return;
+	if (msm_dp_display->internal_hpd) {
+		if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
+			DRM_ERROR("failed to pm_runtime_resume\n");
+			return;
+		}
+
+		hpd_link_status = msm_dp_aux_is_link_connected(dp->aux);
+	}
 
-	if (!msm_dp_display->link_ready && status == connector_status_connected)
+	drm_dbg_dp(dp->drm_dev, "type=%d link connected=0x%x, link_ready=%d, status=%d\n",
+		   msm_dp_display->connector_type, hpd_link_status,
+		   msm_dp_display->link_ready, status);
+
+	if ((!msm_dp_display->internal_hpd || hpd_link_status == ISR_CONNECTED) &&
+	    status == connector_status_connected)
+		msm_dp_hpd_plug_handle(dp, 0);
+	else if ((hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) &&
+	    status == connector_status_connected)
+		msm_dp_irq_hpd_handle(dp, 0);
+	else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 		msm_dp_hpd_plug_handle(dp, 0);
-	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
 		msm_dp_hpd_unplug_handle(dp, 0);
+	} else if ((!msm_dp_display->internal_hpd ||
+		    hpd_link_status == ISR_DISCONNECTED) &&
+		 status == connector_status_disconnected)
+		msm_dp_hpd_unplug_handle(dp, 0);
+
+	if (msm_dp_display->internal_hpd)
+		pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 }

-- 
2.50.1

