Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B024D22D1E
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 08:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6447510E6C1;
	Thu, 15 Jan 2026 07:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7zNLmwI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjHRIJxV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CF910E6CD
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:26 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6gLYB1745958
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XLSj/TWpVJxmGvdBCFFcBev9pg9q/iSGm2XdYaBUr2g=; b=N7zNLmwI7Cx41IjL
 n4cg7c19upZ6A9n0FvqXM7ZeALZiZIbAMs70a6vmu0z+pmfzkzi9kkdINaoXdB3z
 Qrd56b812WU0dk/00fOC//E7K+v6Cx+04Sz3PNuW17OGbTvkf/dCxIW+tAr6kpnB
 1K8LLUNdzYML5uaaAJXKG9OLd+PzOaUcZ0qNAqSLXA88FVv59hTvPsBRMPTf9eJg
 ld8c138fb8vKAyMFNggMXTTJZLJNVfaULE6cO9Yf94CDidcpuy7D3KbrOB5WZ8G6
 h1XiZwTU16GeALjej/z+qy3FvovXaC8OU6YvA6GEUyXi+Tx7OTWP9SFjGdE2tgkz
 yV+AiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2g6ac-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8bb9f029f31so190287985a.2
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 23:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768462165; x=1769066965;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XLSj/TWpVJxmGvdBCFFcBev9pg9q/iSGm2XdYaBUr2g=;
 b=kjHRIJxVBJpYhBoZ1Uz2fBfmz4TAoCSuEESXJA5sBS9kYvGrLVHnGfTh/oh4ZxahWC
 ujk4r2jgKN/ItQ+mO9cgu3ETFh3iyxpatdLxxbX6jAPdm9nGct+y4elzUQdYOOAmzhti
 /R23wv+7aNFkmhy7cRY60+lldb9a6ISHhPUzT8d9NNtP4G2j7pjbbA+6ETZBY0kWrDyK
 qoaJ2kPfcyt8KddjYjJHY3AHqVrmVXm3hgH1xPCdCK1awjb8Y1Ky9IDzqVdDOjwE3xvt
 VxAty8UkB/RiOlP9TtZ9d+gADhCm4lzcOJrk7H28/xKcNzTs5HbLtUK/u1xTYL+Xo3l9
 Cxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768462165; x=1769066965;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XLSj/TWpVJxmGvdBCFFcBev9pg9q/iSGm2XdYaBUr2g=;
 b=OZXuVEGvao5YYiksWRzHBdklm8Aa3fD7rwfihoDMsTmDCCzRuv1kiRuDRC1lO9C8zW
 wcrhzn2bcaIKZc9cuscvbLz1Xkcy4SpYhbAXpK9Y28ec9/7yG/fBYYbx6nsZLg6HGP+r
 7hUZrKj8i4Vts1qJp1G9RCM9ZHlLVB/m2zHvL47UAiPl8eid7V4A0lwQMMAcMZSMuTTZ
 1oKzLfbOwQJ7KiAqyS5zslWXHUuNRLsFx6HB4DrhknsGxr3iDgmrpdw+taQdyX/dASr0
 nAS7m3BdLI3vojQ1OBcY+WB7QcZOlJGJnOzSZGF1v6LcX4OThFD5RcpNf4U4MyJfsq/E
 7BSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/k5lzVN89qHW6MdSI3zqR1MvcNnOgOgLsnVOUmVRBBojPtRLyHmwBwVsRO/R+z98K7HaC1OifSc8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTedT6qSV5fnxOOPGtetIgHYMTBfQhyMA2M8FJZRKimoUsbgN3
 6LNPAiGDASSNyXmJQMimztPIjYVFCBDcNGe4K/zhTMGzTRm90DTW6+UUukNxS9YDwdgNQ82eyTn
 F45mQTpPMEup5zJbsQp4aP/t4+s8PEzNr9POjeD6cBikpOfoSrimK/OEBkvGCCNNGF7uouo0=
X-Gm-Gg: AY/fxX43XdC9ZpItgoXTy9P04VvdzqEN1Ti+hvbhFbGrINL7p5XRcI3k1q6+19qKdmq
 x3+V2UAgDWk4KPQAGnfVM9E9+8n+LpRC6dw1e7xCt5gXDHOHEE6Ym1MZHPOJOIeoZRTT8BhDllf
 zoi257YFP0EeYBGrh+ne3Xk3Rhfx6TjZh8PioSEBmeJW6pNkhGhLzxFYjAnvhlfbm8Zo+3NG2h1
 bBovn+/Fq/NmaCnkYtUkmbXOYiot3s58k4+gsGMEDoG8D9pYYuzXhcAFV165VOMXsdbq+qajQ0K
 ZqZVfDnw/aplpeJFSIWnDFSAy/P4kA+aZHWlosdJ7603vPh6U5XoxxjPKeuf3wIzRW+eMHIB8tk
 3heP9IzdtU1Q8y/pYSQDqUpSZTVDaCTX6Xe4WuQVv+pcItGP7dirXBJkkLcQrqss4lcYZaRbNX+
 fU2DlVnWBHcIdmvbn6kIZ1r00=
X-Received: by 2002:a05:620a:8a84:b0:8c5:33bf:524f with SMTP id
 af79cd13be357-8c533bf5487mr387330185a.59.1768462165002; 
 Wed, 14 Jan 2026 23:29:25 -0800 (PST)
X-Received: by 2002:a05:620a:8a84:b0:8c5:33bf:524f with SMTP id
 af79cd13be357-8c533bf5487mr387328685a.59.1768462164573; 
 Wed, 14 Jan 2026 23:29:24 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 23:29:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:11 +0200
Subject: [PATCH v3 6/8] drm/msm/dp: drop event data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-6-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5908;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZtwLsg6p0b8AfSzbDB138yGAcIa8HoM5WjV12Fcz6EQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaJdDlEGZrfhfWSXwbEfq2QgFK1z+KIppQqfx1
 RD1Hou6Sf2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWiXQwAKCRCLPIo+Aiko
 1SU8B/97FtUsLseqjWjW6wU6ORL+a7MT0QOnljI3PsP3jprvkuXxu5bRHWzDrPS5h/I/gu/YSQO
 hLKjbJkE9tdfuQJ23itEvzdVDiKUZNv5lJm5JeF9CHmCPv2TKTOKO1sZPli8FdL/GfP00aBK1kJ
 wx2u9qmnDE078vg9HUBdGNxBqYEszXLMaeDqDQgk+wKgzOTjCdRNZ+908SiwZmj5SmFcqoBgzgn
 V2XTzKI9xqxq7zigBeyaJSeWqiyGe6URL/1CknXDKw6IAVPpkZsX9cLJpcUD6WH18qdV37ifO9N
 zAkPtRR3rngLh5Yy8GLBbHnAS96JvyxHEiQVb0QryuPskR1+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfX6OR7pN/ixcE1
 HTIi+NfCFCJyyPgc8epeh77+7/1tqjZ5kJFsTp9zQl3QvuJVKYK3LBtMByGpc7PnqiJhrhUV8BA
 +Mca+qV4UXEBa0hfRmjfNX+34bMa1iE5zmX3+Rdef9g8eJU1CsE+0Fv3WVUOO0nydi8nUXg25a9
 +ITSRoaJBO3IIHrRJJkSh4z+7S8csrCjelmko3XXW1cxiUVQXgaPPkcb7yuHrpQtG8J3X6a+JUX
 /6/P/TfltU9D8bZdvu19aAxFlr3J3J9hnArHKvdDS6NI7lCUt354ZRs24wtQgqjpe5eh0Fu21MP
 QzzCp5CIICD3DOI+RIYKJ8jlEm4MJDhT/dQAZA9V5JyYSQNrvCClv3ZNuJKYQXupLrLDb2OIX0w
 n4kMrnbyd65Ass3bO+R9moBdgJx13s/iOvdyuP/IkLgtzuq5SV/v1XoMhg7RKEzqllSLiKYo7Z8
 ET1R53FLAxkd/u7VagQ==
X-Proofpoint-ORIG-GUID: 2eiBCjHvYWKrjQ6QTFZxAZOp6CtO98ZP
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=69689755 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zd47t_UtYfsHpvN5YEcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 2eiBCjHvYWKrjQ6QTFZxAZOp6CtO98ZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049
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

With EV_USER_NOTIFICATION gone event's data is no longer useful. Drop
it, removing also the argument from event handlers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 39 +++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e0b424ac861a..e93de362dd39 100644
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
@@ -1722,7 +1719,7 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	if (dp->is_edp)
-		msm_dp_hpd_unplug_handle(msm_dp_display, 0);
+		msm_dp_hpd_unplug_handle(msm_dp_display);
 
 	mutex_lock(&msm_dp_display->event_mutex);
 
@@ -1844,7 +1841,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
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

