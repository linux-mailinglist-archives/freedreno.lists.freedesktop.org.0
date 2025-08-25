Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C9B3432A
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3C010E4C1;
	Mon, 25 Aug 2025 14:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2MD0LD0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ED910E4C1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:39 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8HJYP006732
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Gt1Kd8WbN3Mntymw4DR5wvrt37t2QDrxmTEvWz907Ls=; b=c2MD0LD0KNtQ8LXc
 XV7eQ7AO42NDMjcXTvrTkXJQT8Nb+L/3P1v8gRKP4Hm1mdNidWmQn2pf+pMcBs7/
 1GashBKtfESCU5+eXvkJS3wvM0c64GcFBkKQn291e/E623nGL4Z8SfRM4EaHS4YM
 yl0itQZ9ohlqcabPooORsLGBLBJ97u++R2jlek4yLxlZqj+AXTN/dMbfnJN7ekGI
 9TcrY+92yqsImhGII01mYqoE5i0Ogwji6hzggqBeth4OJyuPY+OF69Sb8zgrLlW7
 0dpObKAOa3GpSsT7KQiBDhvi+axg0dPnXCd9tG2MrZr5YJBRphWWx4jvXlhXBXIM
 eSaEAw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um5ee9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-76e2ea9366aso4084083b3a.2
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131518; x=1756736318;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gt1Kd8WbN3Mntymw4DR5wvrt37t2QDrxmTEvWz907Ls=;
 b=T2/qODPEPLiubAqYYI+RPMB/Ht8MK4jIZADX8ySn4ZotcgeOnRyIRNn8GO0sUmcZVh
 h/B4p+d/vwkJ6Z/8tLfc+jMticEir2pRTY2ZbRr8MdcERE6o4wOtNTw0Ax02dCfUzPlM
 kPW/pCOfN8BAaU7SLHRi49BLYYezeBpc4gRyMRLFDWihrQ/uZJE2PSqqaacjsGn47UiE
 LbTQRUs0XWyx4RZ881u/cmUgYVL+tX3CtxVzM7lBEMCbj2E/GzpRW0yFWjtUk1PXuqNB
 ag4kfvSpjlpn7Uys1HrLQ1G9IyScAnU4dKMDMCH5h9B9/9nddbKyaimuEAAwfjakqP08
 7+5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjhy072n3b7UOphy3gMom2UTCIjDriAF/pbX7wAK7KpJ4H59BiUlE0XvvYDLgYH/svjaSRu9UsqEQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlyTFQZOzCmsiPfD7qWEibwow/vQfC3ahksX7U1IH4JXYRvlYR
 UzggbP2VghxG/DTpAi6ZkkpK6EjDenfv/zN8f3QEaK+5xCgxsVFUKKNlXKihggcTOFDV+5FJWG6
 c6Hz/X87X09TU6Gn7rUbHFY4S1aWTNOtO/jiIxz3dfwO/XgZQwndIj2e2I/dyn3lw3/Oa0EM=
X-Gm-Gg: ASbGncvjay1/+c6ytFeO0vALjR1u2mSMA2E5OvcKkXqfUXwMzIlq8Cr2Gr4+Nl09Wne
 0wr3SqZu2+VQE0wftWnVk66kos4RAMj76wt8te54kThWZyfO5NQ6aueg22HzbO3HxYaMIwd2gHA
 I5276b1TAJez0WYFuxZfAYl2FkzrSrH7gCGmdfIYwwol/3V63MgGzMVPPx+TGrzZ4KJ6YWt2OZu
 dUeikjsmrFW0VjYqqFnCcZI0bd5pjn+AQj9l4JmWOA73tuMBacYby/s8LtFdkCZAY2HF8tkBf/d
 ka/wpcRrQ0RRoHlf+KChotzP/nwog+FZ2MIDKyU3bzJYr5HSAX73fTLmJrQRUhaEtK9RqHE=
X-Received: by 2002:a05:6a20:2443:b0:243:78a:827d with SMTP id
 adf61e73a8af0-24340dc46b2mr16682859637.53.1756131517605; 
 Mon, 25 Aug 2025 07:18:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHomJT8J2UBNar/NA6E/rkncy7tadfSH1DRguPQKCalJFoL98InY6Oc0JDca7mmJ3MGgGdaiQ==
X-Received: by 2002:a05:6a20:2443:b0:243:78a:827d with SMTP id
 adf61e73a8af0-24340dc46b2mr16682804637.53.1756131516926; 
 Mon, 25 Aug 2025 07:18:36 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:36 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:07 +0800
Subject: [PATCH v3 21/38] drm/msm/dp: Add support for sending VCPF packets
 in DP controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-21-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131422; l=7673;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=qlIXBJ1QvKUhgZ3FYzOczLF5vj3ZjmxjVSTdxEltdwk=;
 b=fPJwQQ0kAJqFHkfrjzS7eStp0w1oei2jCw3xHw2NthqM0pjx4VMlLCCNc3kagKeEUODnGmIok
 0/ckcXY4eFVDHh6rxhdVSM020Z3Nl8yQpj0Dy3Fg3baWs854WEUlFag
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ac70be cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=unrKvF7sv23klRea54oA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX4Ub/Mw2E1ssi
 +1s1zVUVrjR0Uzn4ubc5s2TI2TlViVoM8kqQxwMPJNBPBTykmZncdQvtogGpfxqHS6+qihfzu1c
 y3TcY6M+UAg48Y7VScxpclWizITLf5yUiwHnbxlinBtAjcChU/o9CQJv7P8vRS/03FtVv+0T0jt
 0XTeqcwCqmYrCKf87B6VocBlzCxJWk6NimV7TJpWBvbUWhvABpREj6892ZVvKJeBO4DQb/Fq25T
 0M43mkUEtI5YE4EytSMGZb7NZCkENctW0RTWrA8CYoIY4c6MIuJSIS1Nsxra6k9FRipmFXSk5YZ
 gQrzQDb8KQ0jHtmtfAvdrJxwx8+MMxVvgP6/27zSrBdtcriIqo7I3qlcxAYERdCycpu4V12LIJ0
 uUE2NEzh
X-Proofpoint-GUID: rrFic78bdm6_xLRAn1QQcRoAPUgyet7U
X-Proofpoint-ORIG-GUID: rrFic78bdm6_xLRAn1QQcRoAPUgyet7U
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

The VC Payload Fill (VCPF) sequence is inserted by the DP controller
when stream symbols are absent, typically before a stream is disabled.
This patch adds support for triggering the VCPF sequence in the MSM DP
controller.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 56 ++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |  6 ++++
 4 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 9d58d9480fc4ab33c58218ef9beb54c64805c34c..58e8c526253f77f306c669d474bdb2d1751b49a5 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -65,9 +65,18 @@
 	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
 	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
 
+#define DP_INTERRUPT_STATUS5 \
+	(DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)
+#define DP_INTERRUPT_STATUS5_MASK \
+	(DP_INTERRUPT_STATUS5 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
 #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
 #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
 
+#define DP_DP0_PUSH_VCPF		BIT(12)
+#define DP_DP1_PUSH_VCPF		BIT(14)
+#define DP_MSTLINK_PUSH_VCPF		BIT(12)
+
 #define MR_LINK_TRAINING1  0x8
 #define MR_LINK_SYMBOL_ERM 0x80
 #define MR_LINK_PRBS7 0x100
@@ -407,6 +416,8 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 			DP_INTERRUPT_STATUS1_MASK);
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2,
 			DP_INTERRUPT_STATUS2_MASK);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
+			DP_INTERRUPT_STATUS5_MASK);
 }
 
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -416,6 +427,7 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS, 0x00);
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2, 0x00);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5, 0x00);
 }
 
 static u32 msm_dp_ctrl_get_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
@@ -435,6 +447,20 @@ static void msm_dp_ctrl_config_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
 }
 
+static u32 msm_dp_ctrl_get_mst_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS5);
+	intr &= ~DP_INTERRUPT_STATUS5_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS5)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
+			 intr_ack | DP_INTERRUPT_STATUS5_MASK);
+
+	return intr;
+}
+
 static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
 {
 	u32 val;
@@ -518,14 +544,29 @@ static bool msm_dp_ctrl_mainlink_ready(struct msm_dp_ctrl_private *ctrl)
 	return true;
 }
 
-void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
+	u32 state = 0x0;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
+	if (!ctrl->mst_active)
+		state |= DP_STATE_CTRL_PUSH_IDLE;
+	else if (msm_dp_panel->stream_id == DP_STREAM_0)
+		state |= DP_DP0_PUSH_VCPF;
+	else if (msm_dp_panel->stream_id == DP_STREAM_1)
+		state |= DP_DP1_PUSH_VCPF;
+	else
+		state |= DP_MSTLINK_PUSH_VCPF;
+
 	reinit_completion(&ctrl->idle_comp);
-	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
+
+	if (msm_dp_panel->stream_id > DP_STREAM_1)
+		msm_dp_write_mstlink(ctrl, msm_dp_panel->stream_id,
+			REG_DP_MSTLINK_STATE_CTRL, state);
+	else
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, state);
 
 	if (!wait_for_completion_timeout(&ctrl->idle_comp,
 			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
@@ -2074,7 +2115,7 @@ void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enter)
 			return;
 		}
 
-		msm_dp_ctrl_push_idle(msm_dp_ctrl);
+		msm_dp_ctrl_push_idle(msm_dp_ctrl, ctrl->panel);
 		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
 		msm_dp_ctrl_psr_mainlink_disable(ctrl);
@@ -2184,7 +2225,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 	int ret = 0;
 	int training_step = DP_TRAINING_NONE;
 
-	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl, ctrl->panel);
 
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
@@ -2994,6 +3035,13 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 		ret = IRQ_HANDLED;
 	}
 
+	isr = msm_dp_ctrl_get_mst_interrupt(ctrl);
+	if (isr & (DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)) {
+		drm_dbg_dp(ctrl->drm_dev, "vcpf sent\n");
+		complete(&ctrl->idle_comp);
+		ret = IRQ_HANDLED;
+	}
+
 	/* DP aux isr */
 	isr = msm_dp_ctrl_get_aux_interrupt(ctrl);
 	if (isr)
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 751f00c97b94dc3b9e8fae2a86e261f71f293425..356030fda9a749f0caa4438ffad88c3f34ce8960 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -22,7 +22,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl,
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
-void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 17633ba79aa7642856051b69227e8f5b23d76730..e02ada7a3dc3b89618aeadd998e9a41236ee6bbf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1568,7 +1568,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_ctrl_push_idle(dp->ctrl);
+	msm_dp_ctrl_push_idle(dp->ctrl, dp->panel);
 	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl,
 		dp->max_stream);
 	msm_dp_ctrl_mst_send_act(dp->ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index ee4debf796910e00d370ab4c687009747bae5378..70fb647a25c05dc89f6aaf21456ddf2918cecbc3 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -42,9 +42,13 @@
 #define DP_INTR_FRAME_END		BIT(6)
 #define DP_INTR_CRC_UPDATED		BIT(9)
 
+#define DP_INTR_DP0_VCPF_SENT		BIT(0)
+#define DP_INTR_DP1_VCPF_SENT		BIT(3)
+
 #define REG_DP_INTR_STATUS3			(0x00000028)
 
 #define REG_DP_INTR_STATUS4			(0x0000002C)
+#define REG_DP_INTR_STATUS5			(0x00000034)
 #define PSR_UPDATE_INT				(0x00000001)
 #define PSR_CAPTURE_INT				(0x00000004)
 #define PSR_EXIT_INT				(0x00000010)
@@ -377,6 +381,8 @@
 #define REG_DP_DP0_RG				(0x000004F8)
 #define REG_DP_DP1_RG				(0x000004FC)
 
+#define REG_DP_MSTLINK_STATE_CTRL		(0x00000000)
+
 /* DP HDCP 1.3 registers */
 #define DP_HDCP_CTRL                                   (0x0A0)
 #define DP_HDCP_STATUS                                 (0x0A4)

-- 
2.34.1

