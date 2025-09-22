Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED60B93959
	for <lists+freedreno@lfdr.de>; Tue, 23 Sep 2025 01:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDA410E00E;
	Mon, 22 Sep 2025 23:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1FLgZPW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222D610E00E
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 23:34:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MHJoRl028065
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 23:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=m6ztTUa1Nhe291Dt3QY6n7
 qVtvRxyg0bpRvNd5kITc0=; b=E1FLgZPWQQqKCbHet7mgc23S2YPAxqBgIGCBo7
 F8/N7a7T7hM5JZCCHceCUCUCn1aiKp4j88BwNktkH4QSRgSImNJVq/Lh1btO32yi
 hne1s3ewJn1fmmf2lX7j9W2AoZcdKrwtw5WIv2bK8SLfK8KdR4FVajZ/BEI7xyW3
 liePs0S7WY/McEcJMSBlnh1nJTgGiHoX8dxGuKORiybg85TLFj1zuuvCBl+v4i7F
 VAKnuVvN+IZeQjBT7FnegKWgvXK9z715oG+2zU5YD77A8Wt2hfEV9okr1Tb1WGTc
 OPiyKP+ISTYladpR0urdkVEQhZB1hXgWOtpgeBSFcRVlvfoA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98egv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 23:34:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2699ebc0319so54164705ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 16:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758584046; x=1759188846;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m6ztTUa1Nhe291Dt3QY6n7qVtvRxyg0bpRvNd5kITc0=;
 b=q96ou+tZ6hxfY3YVyOGG6/rncwrBNGKXQVSCWQ41Vf6kKf19d5iytx398nIIxL7fnU
 EIGJdQUA2weDVIjWCFzMmygFeWhAx+PGTd5FFd9t2hrwNJlTO96QPpjQaDGWv3iC9sXj
 FCaWZUdEx3r7ODZ8Kcnr9yZk8+O7aREN91Erz40sInT3OhMYR3nvhKqBdrconDTcpMd6
 RPkwoxZHlAd/UQCE4shn4q2FNt6Cbgg2R3yYPVx+PgoY4pwVHoxMeKFle21boua/ffE/
 pLsm5lxabjpYB2exFXDkxesScqXStyiuUp7TZhOubw5wHyNmLMCxXtT3xMZVLrjqIb49
 xpwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm9ZT3T8xjOnYfTGHkIWHX2sF3x66NXZe4oa+lvu2OdjAIr9e6S/rmYOykRQPYMYWsStEnpiFEd24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQzRjXWicCxAi+pLc2tvFStMhmONE9NrrT3g+rxF3U37UTM6Ui
 jlGlbnHTT/kwyi4Rmie13nCrsixN1PyXzC4kSWCk/H1Nc6TFv5fGDyHuoRVCnJnrHfeHjkiSNyp
 Vf+tx3dUeIBvjkbf3XgxZnptMSHtFzGo9fpHVebeEwg04dL7OihG6sf3QXlq1N1W4a92xhpg=
X-Gm-Gg: ASbGncsSPSUn5YDTlQziIkw3ld9NrTRBNjwjtfLwrGRW8kaVW1mFLWhvsFpU3Q/vMPf
 6WQmcmleLELLC1w4pJERpsbzWXhO0L0GDoYKWCyW7LtGkkjoymnkRcN7e9s+ZZAbpfJvZWic0qB
 a9OZVQVRgNj3rjujkR3U+2y1S/Q41mZvOc7Jr658RvAgi/eePstaepHgU46AK+s0MzLXxv2EmPx
 T2pLrQK+dPlI3fSooA8zn2Ci1b6vrhhIRZTegS2ldRV+5KJp8dPePDm5slrRbUELJEVvlkb/twS
 nf0nTJqfCnoVfzD0yFPc8OhSvuP6Bpew+40YLhTdwIbg2zJoWlriGSTMokNq4JMCyDfY4gF3/GX
 6tWV+wgMsPvVmptoSyNkHmqkK
X-Received: by 2002:a17:902:d58f:b0:278:704:d6d0 with SMTP id
 d9443c01a7336-27cc41d1be3mr6027435ad.19.1758584045852; 
 Mon, 22 Sep 2025 16:34:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSbin/PIvKVcn/OXuhCk/5eExOX31UGaUEM1vyKmkyPKW8/DOkrYdu+4YvFnTtODfyJdb6Qw==
X-Received: by 2002:a17:902:d58f:b0:278:704:d6d0 with SMTP id
 d9443c01a7336-27cc41d1be3mr6027095ad.19.1758584045367; 
 Mon, 22 Sep 2025 16:34:05 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698019821dsm143706275ad.64.2025.09.22.16.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 16:34:05 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 16:32:39 -0700
Subject: [PATCH] drm/msm/dpu: Don't adjust mode clock if 3d merge is supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-modeclk-fix-v1-1-a9b8faec74f8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJbc0WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMj3dz8lNTknGzdtMwK3UQLcwNjc9MUS0szAyWgjoKiVKAw2LTo2Np
 aADo2laBdAAAA
X-Change-ID: 20250922-modeclk-fix-a870375d9960
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758584044; l=1310;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=NO6OCdz9v3Tc/Ktiqg3Wh+gypiA56gt1Z/XEzJOevmM=;
 b=FqqpcegGZLXcfSidwXQSnQCKvesciEyokTB8ipKxsrgPjY51xArxNhIg82ImuTocCxHkuuPGw
 VJFOYqL/PstDdIHfGPlZ+Z8RwhNoeEAsIRRkKI74iPOGYZqxpsIOTuW
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: k63bYuPs5IHwnq8Dw_R-KsthYBqc3lrZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX2rPuQDq5UZtR
 J/lhDzyQY1tlsZLGXJoXl4Sp+UHOZrK+JYQ5Hrg75nlmSyolU9PU6Zgd6BfcthFLA0fSQoLJ1N/
 fsQ3ohDgPkm9A8YRX+mNkE1GShuRT4TNp3T/PaTl211hc2k2cKw2pJosGP8d9LNJoVR3neZVahp
 91JBbyFBfcjMztbjn9lM5aF/llKLNHbDuPpPIIPu6k3e2SBsf9H4bRHNxOdfNCHP+PlcRmOsCTf
 3PKzvaa3qLg7v3U0FdiyhAm8AljpzdovM2JswAfY4h4W56cFO4TsxZ/2oXwTfrXJRn+r0CgHxyM
 ONJ4M2jcjigFjgRV0E1nGHoYmvlxguTISD+4+ZzlD+Vo8perWuxQ6iQ8u2wa4PfhMDiWHQNXsY5
 MwoTGTYe
X-Proofpoint-ORIG-GUID: k63bYuPs5IHwnq8Dw_R-KsthYBqc3lrZ
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d1dcef cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NBkOncM4Jvnk2V6n248A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
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

Since 3D merge allows for higher mode clocks to be supported across
multiple layer mixers, filter modes based on adjusted mode clocks
only if 3D merge isn't supported.

Reported-by: Abel Vesa <abel.vesa@linaro.org>
Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4b970a59deaf..5ac51863a189 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1549,7 +1549,8 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 	 * The given mode, adjusted for the perf clock factor, should not exceed
 	 * the max core clock rate
 	 */
-	if (dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
+	if (!dpu_kms->catalog->caps->has_3d_merge &&
+	    dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
 		return MODE_CLOCK_HIGH;
 
 	/*

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20250922-modeclk-fix-a870375d9960

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

