Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PKPCs6TqWmKAQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 15:31:42 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8E82137C1
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 15:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E81210EC4C;
	Thu,  5 Mar 2026 14:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CrfCuB4T";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZdJr6mlz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F05D10EC4C
 for <freedreno@lists.freedesktop.org>; Thu,  5 Mar 2026 14:31:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFgno1783435
 for <freedreno@lists.freedesktop.org>; Thu, 5 Mar 2026 14:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dm662BBng2zzi9pxMPe+Dyj+lpwsz7Dp0qh/kR+KjPA=; b=CrfCuB4TEIy78dAo
 iIoiWxZ9KGKtW++BM9AJiBmrzVUSTvPFs81/20wo0W+hTjGat6rTS8HzeubwEMpF
 uUgmJadesF3QDV3LCwaX+Hvej/rOCpHfglvCF3tkPZMVbA4itWfyGb1yh3njZBGe
 jT9N9xbB++5/JvJ54q26TTG7gXM+jHhaU9cdIAHrkPpNam9bj0j5qNSr+oogV0tr
 5bQ/UMqb1rSTLyXWk8zwxV+JzmwqfXQ+2dSMI1uxElHi2h7klvLeanA9AhRaKgof
 Sawvsmd/Aqz/CPxXs+S1gQTBd1Dp2HuGie9nIP8tP4H+ThFmurKTWAA0o+/fcC9b
 pGYGPg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk22a0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 14:31:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-89a0796368eso209186496d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 06:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772721098; x=1773325898;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dm662BBng2zzi9pxMPe+Dyj+lpwsz7Dp0qh/kR+KjPA=;
 b=ZdJr6mlzttn5NCOJFcNI9P20/XD9RsNNYnK33APP/+Z7FK1tb5rTARxeLM8z5knrRE
 fLKXLb8gCnrjgDWs4io/LSXfzPpIHEWbj17HY6+bVF24wfG3MQwpojP1dC+xJXPOBQ26
 ezDCnGS8WK8ppF/F5JlNXvR7dS2UyA6kbQ5+oeF4h/pHKWiEQuKTsOHRXgxkY7az6Sv2
 UnpLZBCgqXT8tr8isJwM307sAfH4FrPZvYM7yALCT5YEdEPU7Q0P8dRO2TQI0mZhlb7T
 v7G4smlCZrtb5iyqklf0IMKH6nNXrJOCCL2eo7xx9uDMd5stB5A/TtRK9wZLgDz/4JUD
 P9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772721098; x=1773325898;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dm662BBng2zzi9pxMPe+Dyj+lpwsz7Dp0qh/kR+KjPA=;
 b=CqX6F/B79LLLAEMklWKEMZdB1AVmDcg6vi7PlIFvAbRWaFN4aZCplR1e8Cmzvswym/
 ESx6kFVfKaC0cUl3K2/7/qDhr2BM842N1Hxj4xJ+mtHWh1NxZgh50pk7+sYs3KxQGlOQ
 1Itb9EWlYNmMpSm2xm6V7TKJRGpaYj6+pBc+qNFHPAYOsBoU7VRb2qKFMFQydyiqk3Kq
 ryf87CNzRvM4fEtEGL1P/lPzDtHXOWf0b+d1PJehwdACbBaJLE9tVFyqzOh6nZagSqIs
 pPl6nCaGBv3isqktWBtxCQhIOAloTbWP0eJ2Hpcpxypw35OEJfHM/gNe0pQlaeW64L2W
 OtFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNSy6wOuBCwVG/InQz785O4U0/+FX+gYg23HH8TR3J4BjqJvgMwtZjn51MMCz+O30pQ0YW/WugcBo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7fYqF2772SukcHUUGnlg9e78rXRoRT9eTld+dFkqVBVxEdQew
 UkRsTLnmq+QP734F+ntIcfJCR7L83NNPueNXsOP6uj+eUpfE3zhBWRtCInmt2M0CxkyzviT86YW
 U3DVXTr2KnKeEIjsJwxikIaFbS3fffjYKCVNa42DU4x0kQwqvkroj1V36fd68YFFleIHOdRY=
X-Gm-Gg: ATEYQzzGjH+DPmqNdRMNrs/+WBMjpfQsa+mDYJJuUid4/h5uTmZW9NPhSoFMPVBsuWc
 sD4rTme2PZyvr8J3Ltb02GFkpiYHCdPHZUzC/br4pDoh5zdRpOBLncjJMvtump3XiLivrXHc9IC
 qiBPzxXI537ywegZOu/ikQo8mQycqRokccI5w2inFEp0FuRQiv85Dzv8fGNdjpNym1pPbtuZtm+
 WuqP+ruIrheQunETVTMohuQ1w5Br90OuSjrY3Wt52p/VnVTl3HnDLWITguQndS5D7JW6STBRbBw
 hDx+f5TR8WdrULn0wgVC6B1Y1XuJx9Aib1FfooNNZxZItz2uXUxiu0ty3EpzlbZgif1xcyP62yd
 LSO1MuT1mrSZnUkw9CH9Vi5W5ujwVrqHs1EnMuv37fEevj4iBiWGAhXwE6/qRN41Y2IxkH32llS
 YJQ/g9g7KFjKyeMi072cTtLUOt20syNqSnd+0=
X-Received: by 2002:a05:620a:3949:b0:8ca:3d7c:e74a with SMTP id
 af79cd13be357-8cd5afb208cmr653240885a.56.1772721087915; 
 Thu, 05 Mar 2026 06:31:27 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8ca:3d7c:e74a with SMTP id
 af79cd13be357-8cd5afb208cmr653031485a.56.1772721058621; 
 Thu, 05 Mar 2026 06:30:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 06:30:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:47 +0200
Subject: [PATCH v4 5/9] drm/msm/dp: Drop EV_USER_NOTIFICATION
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-5-39c9d1fef321@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vX+57P9cyOcJ2Ge82Wk30SNt2ZHf9zxIx/x8h+QULh8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOYq3v0+B1pdezNRiSo6SlWnGVibturHchqG
 U66YpfGOc6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmAAKCRCLPIo+Aiko
 1VP9B/9MBpJQ817H4AWTAIeZy7HcR8b+F65w/PHRo1ul2hWes3E1XsDDCmElfIhf4be/s0bxiRr
 Jp67xLF9WHDJj4Uh3b3qtY4lzu/jSFbvq49dSuQbKM2YGaHlXxMaUf8TqQzebyoAKVGi+pvS/Tb
 Hm89tMD4kuclG2akP5018pHVj0/YC5U5yknRpjJQ8cHBGhhFNDZBItUWrGsDQQ9Jj6+Z7xWt6hF
 zDX7crLLzRorpKtKZBv2mFgEmxmlEeyJXn9U5sROqfRK162QOw8UkRUwugh+24QjtBUtXQessiA
 782kSvQ0N18HCvm/Ex75oJgPQjShSlNTGICPc2M3j4qqVH2m
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: s8o-AyHBDDuRmkw3jTubxdOBNXVDsNRP
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a993ca cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=gW5k9mFOS1cgrKxYKbgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: s8o-AyHBDDuRmkw3jTubxdOBNXVDsNRP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX+eXdL+e42M0t
 +K3g6OVnGRjaTKDlwssrCAPcKPMAi70nw0gdC76Qx8aR+U3sgCdQYv+l5vtmFLnB28z+oltcBVh
 kYKBAdhbaoZfBFOcME+41rgW9Dtv3SC1+LvLQ7bNa3qeEL2IQI6FYBVNdZqP4iyzOl3wNiePSSI
 zwgDhsYnZAqHJc2TtamMUPRBBDxLhvD7jvDlrAdmoanqsBvCT/6hqe8D8rhB0683SdIkiLYjRkw
 xvOGSGBcbUsuDpqF2+e6vsJE14HxqmiVuLG/I181jvzCT26d+JqO+eauZownz45qIpVpE+WkkAT
 A0WKHBNbqy0oV4MYMNPF53DqL8OLqWGb0QHfJKmCPPtps8LnoIA1T0QhSckhTUpjaAST9Wp5aR9
 ZFtIpteJEiH2+kC4FZAKc9Qf48XEcp2fC3cKsb8NP2/NvDGUPyHy8o5vlxLNJrNKUbxLYayZm3P
 yvvklIzHLEMr5xIdfPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
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
X-Rspamd-Queue-Id: BE8E82137C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:yongxing.mou@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jessica.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Currently, we queue an event for signalling HPD connect/disconnect. This
can mean a delay in plug/unplug handling and notifying DRM core when a
hotplug happens.

Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e7b1ed5491c4..05c292e27126 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -58,7 +58,6 @@ enum {
 	EV_HPD_PLUG_INT,
 	EV_IRQ_HPD_INT,
 	EV_HPD_UNPLUG_INT,
-	EV_USER_NOTIFICATION,
 };
 
 #define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
@@ -343,17 +342,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
 	.unbind = msm_dp_display_unbind,
 };
 
-static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
-{
-	struct msm_dp_display_private *dp;
-	struct drm_connector *connector;
-
-	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-
-	connector = dp->msm_dp_display.connector;
-	drm_helper_hpd_irq_event(connector->dev);
-}
-
 static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
 					    bool hpd)
 {
@@ -377,7 +365,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
-	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
+
+	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+			      hpd ?
+			      connector_status_connected :
+			      connector_status_disconnected);
 
 	return 0;
 }
@@ -437,7 +429,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
+	msm_dp_display_send_hpd_notification(dp, true);
 
 end:
 	return rc;
@@ -506,7 +498,7 @@ static int msm_dp_display_notify_disconnect(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+	msm_dp_display_send_hpd_notification(dp, false);
 
 	return 0;
 }
@@ -527,7 +519,7 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
 		if (dp->hpd_state != ST_DISCONNECTED) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
-			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+			msm_dp_display_send_hpd_notification(dp, false);
 		}
 	} else {
 		if (dp->hpd_state == ST_DISCONNECTED) {
@@ -1121,10 +1113,6 @@ static int hpd_event_thread(void *data)
 		case EV_IRQ_HPD_INT:
 			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
 			break;
-		case EV_USER_NOTIFICATION:
-			msm_dp_display_send_hpd_notification(msm_dp_priv,
-						todo->data);
-			break;
 		default:
 			break;
 		}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index cc6e2cab36e9..60094061c102 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,6 +16,7 @@ struct msm_dp {
 	struct platform_device *pdev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
+	struct drm_bridge *bridge;
 	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index e4622c85fb66..f935093c4df4 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -340,6 +340,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		}
 	}
 
+	msm_dp_display->bridge = bridge;
+
 	return 0;
 }
 

-- 
2.47.3

