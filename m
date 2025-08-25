Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A240B34345
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AF310E4C8;
	Mon, 25 Aug 2025 14:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcldEwMH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917EF10E4CF
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:20 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8IKWL010324
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7R+hTtTaw5ToTCdndEqM/Un8EO0K3ITnYySHNRTUxeU=; b=GcldEwMHV/S/D5Jg
 QOiE5JgBkxKkLgrkkDstCWZ/mtTcV5BHCCX0FHXEC0LtpQZt+HwBWOxRpZtEOmgH
 fMq4ZS3SG+YZZbGtsiZTF1AC3rjh+aF//mM8JILL0Y+wyOPIW+SYTrd+D7ioM1hE
 mQNOwiauHRo62Ory+bL6i2ivuVa4j9HD9w1znb0AsjAEVMeiwThjRpzwTGpxHJMD
 H8pWGKWDuNAHInjpJLi3ALERkxIqnFPHAyjEZRx7QZjwYtFJEh9JZ6awMHnUnWGK
 0qzLtEkXePHv1088mp2UROBxpo1buf1ZweaZsgpnCtn22PeblepOrmk36Vudmkt4
 f/k+nQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2nfk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e2e5c4734so4477255b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131559; x=1756736359;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7R+hTtTaw5ToTCdndEqM/Un8EO0K3ITnYySHNRTUxeU=;
 b=sUvqohTQ6idxFkn6UYwWsPRIVHJLjgsYOlAO6pj/TuiR3hpx2qr9Hq7FYh4+nAWIaL
 1NFUFxDL/e3QNvusKPDUytmLEe+uWZQ5K4Du5226ibHFKGxC1tPebGjtQNAUY0F69Z5+
 PDuIf1sXivU9ccenmHGuO+0C4lVUzToXrUXzV9ykYZU20MxozApJh1r8YKRzrd3k+/yW
 HLigQVwq299sFrYzaXd9hcWq0Wf5jjPJwxgmHcekK1fNQLGrNjBCPmliJCzn/EmCHhZY
 IERetfyvrD3IynvrydDoecBZeIH8d5mG5XFhAdg63U92jyYXZRc0bwVE9fB9Ep9pGATN
 bxYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAlYk8eYD/Uve/8gBPV7dYU7px2hMYwJaWGr/qSDs5W5+xRgNkv3ol9E6g8Y+cC1Y0zE2hw0hK5EU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywb4/JRFi7qh8NYXvmi5q7+2LXdwwSfc5l8fySY84y4Oi2PPrDk
 6Yc9/Pvuh9RnRufP84JEJ4ADIzi1gBGL/IxLlKzDteDY0Xm4trwSxhMJCJno+A+kbiy94OKp6Q0
 Aa+M648cxrHbbbrj9f08AsM53l8BLGGeOrUBYeGf1a5ANPD7r2caVOW9u1pI+EkFhToWIoA8clh
 IL4eM=
X-Gm-Gg: ASbGncuHvo+M7P9A0zVSVtpGWgqBa4az9xFgSBf+7tnTJmPa54iqlcT4pRlWTH1/aZx
 I1FrDgAXz8bXsiJzva8QR3aZEPMpLS/TFSIy3T6GgmtcVm7eIGO+59sHwIrvq5HB36VZxrbb71A
 h1bH7nnQpprVm/tJa5+cLmcy+ngpilfTbLx/H4wKgeQ5BHDj/PAlRD4zpMNGcA5CDIaU74pwgBL
 US4JSqRk1FGuIXTQuRla4mJ/1UbEVesvdzSIpowE7C71gtwuayNt0dedPY54td2ox46+1cJo3dW
 LTvm/NE3h4iDUQ8T8gvsl7f8oyTwYN42UUuaaFVIq2GbI+X8HAndJuAe0C2I7+rerlemvkc=
X-Received: by 2002:a05:6a00:66ea:b0:770:573f:fc60 with SMTP id
 d2e1a72fcca58-770573ffe32mr6197193b3a.0.1756131559024; 
 Mon, 25 Aug 2025 07:19:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjmJ7NV1t2qumG5euFKY+e++axraVSZFOy8I/JF9oxRhd3vr0G6AVqJ5TJ0WdytlSZ+NXJMw==
X-Received: by 2002:a05:6a00:66ea:b0:770:573f:fc60 with SMTP id
 d2e1a72fcca58-770573ffe32mr6197171b3a.0.1756131558524; 
 Mon, 25 Aug 2025 07:19:18 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:18 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:17 +0800
Subject: [PATCH v3 31/38] drm/msm/dp: add HPD callback for dp MST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131423; l=3991;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=1chu/CyRFrYOIwyNnb7S1JG/A8QXA7TWXcBAfK9Edbc=;
 b=gEe8hTvRJJLhsQmmiybBLmIQrG2tiZ4F0jIKl5ZuNvwsnEohg7D4bYN8sSFgu8jgmUYzGWHCn
 C+HuY+eRJ0bD+s84EKfVlrAooZa3aw+Jn0tJ4b8uaCks7YEKleczjoo
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ac70e8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=bKAP0W6k1q0hwOPLvAEA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX7D0YbC2QMEak
 L69DqQxpEng5UDuByoc+care8hqMvFADtu+SYXktONvi+BHZHS2QpE3aFHZ0R5CZk1nua4CvyN8
 rTsmGgVwYzwODNQLoQAjx9QXUJBCP1U1+lzk4t5OKH0+/ZRCZ+NDd4Moxb/iuM3mGbDqNMBm82Q
 P3by35koqpiA/kyE1yLXVRoemkZUHkcxnVyJeHyJqB1ORwkH2DrS8dWerl/YYrrzR/uPB5sGb+3
 xwB8Z+9mHcXQV1kl35jr+ucOVeP772dVJrOI/JTpcZyXkT4tzEpqqj8TRtbJ0GSg/fiIuL32JNn
 fGIyLzhiKqLbpoVcZlmHvCNyaSudCm7S633D4Yg80q7pQjpX6NxlpWttX8klkjCzwRtArZ5MEsg
 t6eKtAxR
X-Proofpoint-GUID: 1mvasLJJPCLK95ucZ--qGycJcwDab9bY
X-Proofpoint-ORIG-GUID: 1mvasLJJPCLK95ucZ--qGycJcwDab9bY
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

Add HPD callback for the MST module which shall be invoked from the
dp_display's HPD handler to perform MST specific operations in case
of HPD. In MST case, route the HPD messages to MST module.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++++---
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
 3 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index abcab3ed43b6da5ef898355cf9b7561cd9fe0404..59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -500,9 +500,16 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 
 static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 {
-	int rc = 0;
-	u32 sink_request;
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	u32 sink_request;
+	int rc = 0;
+
+	if (msm_dp_display->mst_active) {
+		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
+			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
+		return 0;
+	}
 
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
@@ -1129,8 +1136,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
 		msm_dp_display_send_hpd_notification(dp, false);
 
-	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
 		msm_dp_display_send_hpd_notification(dp, true);
+		msm_dp_irq_hpd_handle(dp, 0);
+	}
 
 	ret = IRQ_HANDLED;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index b4f640134af544c77ab262d2cbe0b67e1e2e1b3a..331d08854049d9c74d49aa231f3507539986099e 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -567,6 +567,40 @@ static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomi
 	return to_msm_dp_mst_bridge_state_priv(obj_state);
 }
 
+/* DP MST HPD IRQ callback */
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
+{
+	int rc;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	u8 ack[8] = {};
+	u8 esi[4];
+	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
+	bool handled;
+
+	rc = drm_dp_dpcd_read(mst->dp_aux, DP_SINK_COUNT_ESI,
+			      esi, 4);
+	if (rc != 4) {
+		DRM_ERROR("dpcd sink status read failed, rlen=%d\n", rc);
+		return;
+	}
+
+	drm_dbg_dp(dp_display->drm_dev, "mst irq: esi1[0x%x] esi2[0x%x] esi3[%x]\n",
+		   esi[1], esi[2], esi[3]);
+
+	rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
+
+	/* ack the request */
+	if (handled) {
+		rc = drm_dp_dpcd_writeb(mst->dp_aux, esi_res, ack[1]);
+
+		if (rc != 1)
+			DRM_ERROR("dpcd esi_res failed. rc=%d\n", rc);
+
+		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
+	}
+	drm_dbg_dp(dp_display->drm_dev, "mst display hpd_irq handled:%d rc:%d\n", handled, rc);
+}
+
 /* DP MST Connector OPs */
 static int
 msm_dp_mst_connector_detect(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 1484fabd92ad0075eac5369aac8ca462acbd3eda..5e1b4db8aea4506b0e1cc1cc68980dd617d3f72a 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -86,4 +86,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
 
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
+
 #endif /* _DP_MST_DRM_H_ */

-- 
2.34.1

