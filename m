Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551D3B3433A
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD9D10E4B0;
	Mon, 25 Aug 2025 14:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hn7sQ+IW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8694F10E4D6
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:03 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8wH59026320
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rAhM4RTVeSeD/Y6Dbpn0SMNYvVqhAEKxN2xxqLLpF3U=; b=hn7sQ+IWfBj2jg8E
 HMgZxSbjSW88vsHP6pfIWCVgFSP6ELlszyyLF6DAzUxZNXSLxIoxSu/X7QHEd9cj
 S6Xedbwbe3aMAKRqBBcM7gGTnb2fvNul/w4iDGd+/icl/7TA+bf1ZOFfJ426B6xz
 D3IbU0jwHyneq+sgJyF6GHUAnCEo2WQzRonngsZTSEeG9rbUbW0/31d4MmH9y+uF
 aWkoVuT3X58zGlOm85m0GCeK+OQN05aiDj/6oy3w2wqfnTx+SnAy2O3/ugQr3DaC
 Uv7rbphZshuRd87s88YVgwRzQ0HzauZQwLrjB6inOhivHZbQHjSRu2WsrztkxgAd
 lhUdzw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de5dqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-770562b1ed3so2549086b3a.2
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131542; x=1756736342;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rAhM4RTVeSeD/Y6Dbpn0SMNYvVqhAEKxN2xxqLLpF3U=;
 b=Tf91iRu6Rq0jp5RFAw1EnUAoejxqg81zz/zzZrvnAA1Po4dOjCE2/LBGMkb15gHn0G
 87nJDi7AerxWObdOOjp98rYmobir779bZ7c6AxsS+CYsAw5FpVIT/lRlvTm5idLC3Alb
 s3oASqo4fR0hUjOABZL4pt88go0kMTa5HtRx/q4AiKqBIHdVQXBnH1NOOSL2LhfURlt2
 UOLHiSL+O4ZlhhKRfjYmq3lw3+zluFIJEM2VIMXCt3CnZQ4H7hLUlAnS3FpEaso1tI0Y
 WdQCdXGWU0t6asFgeTj0Cisayrr8vY/6545C+Id7gCLdeqwwkSUfbPhIzZdmi8ZgC415
 zGlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwIpliD4YT12dNayrjFMvJdEq28Bft5n/HzDqrRKKigizL4H68FJSC/fIeRSoHaO29lj3SGn8yF1g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpD4FhRLJuheL/bsPKF6wFc6EZ69D+wGA7HJuqaRYiVPG7uZ/J
 0lxj72qfrz2e+7aWU9/gfzS83O1ekazooQPb5Ud4RZCaq4F5D1e4NlB+whl4AOPESS+U6cuox5l
 XkRdkjFJVvTjj2uZpTCpvtK/hfMvMBehtDqeJr/Kz0sIX7w/51pXjGYEjb2kekk989x31ahk=
X-Gm-Gg: ASbGncu3Y72NBJ71qZNfXfT4h+4cTAiX65dAhIgSY+pQ4eM0IBbNN94MLJM8WzXxLqN
 IgMoRj1QdbtIheiVPdmfHkk9ToLaa/YQVuIJjxpOjx9CbS1PQLxRgv/teuCgegsD9JqhA9TTeBM
 AmMuvNnjp+sjI625WHSNcZ2anR18mSxNmYJmMd21xNxqyZNNPn3tEba8tNho8a5EEQvKmHoW1h6
 yTwtfvUMSDPT8F/Endk9APe7NR3Bsc6ttb8qx2WiU4DWZayKLYoQnQV5QDKXHaM4cfRs8r1FRN9
 LiOMoyPLUOkiIoYAf8Ho3snCLQ92CKuTb2S4uKenNfARMc3fPTG9vQTEVIXhSNmxoXKYkhc=
X-Received: by 2002:a05:6a00:a94:b0:749:bb6:3a8e with SMTP id
 d2e1a72fcca58-7702f9df069mr13576456b3a.1.1756131542156; 
 Mon, 25 Aug 2025 07:19:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSPY1HtSJ8tKKojzOATDlJlkBa+IcBpDR1Y1au0tLWU6lqQsO/HxxDw/4m60LXZ6fiBBdK9A==
X-Received: by 2002:a05:6a00:a94:b0:749:bb6:3a8e with SMTP id
 d2e1a72fcca58-7702f9df069mr13576414b3a.1.1756131541613; 
 Mon, 25 Aug 2025 07:19:01 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:01 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:13 +0800
Subject: [PATCH v3 27/38] drm/msm/dp: add dp_display_get_panel() to
 initialize DP panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-27-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131423; l=2282;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=TSQ0bYxvwSdSGTKkoBYhDKBWe3uInELiHmXnk72zRV4=;
 b=duMBgo0ElFERIwAsvUqi6eTSil8TrCpytGdMUtwvdCYzvbKFkhAt8aEGrEl9QJIdII6AXu1ut
 3dsERUkZHWDCiDyny5YNcGzsI0szfwwtzR8XmZ/2ISS4ozrDZKG7WH4
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfXxV+x1mHUgYnX
 MkVi/v0d9M9RLreiD/pYxts1VWjgc+TDU4zTtTCh+zPw6V6NeAFu6HoTm+TB/rptqm1ay9cxauY
 pjdBET7/46zyiKhZfpJdAtZqVoTzjoCi3zLehI8DpsXy/uyFZPA1yJsfOQi9KsZR5R/oBvi2IM9
 TzIZzV3Je7oPiBNFI+wh9LCSN1gbr03+2n50YcdWoqi9BztA9bIT6MIcMuz4OjIaV9aX1kPE0ba
 SQQsPWb7IXpPYTJis4maklzx4pQXSM8OWw7psKU9Qsvwrl+D46QfEoOzResWDbTNUpOOGOC8yzJ
 QrmBhe1DGNeEDFGQ3Ev14zSmA4RL4Vjoybclz18LfLILAHaHYm+nixZ41Mx5qmvXSb81TJquYbd
 ZjtRFg+h
X-Proofpoint-ORIG-GUID: rWxLv3AO77qgEuKrK0kENI74mKSmCQdO
X-Proofpoint-GUID: rWxLv3AO77qgEuKrK0kENI74mKSmCQdO
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68ac70d7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=6cFZRJIsygQ8aEszaMkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037
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

Add an API dp_display_get_panel() to initialize and return a DP
panel to be used by DP MST module. Since some of the fields of
DP panel are private, dp_display module needs to initialize these
parts and return the panel back.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 84df34306fb557341bea288ea8c13b0c81b11919..abcab3ed43b6da5ef898355cf9b7561cd9fe0404 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -632,6 +632,29 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 	return 0;
 }
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+	struct msm_dp_panel *dp_panel;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
+			       dp->link_base, dp->mst2link_base, dp->mst3link_base,
+			       dp->pixel_base);
+
+	if (IS_ERR(dp->panel)) {
+		DRM_ERROR("failed to initialize panel\n");
+		return NULL;
+	}
+
+	memcpy(dp_panel->dpcd, dp->panel->dpcd, DP_RECEIVER_CAP_SIZE);
+	memcpy(&dp_panel->link_info, &dp->panel->link_info,
+	       sizeof(dp->panel->link_info));
+
+	return dp_panel;
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index b1ea027438d952c94f3ae80725c92e46c631bdb2..d5889b801d190b6f33b180ead898c1e4ebcbf8f3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -65,4 +65,6 @@ void msm_dp_display_unprepare(struct msm_dp *dp);
 
 int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp_display);
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display);
+
 #endif /* _DP_DISPLAY_H_ */

-- 
2.34.1

