Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B15AC84E1
	for <lists+freedreno@lfdr.de>; Fri, 30 May 2025 01:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E6410E247;
	Thu, 29 May 2025 23:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbZMlFDw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427FB10E78B
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 23:15:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1QuJ023990
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 23:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H2gYUU1FXEsiCULrNF5KO3iQkScCDInHxHlMYEUiimg=; b=VbZMlFDwU2tYYnKb
 uEiZxqcsXus/ZntWMn00T7ghi53tFOg4pnzuV16bQwr5oO8ug3AQhSEBEGtTSnNU
 JETQGD9hmiIObOPuU2n3V4BW0UOif4fV8nvwk4lYKvApsOFtcdGyi3UqgmP3OkQl
 T6DHmtkM9sBv2UfIix/w7VFE8GZCBF5GggyN3HMmsbLyeHn+Xe6wjonGbdTjhEEW
 DYbvkyTv906Thz1XTn+kJEgsR6prbzmGeqoArJuSfcG0VFqaPr84GpVCxiTQdxNR
 B5HB4J19utmuPKVMxAvzdKGFfZRibe8S3XL7QrNM0JzP7oHLzJgPqTwFjsjuADQm
 Aw1Npg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x8d7bvgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 23:15:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3122368d82bso1455618a91.0
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 16:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748560525; x=1749165325;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H2gYUU1FXEsiCULrNF5KO3iQkScCDInHxHlMYEUiimg=;
 b=jxJ1JWKL8lKjRiteVoRN7CXBI+AhqCZKi74bTo1/S9IeUE4w1gp4lCqIJ+bQy0jj8d
 HrTB7ePaBzZRcC2Ct3AFCKZwg7DAcBhphPCMSvflbS7ayghSnEefelwqOqd0HF1QOp1v
 qKgiWSmpaf6v9tfyA6Rf+KQBsicWX1Td6UhkvlUmFdQs9NlG+v1C8j62Aj5kVIMlBMw/
 kbPZpcHKe7t8ROuNcjgP9QeLfFli7uzss6coC7R3jh8ILuZXRFtZpX1ih37Sc34fdTP8
 BOTQLYKKZO95hjoM0CPSx/QGJRvAbxCcZJRYnOEWeN0Il7xRJuxxQGTsCm6dbwemWz1r
 g7aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7AEYQiAjVMkl8S5115HM5gaDV+TccvhyxougRgUVEzLQRgUqghqgkPENf78yBXVpyYtxFEzRlp80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGQdBSVXVV7gSaETFxzr3Lm6ntWf1OSZSG0wpF4viMfCwv8GyL
 4Nd2OKG3UAOYMeZMN57obvPrRim5D6VmhWsEV2lOU7bULbuDNDoySFfCYqdXF7Y/vQ2f80T3uGZ
 I7qmPZ/ms1/e+nQ3yKpJxHNUml2w2fw1nGjdgTRqeiRryySunJwd65xfjfSHgyoF6fTs6gZU=
X-Gm-Gg: ASbGncvK6nEywC/soF/YUMGw59rMWx1+b0egotwKR7ozlm3VJG+48TOyE/nS+398Evd
 9MjcjfKy25+uuRSs4dapEPeioQFt/TvSquXHzFvwjs8piWL2yR3BQhS6acMXBUgAQ4E+0Nnh9qh
 rmy9CKZXGdefBpIaQ2HOGPCeOfbV3GcpJHHvuqDYJ7OriHxNi5dzhvZ5//G3zOt5GK6mkDxLtIz
 cu5uJVcEE/HCjMsqIX+sbrc2F9BeAJC7VoPi7AGJuUJkaUl2yO19vh4XEvc0RpYvxVeED3lk8rF
 FCqaFkpU5LdcjmcfKg8I/lWleDImQ2pugrE/3Mm7hZaPCz4Utdg/TbHR1a/yNTprfct9KS0B
X-Received: by 2002:a17:90b:2883:b0:311:e8cc:424a with SMTP id
 98e67ed59e1d1-312415391b5mr2330072a91.14.1748560525002; 
 Thu, 29 May 2025 16:15:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBfi+6PW0/stwfIr9Ji9/hRe9cqIN1QfL9pqez/UiTuvBmsR34ao61gV2YnPGnXd7GW1DHUw==
X-Received: by 2002:a17:90b:2883:b0:311:e8cc:424a with SMTP id
 98e67ed59e1d1-312415391b5mr2330034a91.14.1748560524621; 
 Thu, 29 May 2025 16:15:24 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 16:15:24 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 29 May 2025 16:13:44 -0700
Subject: [PATCH 2/4] drm/msm/dp: Return early from atomic_enable() if
 ST_DISCONNECT_PENDING
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-hpd_display_off-v1-2-ce33bac2987c@oss.qualcomm.com>
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
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=1455;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=DKkTNWpb363qNZIlJK/dgUyyIUKi4hoMvgukVRHWsxk=;
 b=G0e1TtIX/dBusekaqwSYgj13I+GIJGnSUpuKurLZzg63+cZlKtSuWTLfX9K/Jf3SvmoD7DKSO
 TB2zvTXe8WuDZqo5wU9ZF52ZD7BofrsrfxkwWe6WFZojdVn4OZxeNAI
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: AHlxHQtBftQAjlAjsrwFZwhnKSoFGHsN
X-Proofpoint-ORIG-GUID: AHlxHQtBftQAjlAjsrwFZwhnKSoFGHsN
X-Authority-Analysis: v=2.4 cv=X8pSKHTe c=1 sm=1 tr=0 ts=6838ea8e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=-ysM04AIoonzMzE-3HQA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfXz20b6j3cnj/7
 4p7WyJmOzaCY95/3Unj2wP45O1Ttg1rp1in+1C1UEcrpzrQhGqmH/UdHMhYkGfaNyHGv4um8rpR
 vrbiSw7WsSp/wodj/Xwtee+rOUW9/FA7b9l0Ou8Th0/ZxkrVGjTbwfsC30gkDDsh2j34ZqdpBSu
 cHoiUWZYWovHbkb2+D5foLaFy5pR/peQvN74wwyFrM92kw+JIhMSnEY+PtRwko/2FvxPSsR9ueB
 v+T2ytUYIpEPDQhj3dFyLR2BwrmMv5UiLaHl8F9Kk8rA6793GVSOiuZIbf4qISOuaLgO56OZLL9
 T4+2jrqn4ggYWONg5+7+2jAd86QocOJ0XuZNudG0V4461DiecIubo9VE3ID+B5J/nFxCuHLPTpv
 wOqJALzvdNJVTEehU/mKmink3agoQXTMJQO2XLD8wh5XhColp0MergZW4COGxB8sDA2A9kNP
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

The checks in msm_dp_bridge_atomic_enable() for making sure that we are in
ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.

DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
msm_dp's atomic_check callback returns a failure if state is not
ST_MAINLINK_READY.

For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
there is an atomic_enable() without a prior atomic_disable() which once
again should not really happen.

Since it's still possible for the state machine to transition to
ST_DISCONNECT_PENDING between atomic_check() and atomic_commit(), change
this check to return early if hpd_state is ST_DISCONNECT_PENDING.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1d7cda62d5fb..f2820f06f5dc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1512,7 +1512,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	}
 
 	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
+	if (hpd_state == ST_DISCONNECT_PENDING) {
 		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}

-- 
2.49.0

