Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DEAB02891
	for <lists+freedreno@lfdr.de>; Sat, 12 Jul 2025 02:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B338924F;
	Sat, 12 Jul 2025 00:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6SwqmYO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B917510EAF9
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0YKBG010711
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X44+EY0MMh66SQSLKZsrsjmtnAL6ZSI0nRwBgvyoyyM=; b=Y6SwqmYODZD9Xzw5
 CWZBlVJuMXC0j8tdCk8R7xlovwGem/qAUpGMSmnMrth4Hm7/muGdF/bWLg2zK85k
 QXQ2kqyxqj/RUJM3Hsrhp8jhDF8Pgd6gBregEpR0StAqeWGCRjXu7XEB2xJYD7Uc
 GTX+Wzi8rCu2FAENHpuunGheD+fYz5nTDtlXCYm0RcNGNE7qhLfBYE806kN5KFgu
 EvD95Tlz8HFge58uUEtaXNwf9O0XlA329r5HPdmIrJuEe6k1tAG6ilg+U8Bmw3WO
 aX/m4lBeUs9Usm0S5yfC4gOS/powQ9sjWoVWjc8EiQHRzuiTW2BVZwr4tdf1utWj
 q6bF4w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbp29xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3138c50d2a0so3961370a91.2
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281927; x=1752886727;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X44+EY0MMh66SQSLKZsrsjmtnAL6ZSI0nRwBgvyoyyM=;
 b=PYYka1m385DDkD52Chih5Y+BG3MCfY6LgiBTn2v3bbSunPNDOLyPW0zMNQnlh59opI
 r21PARlXWCZAiOPonYpvBQ2FQZuOOCUiVU4Hukj+ntwTR7Bwzt5HliEN79qaceYbotGk
 uIYR1OMZ9hNZ8kNADM4LNM7sySrLLU9qEv0Vv8J6ytT+McPWUp9ZWkOwSJhbJH9vDxCD
 erqhmMuBLic8E1SS5uM8spSM+do6Oxqxm/WP0mUHPFavcpEywlVL9Pf/J4P6ff1qqwO9
 S/A8c9mPlfsf5P9FOPZyD3dJJSc/DRgSvE4ApyzUuKpmGiFPagmGlRoTh/ke0SBCyVhl
 VdNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUAje7Er+HeKXu0PXkuDUgspX3+UdY3+W3mIirHdZ2SIhUvsxCiNQxAH8/uKosv8BQHCAPNDv7iYM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDtx/1o8Lfs3wRRt5XSvHDknz7k6HVu8K80PnBkJHyPOVtVEn0
 2YfSpex7X60TT9YrkucjJlBad5nZH+QC5P/8LO/9SJzTfVbd49ca7ylidoVZ3DBXS1USgAexNdx
 mlm/TXbW/DLZFoBYwvJoTndJZOA126zzowbtB3IzyDiuAbVddnhdobuUKsypmDB+oQhbMBf0=
X-Gm-Gg: ASbGncv/ieHt0WiO7pw4BgR+Qls8DUjc1yqOWme8Ko6H6Rdhfs8q2tckCkQD8of8RGu
 61gPD93XP6z8vHjh16/JYIzXGIYc/xHPHuviuvbQqVqGSCGOjikOg96wR5/P29QHsK1mymM2/LG
 HSg1YQYo6K1pm2KUSQDAqDzF68swOgdHLCKMI3nzsGtOvfJbsCBB2/NHba9T2qq2dxeSE0UNXlW
 B4Q04R2kbrZsS9pqY6/IOhIqm85ORnolRTqqcCrJlX8nphVdmCJNhLsjKmzAvjYD7Px9e3bSp0N
 4nPhb6rDfJLlFgthJ+wERe5fc6w3fAMoV2qyolbhEN3Q8JQn/Z0GAISJGobpY2W3DEQLBJ6gi04
 8XZpmC1jWn4gfUNJhZfvZtXXN
X-Received: by 2002:a17:90b:2790:b0:312:1ae9:152b with SMTP id
 98e67ed59e1d1-31c4cd04544mr6586943a91.23.1752281927158; 
 Fri, 11 Jul 2025 17:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEoLPLd8me4X8XPt7V2tzzU0N8EU2ZNyg5wcTau9plhMwtdyz+45J7Cbb8YmssvpxzQ7F9HA==
X-Received: by 2002:a17:90b:2790:b0:312:1ae9:152b with SMTP id
 98e67ed59e1d1-31c4cd04544mr6586918a91.23.1752281926709; 
 Fri, 11 Jul 2025 17:58:46 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:46 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:18 -0700
Subject: [PATCH 13/19] drm/msm/dp: Drop ST_DISCONNECTED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-13-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=2475;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=fjQ46wtHnJ8FY9wdYiHjF2udiecElMVze21Qux1/Y+0=;
 b=a2mpv0CIxX8rOFkYRUChcCtBBnHir6lhM1QupbemCr+UDu0A66v5VkIgBVwZWzeDdtz17c5GU
 dW5pQKU6HxuDR5Yv3N1+X/l+jAuAB8B+XMOvGSDmTTpKCzIyi6hChSD
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX48oh/rwXK5Bl
 Pc1Ye3t54Bm3NGUUKyMiGw8U7RCvx98Lkvqovz4t5Q98AozgtoFWNcWaJLqp3cmCheF7P2tyJ0P
 V7UE1Ekx6CAls9Uj6TxnktXPy9l01iDKaJSS4p9yUsyKJw6/I6ky3Si/z9/pE6FETvG4zbG4WI0
 I3qn+TVWqfWUmWVIjHJhiRe00VQc7mrqanztzbVqTVIN/NiK/6UFecCcEeXYe7BRjoCBpS/VpuO
 FFqlfjz/TV0SBGEWf2q5SV6fxW27xgwBTTnp+g2dRaVhzf78h2Mkc8Xb592qQiK+yO615LtzT5r
 1M/nzrR+fUZ0SPSyROJ1W0R9q2h0t1B8mZayywJLu60thru+/YRzVYIgw/6m9LgCUy/5eZNBeT6
 JPlUvPErYVJtJBbzzk0UwytXOJ6d1fiuSS0bG+BIU8MwUej9DUU7jzYp5qh95PviV3ilG/PW
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=6871b348 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=geG2uR4XrXNgRqKXHj0A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: LfCh7B0qermps-NAQtBQ_7eJrIt6pEk7
X-Proofpoint-GUID: LfCh7B0qermps-NAQtBQ_7eJrIt6pEk7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507120005
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

Drop the now unused ST_DISCONNECTED state

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5efc8d4ecf54..dac5078a849d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -45,7 +45,6 @@ enum {
 
 /* event thread connection state */
 enum {
-	ST_DISCONNECTED,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
 };
@@ -526,8 +525,6 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 	} else {
 		if (!dp->msm_dp_display.connected) {
 			rc = msm_dp_display_process_hpd_high(dp);
-			if (rc)
-				dp->hpd_state = ST_DISCONNECTED;
 			dp->msm_dp_display.connected = true;
 		}
 	}
@@ -608,7 +605,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	ret = msm_dp_display_usbpd_configure_cb(&pdev->dev);
 	if (ret) {	/* link train failed */
-		dp->hpd_state = ST_DISCONNECTED;
 		dp->msm_dp_display.connected = false;
 		pm_runtime_put_sync(&pdev->dev);
 	}
@@ -669,12 +665,6 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	 */
 	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 
-	if (!dp->msm_dp_display.power_on) {
-		dp->hpd_state = ST_DISCONNECTED;
-	} else {
-		dp->hpd_state = ST_DISCONNECT_PENDING;
-	}
-
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
@@ -1628,7 +1618,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
-	u32 hpd_state;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1643,12 +1632,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 
 	msm_dp_display_disable(msm_dp_display);
 
-	hpd_state =  msm_dp_display->hpd_state;
-	if (hpd_state == ST_DISCONNECT_PENDING) {
-		/* completed disconnection */
-		msm_dp_display->hpd_state = ST_DISCONNECTED;
-	}
-
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 
 	pm_runtime_put_sync(&dp->pdev->dev);

-- 
2.50.1

