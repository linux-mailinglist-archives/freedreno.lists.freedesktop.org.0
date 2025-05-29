Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763ABAC84E7
	for <lists+freedreno@lfdr.de>; Fri, 30 May 2025 01:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE3E10E780;
	Thu, 29 May 2025 23:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlWWlbeb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A5910E79F
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 23:15:29 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1wtO025196
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 23:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4vbVMjvU68KSE4FGI+lKVINOGIspYhFfmjickrGZhQg=; b=WlWWlbebHQXU7IaB
 t02zhGKFXbemRqNf/kw0uIQ2ao2KMbVnBK4Vp0zi47WsA4reWndY8e7xqQ1hojRB
 J+qGJNVIKrXM6i05AmGI5qhB2FhX27TRfxaoDjqrfZEwOg4LXY/NPfyVxIgfRMYF
 HqW7vcJgbKLWqj4jhP87dYB+Ztkmk4edDm/NOqrWZJqlzS0/ZGj0wzJF9O/5Nz37
 hMYt2VK5NyXch9g8NMglhWP9YjGQdW/KatJnJ6fZPXkz1UZO2Jr5/dx9I8+PxxKE
 zL6nFpON9riyWpNQMTmq1NwpwQEVQ+8v/or1p7451QCXHI6xxJ5GvbEthnxk46ZC
 YJ8sUw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x8d7bvh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 23:15:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-31226d9d604so743010a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 16:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748560528; x=1749165328;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4vbVMjvU68KSE4FGI+lKVINOGIspYhFfmjickrGZhQg=;
 b=j3zj4QVme/Ny69P30rzDMx6a7++5dANKTlMwDR9uTSCSHyvfoDwEs0FhbOmPL6XgTD
 hWWYxlTboeyiSXRTBl/Xo0omXWbNsbwpohIzWkFNNvdUbhZCd5la8NPAmM+zn4RqwPYO
 ljeddgEbVVTxFIgs0ZnG9cZPRR8TDwVcO3Ivr2w+EISZFrOzwVBI+R0u6aeEtF3ISmji
 5OIgG9VZVcjHvAz6sdINnFs6URAEjoOm7CyGn8SaTz2T7NJJllEPLCjn+zboZhU4IQA4
 BFUMMpJIE/yLZ7iqUfRyqhS0XWhwD+HJEefWxLz6yjCee0Su6XiqaHXuy43lj+HAE539
 W4ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFiAhG0kcTwG+IshPxhx4VSqTz8tg+GjAvUZOAwP3i1b/RqN1yEn8ulmmJj4qBiHkrF9V2z50o2ig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf4VAmGoXGogJfPQkO53IPsgr9e7NN+Y3g9JQwyBwV+yxDHmex
 TW6Tkb5b0Thysg2Sx3p19UqRKh6os5ojKQJwIH5hDoWWFy/uGDYWHob0j/BAucTR6OQzmA8xT9S
 PdXRC8bpHZXb1Qt8AhrDGve8Zq+iWnNAmhqPJ42oxAagRJE3Hke/PtyEdAnXvwlp1bSwVB6U=
X-Gm-Gg: ASbGncvihd9TXxwCQ9LEz6b937pg1d88e/alzLsO5kilzgw3mEJEktJxtnErwHpVC1w
 1txxeN1KRZCHjqG87Tr1wg70xs46zBYbES99JLrUAXkveIqSu47C7KLKQjUxTKS0MkqSFDvA1fY
 iBPD4w1iszwxmfzDMHGTLxDlSHgtZxoiMQRmXriFwr+TYQzAytcTS2rP/ckGZ/pG7oY5jJyUU3J
 vbaMIt+y2c8POZCai2+duAYRtMpc5NouhHT9QM55JaZQSaAZhHer6+zaDv72XNrWCaKMmnZnR/B
 AHG0er6z9IXr4QnZH23rBWb4o1KagaxWRCOFReCfEln6jHPOivoGLMBASB1JR9H55qGz4rtm
X-Received: by 2002:a17:90b:47:b0:30e:6a9d:d787 with SMTP id
 98e67ed59e1d1-31241532ec2mr2226128a91.11.1748560527842; 
 Thu, 29 May 2025 16:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKS8hP5QDpmvy9MOsu098RPR9jWdEHOkxDAW+2Xf6gU153iGKt6qoNGu8DVdUnTocC11rWTQ==
X-Received: by 2002:a17:90b:47:b0:30e:6a9d:d787 with SMTP id
 98e67ed59e1d1-31241532ec2mr2226080a91.11.1748560527405; 
 Thu, 29 May 2025 16:15:27 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 16:15:27 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 29 May 2025 16:13:46 -0700
Subject: [PATCH 4/4] drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-hpd_display_off-v1-4-ce33bac2987c@oss.qualcomm.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
In-Reply-To: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=1865;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=LQos15gYFKCo04VJZ/As3557mLEuaumxqfi0RxOfo5Y=;
 b=ZyMmKPBhU5YA6EHWCvynOwpmKVsv3ib05zmarBy/e1MwPCLCy3gRO0/VTzFbpLW+pORd1zhqW
 Qr5/lo9J/i2Ci3LD8bTC68qtF6PkoPKgqziVkownWvT+mt52PpUs1pg
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: Paw7qnc_0hCKg1sjJddvNR6DFbDquzLn
X-Proofpoint-ORIG-GUID: Paw7qnc_0hCKg1sjJddvNR6DFbDquzLn
X-Authority-Analysis: v=2.4 cv=X8pSKHTe c=1 sm=1 tr=0 ts=6838ea91 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=zUghIR52pHC5fQqyx9gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfX+glUhshu1f5j
 bvUmPMSGeKbOJMrm0iJ3O5ze89YsLvIZml3JBH0Iy7nMUf4Z7KipXCgNA3SJvXW1I05aVruANBw
 D7kewKKwhWHs/tFgN62BIFw8DXW+cDEBRNsVt+jDPR5JKGEftfYe1ezJTTpvaKEzlARGUhrhxjt
 T11eFsIsSOBohtYuM0L+Ohir19aRbsLh7E2NAPfQKLrV4BtDJ2EcB4LAljtcyauvXzBY1ukjLIk
 AJzIZEYoKEsgL9dFs0Q5p8WPrioI+bJOHgFxhzdSn+wbeBANMLYe9Pwv+T6aZub8TaHyECAL7kI
 NPPo6Uxf8QiLFTlNXVzljow3kndwrd6EZePHxPCAaA3CUTaE7olj6cV8sFz/3irLwkuMoZN6NQ3
 9BIQA1T2ZjrQRTRkovIjBVzEA5ySWU9WIqM+lAunSihqfKss9vtWT82GnTEMUq8sbLaWIyCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290227
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

ST_DISPLAY_OFF check in msm_dp_bridge_atomic_enable() is used to check
that if the display was disabled while still hotplugged, phy needs
to be re-initialized. This can be replaced with a different check as
it just means the hpd_state was still ST_CONNECTED but without display
being powered on. Replace the ST_DISPLAY_OFF check with a combination
of connected and power_on checks.

Since all consumers of ST_DISPLAY_OFF have now been removed,
drop ST_DISPLAY_OFF from the list of hpd_states as technically
this was never a 'hpd' state anyway.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 785c813d2b31..6f05a939ce9e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -50,7 +50,6 @@ enum {
 	ST_MAINLINK_READY,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
-	ST_DISPLAY_OFF,
 };
 
 enum {
@@ -1526,7 +1525,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 
 	hpd_state =  msm_dp_display->hpd_state;
 
-	if (hpd_state == ST_DISPLAY_OFF) {
+	if (hpd_state == ST_CONNECTED && !dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}
@@ -1584,8 +1583,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (hpd_state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
 		msm_dp_display->hpd_state = ST_DISCONNECTED;
-	} else {
-		msm_dp_display->hpd_state = ST_DISPLAY_OFF;
 	}
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);

-- 
2.49.0

