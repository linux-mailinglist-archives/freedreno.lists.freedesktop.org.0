Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F061B02882
	for <lists+freedreno@lfdr.de>; Sat, 12 Jul 2025 02:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE66510EB04;
	Sat, 12 Jul 2025 00:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxbK+gQ3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7848910EB02
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:37 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BMTxAn024123
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ztg4BCYx+5l4ffFBXcfolxY/m0CGJMjBeYa+I+72rCQ=; b=ZxbK+gQ3o7Lg9I6o
 tW32UyfO1cE7hcJZNK52s6E4qCyyLXtZD3NlGUJWVHJIqQzMaW+zR5FJDYshzoZG
 WGfyr4GJr+7DGenQlUAyffo2YMu+unknAwcPrtgoYskZ4CNKf1r7C1GsuAAozurz
 7UCHEyr26QK04gctvrweQeOMfyvTd6BFhYHdyzdvTZv9jVVQJftY5txVtGa6H3Di
 kbP7XhYsakcEgOE4sgWQyqqXgKz1WKitp1dXXxOhcKfuqlJq6dJsxUSpmaUM+d1r
 gv1bs5iry7WxdWuTv66MZ6UW8B2+sOimH1zxdHYGAyK7spoS+/3qUJeMuRkHmxSr
 Vu5yxw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf345x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-31366819969so2729679a91.0
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281916; x=1752886716;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ztg4BCYx+5l4ffFBXcfolxY/m0CGJMjBeYa+I+72rCQ=;
 b=SIPqavOTWb9GqGMqjTrUFc0/Jb8z5MQDqyI1I6EH/EZoLek538sRXcW+VPPna0KNN4
 ezkM6C9aFvgVMrvIWuZ8MUT8TZP4eYFcS6FiAszhJo+6b4brjJMCOo3IWuOYMEYpUmTK
 6AzcwtUqDttfd/0wp3YZUvFrbaaU/35uKpMwvQ0/KFSKpOTP7iGKM/4PCqZZM5ehI2Tk
 UX+AnblGdqanIkOlroLUdxBvg1Otqtc54mD6c4WafzW1xGSbQrAIbPJb+vq9MdG6mgh9
 +89dDpXVBrRh3kGhgml6RCV4WMdXyHGy1CV3QSHW8b5uvGvk1dxKxoKctQJQsNbMgAah
 60NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNtD55NKwPC/UDrpjCZCvfJ5AmPtxW3SHsGoW7LoAF5oimYAqhiNlCr0hqxFfIwqmFQv/r8fohbLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/VBkf4aKSmdop1jv8TbIfi3rghyrjcLdgjxb4Ty//C1L5c9dz
 rfUl1IvdCCFbNnm+NpYI8lKatKeR9Mx2ipYpIjpDVXoUBZg1W0B+aJzEChF468NZseJFBjjOF/I
 kjISAz1TOg3OLp9GPlwtHbsEyHp3rQ/YMUFNfEVV4ch8m8Ha21VTbCylUICl52H/Pt915EZc=
X-Gm-Gg: ASbGncsRaXpCZHMBa4I9Dc8ZLeVY8+eYh064Hd02nlQrLP00tkNY+VPl0nvqpurQbt5
 EARBlpr1IxYfo4tPpYnaFYmpb8ELZZpYjkje8yZJwqD41U763mVPmJpwkbv3gr+66AHpyW6qITX
 wNEzXRFG4wcHpsH0dJx54UqHnS8qCI4sTlD0r1NR0hoZhBJsvhWpV2ve61QgM30lcASB7nhJfC/
 55GTrx2pPE772kJGwNFVHBKxwDOV8nNBdmZUHh7O8deKlvQiUzUN82qypGdTWRPr+2jkda8gcjg
 8r2bvzc9MmoG4AP1ZxlKLbsswgsHAvOAPaGbDhRy53tCKY7T1JRM4BzHWBWL7gDDy9usAY6o9zm
 IOMaKPXVwbncgRb0dKw+28f/e
X-Received: by 2002:a17:90b:4b8d:b0:313:b1a:3939 with SMTP id
 98e67ed59e1d1-31c50da140amr6038215a91.15.1752281916044; 
 Fri, 11 Jul 2025 17:58:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYEyWKARo/kBpo3bdZrLz9C/cBJUuLVhrx+I5Awn+rzHrHkONY97ZQteD6SKGI0oaeUyzVHQ==
X-Received: by 2002:a17:90b:4b8d:b0:313:b1a:3939 with SMTP id
 98e67ed59e1d1-31c50da140amr6038183a91.15.1752281915603; 
 Fri, 11 Jul 2025 17:58:35 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:35 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:11 -0700
Subject: [PATCH 06/19] drm/msm/dp: Replace ST_DISCONNECTED with checks for
 connected
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-6-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1974;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=48wdgPtyNZwMd6sZV3ZvvtvNWOvHLwkNGaRnCDc5QMk=;
 b=dzPxfM43mTJa1032ZbcABoClTN8ieb2y7bh9ZE8auswDZJG9PPyvhrjmKx0NoQMg2/vNJ1lx6
 b1y9e7Ioc0RC8W5E2bRm2Avg76t5A142aCXiryZaYeU+RfQsDfZp+6v
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX2NqBt75YfvnD
 fhmqxTcFMqjOmB5UwqbbEX6M1XEWt9hjtCBVYNqSqeY02aPfWw5jLjmGw2hXP+nLZAE7c/qQf1G
 L3yaiMV1Ssk18bOUTZcKaR+8bl2dVqFpDU1o6bXcqL6lNX4X8nSfHXfdbQubxlehxEbQ0auzGID
 9CdFseVpqYRwd+Qt1yGewLxmJV4274ZfYAhZ7fv3GvBAQjldVsmZcGYC62SVFmvcJMadmvPYHcv
 UQzPKZcBdGxklhMuEIhCdL82ZEY1LX1QBiNl3mWrd/QQ8weFxMO9/Dns/rjPTg+aOLTfZbQNKTO
 jRXTPCkxyvJcIQPop7w5azgs2yD9UjVOlijXbTUgizT3CNIe5WY39tdJ2TL4XvH1x0sfyz9ueLS
 BCDfpiFldJpybS2mZMNfdl4QnfNQWspaUqqXvEnu4eYYfdDXLllm7v8IHmudGXYl3Nnnsima
X-Proofpoint-GUID: hj7xIMJVWg2FSHPO8RSfkV3vpVHkMv56
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=6871b33d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=iO33u3U-fp8Dsq_J1c8A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: hj7xIMJVWg2FSHPO8RSfkV3vpVHkMv56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=949 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005
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

Replace ST_DISCONNECTED checks with checks for if !msm_dp::connected as
they both represent the DP cable being disconnected

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index af3cc32aa123..0f1c1fd2b1b7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -521,12 +521,12 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 
 	if (drm_dp_is_branch(dp->panel->dpcd) && dp->link->sink_count == 0) {
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
-		if (dp->hpd_state != ST_DISCONNECTED) {
+		if (dp->msm_dp_display.connected) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
 			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 		}
 	} else {
-		if (dp->hpd_state == ST_DISCONNECTED) {
+		if (!dp->msm_dp_display.connected) {
 			dp->hpd_state = ST_MAINLINK_READY;
 			rc = msm_dp_display_process_hpd_high(dp);
 			if (rc)
@@ -543,7 +543,7 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 	u32 sink_request = dp->link->sink_request;
 
 	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
-	if (dp->hpd_state == ST_DISCONNECTED) {
+	if (!dp->msm_dp_display.connected) {
 		if (sink_request & DP_LINK_STATUS_UPDATED) {
 			drm_dbg_dp(dp->drm_dev, "Disconnected sink_request: %d\n",
 							sink_request);
@@ -666,7 +666,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	/* unplugged, no more irq_hpd handle */
 	msm_dp_del_event(dp, EV_IRQ_HPD_INT);
 
-	if (state == ST_DISCONNECTED) {
+	if (!dp->msm_dp_display.connected) {
 		/* triggered by irq_hdp with sink_count = 0 */
 		if (dp->link->sink_count == 0) {
 			msm_dp_display_host_phy_exit(dp);

-- 
2.50.1

