Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8B3B0287A
	for <lists+freedreno@lfdr.de>; Sat, 12 Jul 2025 02:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D8310E3D9;
	Sat, 12 Jul 2025 00:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0HBNJvj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BE810E3D7
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:33 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BBI001001112
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q11UOiARa3HDFn+Un9pQ8/hWjntRP+9VgAjNKaCCqQQ=; b=N0HBNJvjUhyeB+w1
 iQHXeMn3jbBYaG6mXuGwLuGW2SRCDWcFQi0cHZBYfsjMwJ8uoNT5bmoRLvjxrWPW
 uwkYFvE1tG6ZJl5bn1tiT3nhCMKIYUqlWhBNnyISAalmmkwRIAdRVmGz1k6OhZGw
 MCNMzTDEjz3M4FgosXnBhnwGc3STdf/BFu2VqmZxFGLHLh+qu74587JnonKBIci+
 3jWJvdMZD6Cc04Q8sd+Be6sjKfd9jHLYl2pGkPbCHh+LMJdvAXmBJx015vOzqKUK
 OBHcTjX5+gH/nn6rEyCSU1vPcHqAT8MkKJzeVQwhY1UksK/3CtCBf9q4RGgUi1Yh
 u082yw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucndnt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2355651d204so26289265ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281910; x=1752886710;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q11UOiARa3HDFn+Un9pQ8/hWjntRP+9VgAjNKaCCqQQ=;
 b=Eulk5/c7jG4C/zTzvYwr2Sya3pVGgP01yancIxKKhAa+65qQsB3AqQCSgBRqFGutKk
 Uk1wjzsgB38YLaEaXTzGKdTQrxfmENd2ydBnhWM5PoeLyXcR6zkoik7JN3eXPH8nvMoi
 BIPkty9zFuH2mtkPAtBHH4NRNK1YQEk6lehu7KETJw18C3j4bfv9q/sNGMLL7avcW3bz
 8nv6Jij7qQaoqtOVFQ7EPe3cIuU134THQLOQGkdetVGXDHftL1dp72AcoZdmgHkh4dHU
 wa0Sdn9nQdpZOufkctmXlcMgyonX6irGCd/QFyw17asjd4TOC5xPXFNOekeNDHUKnrTN
 sN/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaR0MIena/ki2sLA7KSH9ZhBnhcN2C024Pzu9XCnWgOEyYXGevGUwe/6MWPxz9EKwbsbZPWUMyuaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcDgSXirwhsyGlIWlzqfwUOIZgw2FnCc6OHzBDLnOeejAVbtF0
 MbbB71FOmZt+Ga1W6CPPSbDdIo4smSRDC26QsSniU6cRoFAgdweeRTpulZmEWoyPgc7/8sd6xgE
 L8IRW620iN4j9+QbTY5+/sZrofYsA2ZK5p+MNHxGL7QoAgmiGLzfayu30sC4RXiNnTixB0/A=
X-Gm-Gg: ASbGncsaHqETPm04SG3UTG9BthD54r60M11O3guJ9qIiKr7jREQA4FtAy5lIo8uVK1Y
 U2DXXo8RrP4pIIHZI1ChEloqaAmjlBUv72YHEW2jxso1VDluPcoe2SXK89Q98U2zwLeXaYruzgt
 Iss/2MH2vR8pL1NB4wjr9hPA9XNhyJpgUUilvmjX06mLp2sb3ukOnfRE5T7Nvh6LuojYbLqUOou
 lEP8AoIFeqmIwqTMcoLpW3wX9X5Qx+jO1XKFc6wnO2Uq/595jMrfMsyqJ5EaOkLDtatjzSdJsLb
 IaHNIUofMK3oakP2Tw4xgJBJz4sU/QfTlwtddnkSnvQisL+yYn0aXIR8SSVR+J90CrwHpWMIqR2
 ywBgTUJAMDyrRmvyp24UXTJY7
X-Received: by 2002:a17:903:4291:b0:236:6f5f:caaf with SMTP id
 d9443c01a7336-23dede396bbmr57111585ad.15.1752281910326; 
 Fri, 11 Jul 2025 17:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEkslTssGGwVbA+ubFmEhnufVz2ZPDP3EbIVkI8173qZsyR2UUDWX8SezkuEsaNcgc484+2A==
X-Received: by 2002:a17:903:4291:b0:236:6f5f:caaf with SMTP id
 d9443c01a7336-23dede396bbmr57111375ad.15.1752281909914; 
 Fri, 11 Jul 2025 17:58:29 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:29 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:07 -0700
Subject: [PATCH 02/19] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug/irq_ipd handlers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-2-33cbac823f34@oss.qualcomm.com>
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
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=2318;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=lmjyDwDYFnlKQuJK43yWUhZMEmCS6vExO8kuvCtTUMI=;
 b=ZwqK2sAaMuPEEntJ5YT/sWXzkcT1wgWrynvhWeXOd8zBND2GunLXDSSk9GsE675dXMDZJs5qd
 +bKpFlE8FfmDETAg/krNMaady/F3h5fWvRM0d6dXwYiaKK8lPci61mL
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=6871b337 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=PbHRmTaTmGSOozFvvjEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LyORa8CHuaRGkkI__8EYZ-XKGlx1H1pE
X-Proofpoint-ORIG-GUID: LyORa8CHuaRGkkI__8EYZ-XKGlx1H1pE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfXyhgIwe5Atawz
 Ll2tKEGRA1k6MZheVjZ8Tlj2Stt3oZv8/RUDtxGs04w42Ww/SSJWlNg/lXzNrSp+oE8vIg0Cr+G
 yxp1IAVko+GqYs6d6zVZiJcvBR46iVLC0hnrU7ISopFD6VmUQpHM8HfpmRIfRDNmxXWnE/2lBNR
 UaQ3m9TsEw/ccEewlRv3GA6r5Gqgah2gjhAm5sqabPGbPgftTlt7/A3P1DM4pERbHdyq9H/M+UD
 Nxr1MwGLZblNlStpY/o7qJxJfOcg8yp7BbYTZCagkE+JGrMVDKQ4hXw4WHi0eKjiH3slu4yM7Xg
 bvkvHbl53vtP3N42NyQx6X4tvpGR4ZvyQCGEqvSsynyj065cBZz3+HI390MLeWkDky4ktHqNp9p
 MTlH6+vExoevRifg0ZPpGQvJjyhNOeEcst5R89fbwvEeyXZ3B7EPj7jGA1kIdLXdtuHCxikc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
Note: Taken from https://patchwork.freedesktop.org/series/142010/
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6945df782f7b..1072b5fc00ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -595,11 +595,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
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
@@ -728,11 +723,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
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
2.50.1

