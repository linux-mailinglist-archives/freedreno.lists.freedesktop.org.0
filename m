Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJNAIKqTqWmKAQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 15:31:06 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDB0213759
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 15:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B2F10EC3A;
	Thu,  5 Mar 2026 14:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceLZRLgV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTfrg+12";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5A110EC31
 for <freedreno@lists.freedesktop.org>; Thu,  5 Mar 2026 14:31:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFwI2456259
 for <freedreno@lists.freedesktop.org>; Thu, 5 Mar 2026 14:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XHiLCL2Q/VJoKNHmnopqEVjk+hwroQfPTl82ni3pxPw=; b=ceLZRLgVk8jHQ9/M
 hohkNADPvfLT5HyhOkDJjY5LBvmfBSeuirkaFv6Tbc4CvJPP+Nm3oDz72ZploFhz
 D4jgCv7R/q9JVP69bcseYtk8xxWM6+iOkrPPOshkMW4DuranxeRQBIcsJZPXoCgI
 McA1i7uMdphKd0ZEJVJubojxy4sW0BmZQr39/l5hysITHcdqUPX4DweVebmP8NRG
 Ku5LWmow580/bCRsvY7hz1lWMd25m26z6eM4SnDbo2WOiy6Euz663dI3Nhb/fFCc
 8WM7O8ed5FsezrJ7P8CmbqBR7ggR4ZuSIFD4nndIMKRJ2T3Dk+PsuiBqTf3Zxbo4
 p+sLbw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wkj49-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 14:31:01 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-5fde8914fccso9264638137.2
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 06:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772721061; x=1773325861;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XHiLCL2Q/VJoKNHmnopqEVjk+hwroQfPTl82ni3pxPw=;
 b=iTfrg+12qc+nvSdsFzYnF7Yaq5DXld3hogfM+YV5M+kuO/7mF+1TORkoCHHBHRH8xa
 E61WRVxeXvUx6f+1kFDJ6P1CVYVmUjXvJrSuYU73Taj1/E1wLmUS4pDrkVbA9huIjiTR
 zo/9wfzgJ4Ek+Q7PLd6LSC5c3RtTKbIorhECVuTP2QZ6iP8m9T0Rq10/O6VWKQstiRyM
 HiQxuJGlkU5ovlpyrL7sRqyGKkiUJfjeEUdL3PKuSF8OqZ4W5PSxOvFPtN4FH0zP39cK
 nsJOnKA6vgaoowaXoU0ML14j8q8YW640zq59wZfKUzKFL33Veu+HSQn7SKJBzYbM3ZDt
 1uVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772721061; x=1773325861;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XHiLCL2Q/VJoKNHmnopqEVjk+hwroQfPTl82ni3pxPw=;
 b=wQGlZ3csxSd9RJjN3eyFqNo9XGokn51pxM9ItcDcMQrNq6fu7JQ947SlliHbYp+oei
 04Pg9q+LqCASEUYS8XqpjHY4Jce3PG759C5KWy3I8d8UL5TwIZgFd9Cb0VbgDjE3eJWI
 Wgd6I0I6eXQGFQbOqycOy7idw7QLJ7+SJxLkhb8BdY1/XQRNiJxBjEUEiPCBGhYU8855
 sYu9tyVYxU/H/QnAKCMWAk4JD0X/DbVKNumascVVNJS7kcCyEJbVySdw6tJzIJ49ufFR
 maztcuXdZGQVastdSLXnfKIHKeHOi4vRJMWvmBOjEaSMFxrHCX4WQeKu0+TMbSwsndNZ
 IJ2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpirQJTIinXoiB9ogwT3vdiflPtRq09xqE+IT9wxXY9RVe0EEQml9I37a89hjNT8qmrunAfQ4BPTE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAuTPYf60bsruLOtXJ08YexGLpShu13ADMu2IPxic4BgZestvS
 s/AbwCZX9pjOzCSOO40tr7wS1D3zu9OZLEq0G/STvvx4RzA6qx2PyjnHjp9KD5woeyeoPGFB2EB
 HLqxNSv7yzLc90HoqIZycZVDXJ5CDP7WI1LsXlqgxX3x3FzDHe+8hLdXpUYDM3d2hEN1RJgk=
X-Gm-Gg: ATEYQzzkRcUM57qIfTMjNECqg0xLs8u9PFp0MwnWAgMfFisCCVYe7mqakpYRRFR2BvG
 uJWHtSnrwChY0XlmJWOKgYwJAXgJ3wHiHFrqPfKK09HTC0tF2dCSSqRtL/gzTtfO+iE7bOoOHXN
 WlSRH4zTRbUi5YKTxTgQwWFd4OZ8ccORpV9XCwNRWmK+dXpZ++Zgn+JHdB6AZ3uUVQ+dJ4H7sGt
 JKqBtPw3wLky7ToGq596gqPHXI3fMGds35CIKdMArMzaeWhrkPwiDIaBzRUFstZSr5LMJ3V3Ydq
 ovYrc3IXAkw3xFwMY75EaLmEB7aXEGS2Ytia3Rj1fI/6q9674MqwbyOPSQ2oZ2iBvfEDQtXWvfY
 HxEvs7XFT+DicNnHyeLhBKyoJ/KKy30K2B4lpFjR0HNrpkesyPnriaXiw2jV5QpRQgFtTqB/7r7
 uFkQErPX6tE5BF2032fGWri+tRKoFZkAC18gc=
X-Received: by 2002:a05:6102:2913:b0:5ff:cd6e:85f3 with SMTP id
 ada2fe7eead31-5ffcd6e8968mr775545137.33.1772721061205; 
 Thu, 05 Mar 2026 06:31:01 -0800 (PST)
X-Received: by 2002:a05:6102:2913:b0:5ff:cd6e:85f3 with SMTP id
 ada2fe7eead31-5ffcd6e8968mr775509137.33.1772721060212; 
 Thu, 05 Mar 2026 06:31:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 06:30:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:48 +0200
Subject: [PATCH v4 6/9] drm/msm/dp: drop event data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-6-39c9d1fef321@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5908;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uXjrwf6kVU4yfPAvO2dRImodIsQs6Els2Ljkho09jGo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOZPMNKFcGv9m5Q3LD4Nvt36+SPyZqiRmLc3
 KrK2MAgHmSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmQAKCRCLPIo+Aiko
 1Rx7B/kBlcyEkD3uku+ktv4gegHOeY5dLhX2TnHEj2QvBgblCGeJoRfZRtGEa2bKZ5VnX/yzpJY
 SzUfiiffJEGa/UdrYDgzCBUhXp7H66bNhKzIWc4858VqdOK9UPBlZwr9mZoFVbVQbmL3qhRTHGF
 czSgR800dgvtkjmrMmYjzxABc0Yd1yPvrLC6E00bKZh+XemXl8nCXVim6mjB7aX+aVsNDRUgeTP
 CLVzbIqs3IysSyr0QXLeMJtnsDVrbxp17mi67y4WH9E0XQZuE/UYfQy7jnQ+uViJFzNz4YMAjTA
 UNFChVpyRyjlsHO6/oOp3BMBoQx2Y5/mrOJjjLXukasOVlCB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 1iyXQuBqEcDL6G5kgxdhhPu8nxHJ9oJx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfXyxdYRbwJDCEm
 YhNoFDj8tSfvmw98sCyOGbK9CO/bit/x+HxflkI2BEhFmtEBbvbU3Sud6lXwK0P9ZybUWCm93SV
 lOQNy6vwmgjXCznhhANk95YVccFqxTq1arkIrqUlGwPzdMY007MPP4Jk5WkeQeDkCRAUmvkUgO5
 lgstGK+QPhk6FCROnCvpUm/g6TYDKGPdhYPfpe0iQCCQhZb57us01JWuUm0JtF1Br0/+Lz05592
 TGpwMDsxhmm/sArS2ueHap9AXCFq3l4z+OKBSXmuo3ABbNQ8Gu8ULNakYRwT/TVToKsaI1Pe5xu
 bVjNWdWFzgN6/U9RT0v/CnXHzCMWyNpuNPSg/6L3YRhEiNOJR3aTN2ijKJbu64hlmpBWUPnUYEt
 /ILAhLeZbYwJEQKPMnK9m2k+Jax3+umPFrWvm0IxwJBE//krAS2WLIVcKad+bZp9FRl08XYpiQK
 GEyHl1pnnkCXhCMJ2Cw==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a993a5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=zd47t_UtYfsHpvN5YEcA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 1iyXQuBqEcDL6G5kgxdhhPu8nxHJ9oJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
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
X-Rspamd-Queue-Id: 2CDB0213759
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:yongxing.mou@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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

With EV_USER_NOTIFICATION gone event's data is no longer useful. Drop
it, removing also the argument from event handlers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 39 +++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 05c292e27126..bc4078c229cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -69,7 +69,6 @@ enum {
 
 struct msm_dp_event {
 	u32 event_id;
-	u32 data;
 	u32 delay;
 };
 
@@ -218,7 +217,7 @@ static struct msm_dp_display_private *dev_get_dp_display_private(struct device *
 }
 
 static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 event,
-						u32 data, u32 delay)
+			    u32 delay)
 {
 	unsigned long flag;
 	struct msm_dp_event *todo;
@@ -236,7 +235,6 @@ static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 even
 	todo = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
 	msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
 	todo->event_id = event;
-	todo->data = data;
 	todo->delay = delay;
 	wake_up(&msm_dp_priv->event_q);
 	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
@@ -576,7 +574,7 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 	return rc;
 }
 
-static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 	int ret;
@@ -602,7 +600,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	if (state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_DISCONNECTED */
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
+		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 1);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -644,7 +642,7 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 							plugged);
 }
 
-static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
@@ -706,7 +704,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	return 0;
 }
 
-static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 
@@ -724,7 +722,7 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 
 	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_CONNECTED */
-		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 1);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -1079,7 +1077,6 @@ static int hpd_event_thread(void *data)
 			todo_next = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
 			msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
 			todo_next->event_id = todo->event_id;
-			todo_next->data = todo->data;
 			todo_next->delay = todo->delay - 1;
 
 			/* clean up older event */
@@ -1105,13 +1102,13 @@ static int hpd_event_thread(void *data)
 
 		switch (todo->event_id) {
 		case EV_HPD_PLUG_INT:
-			msm_dp_hpd_plug_handle(msm_dp_priv, todo->data);
+			msm_dp_hpd_plug_handle(msm_dp_priv);
 			break;
 		case EV_HPD_UNPLUG_INT:
-			msm_dp_hpd_unplug_handle(msm_dp_priv, todo->data);
+			msm_dp_hpd_unplug_handle(msm_dp_priv);
 			break;
 		case EV_IRQ_HPD_INT:
-			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
+			msm_dp_irq_hpd_handle(msm_dp_priv);
 			break;
 		default:
 			break;
@@ -1212,19 +1209,19 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 			dp->msm_dp_display.connector_type, hpd_isr_status);
 		/* hpd related interrupts */
 		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
+			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0);
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
+			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
+			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 3);
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
 
 		ret = IRQ_HANDLED;
 	}
@@ -1649,7 +1646,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	}
 
 	if (dp->is_edp)
-		msm_dp_hpd_plug_handle(msm_dp_display, 0);
+		msm_dp_hpd_plug_handle(msm_dp_display);
 
 	mutex_lock(&msm_dp_display->event_mutex);
 	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
@@ -1721,7 +1718,7 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	if (dp->is_edp)
-		msm_dp_hpd_unplug_handle(msm_dp_display, 0);
+		msm_dp_hpd_unplug_handle(msm_dp_display);
 
 	mutex_lock(&msm_dp_display->event_mutex);
 
@@ -1843,7 +1840,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		return;
 
 	if (!msm_dp_display->link_ready && status == connector_status_connected)
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
-		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
 }

-- 
2.47.3

