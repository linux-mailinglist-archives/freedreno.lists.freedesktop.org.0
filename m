Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C69FB28DC0
	for <lists+freedreno@lfdr.de>; Sat, 16 Aug 2025 14:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB18710E2E1;
	Sat, 16 Aug 2025 12:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYAQaqdL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6860510E2E1
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G7ln3u032598
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=DJa7R2QHaJhhfx1abJv+FW
 4NHkh9fI+yxSQ5uteT5y0=; b=TYAQaqdLTrxEbLSRC85k4O+GgU0kii/k12kbpM
 j9Ad4msHSHl1HaZrZUmg4NdOwSx01AkfeA1ZEKnIgDJ1vLFiLAJoXdxSvJRFo2D1
 38C6IFsp72fjP8eGc0cBLoobWIXnCh+wZtNWCE+bQis+zrPco24nE9vO9faV6piP
 p+eNVcxzYTaEYUri7fu81LmZSbD/aLS1X1NtPAo9Q8bLG1COM9iGF069/5or2gEJ
 C6q8XG7Szu6XKREScdJ9MFSyb6cRyjKrvpMb2CDJVy0GFarIOk3U52SwuzVVH4Hy
 VysuPJ+0cri59lAwWdogBmH5S2gRO2KOPyPXY4fmdE5psMLg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh070q49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70baf7ecf04so19022726d6.2
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 05:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755348066; x=1755952866;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DJa7R2QHaJhhfx1abJv+FW4NHkh9fI+yxSQ5uteT5y0=;
 b=svfwu+qDsFk7X/IWUIV1hV+yDOm78tif0QN7PHUEjYbTFqMWPorwxoHcQSEsQtFeru
 +hhz0JnwIXhqg0sJp5dqmJoHCt5H9/FG8bfL5SX6ZcvkMFZPArWkELPzyoPN70njuRXq
 o7x3jxbZyQb1fmVLfdAXqM1v/hDMANoUFvfCyDSOFxgyl5326hX54E0ZQ2HjtCPX3va0
 pVKXtCI1S84bimc6DWCvFO8RDcnMiqw71Bt4n0plH191iaKZflyj1VxirArKaHdAYA3L
 dLTAyzRS41vjZItY8L1qqDbxbPa6fHBZTqkPx0ugfkpmnjZFTpQP4rCUlKvFnVZGzPry
 TSew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLERmO8Dn/S9Tu0TJ18uQ3MJVg4ZfNqjV3nIPm0tMFaW5t62kG81eyf70OOpozajIkbZ0SLR8JSAk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhevPBEu/CjAJ77q6FwuiHp4lo/cEG126wk9C4H9+uoUcLYbpG
 vJKi2wWJWh36VeMVid/ZMthrNUa2YXmD5M3qdIlsVdk67xMnom+bDJ0u1BCrg/AT0JeW2uvHBFZ
 eypXV90c1OCXaSK/DOmlOIjpupF/02FeffQG5o+u+gAcqbvNTNIQsy77T0dMitCPKkgzwvqg=
X-Gm-Gg: ASbGncvVmgZeZz6uyqUEKY+tkrU3TqMXJTpg8E5MXG8yFC2RehB8i6LpKQ2wmHbioT2
 No5VZs8UD0hbqeKr3tvw/AwKWyAuaqAhkvaIlhxTXTFS8YNlqZuVPvVaiEUBUwvbzNZSuhTHHG+
 9w+eiADAqgVIqoI+zRzH2eV1sc0SNMiJ/g4gdI+dR/G/QTQfUH1PIj91yDJK67DgLQ3RpayPfDq
 SICRp3Yi7o7MzXv7x80eCuy/9T6ifhySLgb3C+LQNkw8taTYQN7VBymKoVFiRKwbTfhEvSCYxId
 H+w695JU497fxgNeSBQVtKi6rQ+CaJYue2J3Pe8DnAhtn0WAJP7xDyyCwyvxKFfONbOWLYmSLd+
 wS7j8PIpjLnIn6DlmN4PxJMs9KmNh+34k6XOAQm31HWvAOVYGKO6y
X-Received: by 2002:a05:622a:1445:b0:4a7:18aa:121b with SMTP id
 d75a77b69052e-4b11e11fadcmr70445171cf.20.1755348066183; 
 Sat, 16 Aug 2025 05:41:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDu/rhFRVUxM6MMA7J2l6dXYr4ZCedu/K1PSwVZjoSHNuoLvoUjgkhh/mHkUAxjnQKCA+q9A==
X-Received: by 2002:a05:622a:1445:b0:4a7:18aa:121b with SMTP id
 d75a77b69052e-4b11e11fadcmr70444611cf.20.1755348065731; 
 Sat, 16 Aug 2025 05:41:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 05:41:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] drm/connector: hdmi: limit infoframes per driver
 capabilities
Date: Sat, 16 Aug 2025 15:41:00 +0300
Message-Id: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF18oGgC/x3MSwqAMAwA0atI1gZqix+8irgommjAVklFBPHuF
 pdvMfNAIhVK0BcPKF2SZI8ZVVnAtPq4EMqcDdbY2nRVjbMG3CTIiRJ5Z/WBElLbWfYtO9cYyOm
 hxHL/22F83w++h3ZyZgAAAA==
X-Change-ID: 20250815-drm-limit-infoframes-e782fa7f3360
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2224;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rdcPrfCA8M3yJ02gdAYNdSPeQnvEBJT/WVjtw9rGblA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxel4gzygfQobSNeCeCVgeypJ9lKzy5dsSVX
 uc9QkQAbKiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XgAKCRCLPIo+Aiko
 1YxCCACOim4bCjHIWqX1M1bZiVMLzRI3Y8QTdbuiNgrmLKiOaXRYiFmSpaZRI5eGf0CarO1iNUi
 IQjq0N0dSpJFtGKIfadH9PJ8064ZG7NIpU68xmKG1OFzxevGRyfeNJZ7i4GhEi/tV6G96JOSs8H
 iwPRsqFRQrzhwp8qORn+7d2WO/i9IRJf/2vrpu6496ztu9HTv0ZNQjECzwcE8yDWeZttI0+4gR5
 LzTcTBEjoqQ/4IYz9y6hTrl+OeWEdnWvuOJ3FPXWNrBp/wJ3O5D8k/YbUSYRsDcSwrd/5CllFgA
 XVjiF+Q3Rz/QlzANj6UXQ7V7QH3pQwvw9ipP0T0b3jfjVNWw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: _tV2tr2SUTzAGsUFg-mFIC7YnftwtUYl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX+KPJ9OhPYXsc
 7cGma9Jjal3gDQ15UBaZYfytrguh4Kmlzyzo+ZqCXEX2/6DXO99mRUMkYTnrX/9AWMblZJo1ySe
 SS6i10b9M5ZZAvjDJp3oG0uIczzGZzHO822a6ynSRmlUyUs93DA/M2dWYpmZoT2VNAwU2KgHDaY
 O03bf+khRKnuZRsdrnqhMuOHlPNYAjBVO4YOg++MyTrXRj99O5itYdCnDCBGza2KqIOf7uWeqHn
 9693AiowisQJD7BaxUbXhfRej3Rhgh5hKHsaZckBiGXWtU+IUi4owBUkzTHFpmdPSZ84Q8cXeRD
 5Y83NUZkcIJ3SNMVBSWUW+byipp6RPhxwpWdhvu4lk679D3kP+7X7AIifpTREUBdLj5HvizObRx
 +LNnaEYW
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a07c63 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=lTUuHy-DAZNZ5WD40gMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: _tV2tr2SUTzAGsUFg-mFIC7YnftwtUYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020
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

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
a model of ignoring the unsupported Infoframes, but it's a bigger
problem for the userspace: we end up having files in debugfs which do
mot match what is being sent on the wire.

Sort that out, making sure that all interfaces are consistent.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      drm/connector: let drivers declare infoframes as unsupported
      drm/bridge: adv7511: declare supported infoframes
      drm/bridge: ite-it6232: declare supported infoframes
      drm/bridge: lontium-lt9611: declare supported infoframes
      drm/bridge: synopsys/dw-hdmi-qp: declare supported infoframes
      drm/msm: hdmi: declare supported infoframes
      drm/rockchip: rk3066: declare supported infoframes

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  1 +
 drivers/gpu/drm/bridge/ite-it6263.c                |  1 +
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  4 ++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  3 ++
 drivers/gpu/drm/display/drm_bridge_connector.c     |  6 +++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 43 +++++++++++++++++++++-
 drivers/gpu/drm/drm_connector.c                    |  4 ++
 drivers/gpu/drm/drm_debugfs.c                      | 16 +++++---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  4 ++
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  1 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  1 +
 drivers/gpu/drm/tests/drm_connector_test.c         | 28 ++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  8 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  4 ++
 include/drm/drm_bridge.h                           |  7 ++++
 include/drm/drm_connector.h                        | 23 ++++++++++++
 17 files changed, 148 insertions(+), 7 deletions(-)
---
base-commit: cb640b2ca54617f4a9d4d6efd5ff2afd6be11f19
change-id: 20250815-drm-limit-infoframes-e782fa7f3360

Best regards,
-- 
With best wishes
Dmitry

