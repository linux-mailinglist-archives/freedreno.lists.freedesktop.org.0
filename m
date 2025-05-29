Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0CDAC84DD
	for <lists+freedreno@lfdr.de>; Fri, 30 May 2025 01:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8854310E1A4;
	Thu, 29 May 2025 23:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZcHQc3rv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1769F10E767
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 23:15:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1tMN030819
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 23:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 w9T6LjH71u9zQzlGudP+qBcjCF5Cn/3FIBo8ObljvB4=; b=ZcHQc3rvA7phTslz
 WQBad+h15HW1V9ljZeSKT6KzIE0xo4633oqLhZPzdLJbRnPtnfw5qc5BLc6cawzt
 5CxoqKAvxiSZU7dEoULAmD0ohmR31RfZwo3Y1dNauszmHoGIsOFylGhJxGovR0pE
 41Ryfa4f1DtYM7TDDkSWCppkuPUenm3nQWr+tc5FlwGp1lrVv0SkfyDs8RGI96ik
 avhGIhnNCOwFxV1fGXy1M4pL6ddHcKKHhed9QCvhQ1ha6UB1Oeq0c5Ly7H27Dmc/
 AKxCcjk3HdYUjZ7jcPMSuCARjusr0B7oMCdgi+vkR/8antwimGlXAKx807SHbSyI
 L5Glcw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x6xcc4s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 23:15:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b0f807421c9so953938a12.0
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 16:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748560523; x=1749165323;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w9T6LjH71u9zQzlGudP+qBcjCF5Cn/3FIBo8ObljvB4=;
 b=ZQp029yeB2W31UwL7sza6rhgE2afM6gbVzAZqOl+YUf37fdBY+LKGmRPxwpWl4ZfKN
 P+uqJtNWUFwB0So4bOnq8M93KVO9lVOT4L8tvLKMsxLfMZfNNcGYGDUEjmSLnuynv2uj
 rXdtSJPTpgP1fOdCnbGeDFswlza2RoToGRUkclmUNU0v67ditZTKRExJ1oAbJgFZ0GZe
 C+sOlnxsQBhFs3IpM3jKKRpFlEUg0BUXY5xVgxhnfLy6HizKJKvpmw4I9WebfiuFCfmM
 kDElYCe02UXw2vLlcmzwhWNr/4UZ7d+dkI0AuZiKof0WfKLOxHvecQgtK/XYaHGWCkMq
 UuXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNmlid23tdOe2tTxQD+5lHhOH9i2kmj+nXwF6qMjEG2sBEkg81hG37oz2BXiwWB08XNq1krvFkjqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1McZaCzph2sj6nLBRCylPD3iWIw14g25BSrPruw6JczqvtGGJ
 0q+GiSA1j8/MaqBR79GV3cJbgPokil9eIFqi6TdcxJX25nYPURwC6so2GkJpaKQ+KLHL2IsdrTi
 qb28UoYvn0j9ET+X3HeGpwAySgwqpDULD+ZncQ77FkFcyfH+plwJ8RQyGOZazeDTm76D7J20=
X-Gm-Gg: ASbGnctTVdZ7RP7ilMYZ5Uka7iURULg6cmnkJSpLy31UwI8tQuYR989wDSqlxLQe0m3
 d+e9sOcAo7veP6hf/PMTjcndJchmb1cRNbvb4Ea0zJ82CGAQt2igL64rKyfVmxCtx2CspV6wjai
 7IYoIzXwVW+99aGf04GYAX6P9o1MWy5v2yv9s01O+YTVQYJIedx70fpF1Dp3HQrgSrAxuII6UcL
 gvZteWVUYFr+FYmQap7XOeTK6BD6GKCFNefEMav3Wh3TF4zB5vQBfpYNaBI2gN0ACdQU99yUIC7
 bWDOq7v28vmho45MVY9jd51he9H8HtZ7YW9vI0vK+S7YmzHZhGtkJeU5e2DQLADplqQ3MZb5
X-Received: by 2002:a17:90b:180b:b0:2f6:dcc9:38e0 with SMTP id
 98e67ed59e1d1-3123efab981mr2365840a91.0.1748560523485; 
 Thu, 29 May 2025 16:15:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO6kVlTul5XfVExNVHlCfMfXtoSx3A+pScknURIeoMKwp8UajMgtsqcqSsCFhBesXHbzaNgA==
X-Received: by 2002:a17:90b:180b:b0:2f6:dcc9:38e0 with SMTP id
 98e67ed59e1d1-3123efab981mr2365796a91.0.1748560523026; 
 Thu, 29 May 2025 16:15:23 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 16:15:22 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 29 May 2025 16:13:43 -0700
Subject: [PATCH 1/4] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug/irq_ipd handlers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-hpd_display_off-v1-1-ce33bac2987c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=2307;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=iZ6m38kGUh6Wu9/l4YZxdyErgIvmhQUC45GosLwQHF4=;
 b=JzwNwtaiIIBM44Wr7k3CgOFsd6RO8xdIk4KnRV24BqdwI98BPsxzhcx12py1hq5JImcnhpaHq
 ewjnk+F5+XNDjmSGQssJk40wWDDN1VwB18kGz3ZAu0MJUSg9qNEa3Z9
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfX6oM8r5Zo2oLP
 AJ91rZtN+whxqzRUjtAY6yK00+7O4wcRchMS3/tGsoeVlfcLEmSl0l019grfED0+NFzwpq/xOO6
 SQje7AUlR6FmCTzbGOgWwdgGGloPm0KXVqEANjERjjQXKFeqMR7Rox3cJEimdjSssVuLYGDJPjG
 vHf4W/9kaZdi5AqDaGk2rltwvceAFLWWIF+r7o1iZ01854K1zlNM57Ulhw9zGnn6ZxzL80425f4
 WNN9iRMk4lgzaNzkhHODoFPSqUncoPL9zaii5mC+M2ACn9b/wS2eSM/5TJ2YrZLOEyTuAy+jnJ9
 qBe6j7y/4EGB5sGq0RAzkavW2vL1csz0rISHLmzMv/tU1ek5q2CiWISLE60oZpy63TCkQDbGAUM
 nLze9ode2AoqlsX9VEqMPP4XIPvGoEeikzGPviOiLRYEV/xjMgRkMe2YgrVP30hN98XzTQfD
X-Proofpoint-GUID: 5MRPLvfQ42uX2qyT24EYHwMwrzVCvytb
X-Proofpoint-ORIG-GUID: 5MRPLvfQ42uX2qyT24EYHwMwrzVCvytb
X-Authority-Analysis: v=2.4 cv=bupMBFai c=1 sm=1 tr=0 ts=6838ea8c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=PbHRmTaTmGSOozFvvjEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505290227
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

In commit 8ede2ecc3e5ee ("drm/msm/dp: Add DP compliance tests on Snapdragon
Chipsets"), checks were introduced to avoid handling any plug or irq hpd
events in ST_DISPLAY_OFF state.

Even if we do get hpd events, after the bridge was disabled,
it should get handled. Moreover, its unclear under what circumstances
these events will fire because ST_DISPLAY_OFF means that the link was
still connected but only the bridge was disabled. If the link was
untouched, then interrupts shouldn't fire.

Even in the case of the DP compliance equipment, it should be raising these
interrupts during the start of the test which is usually accompanied with
either a HPD pulse or a IRQ HPD but after the bridge is disabled it should
be fine to handle these anyway. In the absence of a better reason to keep
these checks, drop these and if any other issues do arise, it should be
handled in a different way.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 386c4669c831..1d7cda62d5fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -579,11 +579,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -706,11 +701,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_CONNECTED */
 		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */

-- 
2.49.0

