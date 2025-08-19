Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEC6B2CDE4
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 22:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA37510E21B;
	Tue, 19 Aug 2025 20:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFhDYcXl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B501F10E21B
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHFHvi023205
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=u36+WUg3Mc3swJSKHYkMll
 irkkX6BUSLAF6TGZRcL4s=; b=AFhDYcXl/vxBRjQ0K9Ksh5w0QZ4HO+/ItwLv75
 CwkSAmzB5RuPhPksRO2s+t8zfojqHFAAPGEWXmu2jrr2LhUy3u1+SAla07zV6P47
 d4Ol7dpYnEzFsvTZVrw02sAJ0w7yfzi6qngeZxDQ00BgIfAJMPrsTJgT5zNss8Wb
 O7hkGmMG7S6YbytnlTvcP9+8GgPHU1oLDndI+eBTU3CVJl6BHREau3FtehmhSaip
 cU6HXgjMgiCRm7jO25/QwmksiRcDW59j01+g7NvrPOUL/UBrlnQUskThbJhxxvrS
 6Dfg7p8PWVRN4NspUFzTJHcAnryupN+bAtcrLrYyN8/QOVrA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48mca5kmgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a9f57f950so123706996d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 13:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755635583; x=1756240383;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u36+WUg3Mc3swJSKHYkMllirkkX6BUSLAF6TGZRcL4s=;
 b=lYn7N16OiAlt6GpmRrGaA0Rx3gAd6Biku7UZARG1VBxDCe0Lzt4mY9zsoRY1nTwwCb
 Ci9XKcuvdUEPKIog7hFDrq9CjLdMHfFI6Nnc9B27IpEzbr++MqyltZV1QRjz525AWrmH
 8hpQOKOhtEDZYpYakjILrQi+x9pTFPCztlZQcO/wzSGSBUA/mwvVa+ibtS0iiHeNJimK
 l66wNmq5I5xRVaNO4iwbCnbY+4ANZRfHwctdL9cWSuVIr00Wscki9bPtWZDCvqunVkWi
 G/RIR+JdJ/C4NhT/EvQfQXXZ7bzxWDsF+/3YBfzCrsp9Qludaz3GOx1ivjldRDZo9i+6
 Qeeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk0DB9fUcrTMlKvv9zMaKY0LbvmpUVkIj03DANtR/26dwhJmMnQLolZp6smIGBc/O3oDEYaeo6ZrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkwZgeidGNmUMB5TgM7hKgvcRrFkAV4TC9FmCTX22LmxBa7swI
 halzm4gmDHGA92ywMd7gt5a5l73rMs8QSURPMG0znSvaZJyUk8jhbGDujkRT7I0fbkcoDcrUc47
 5bnCbNVY9iMpYTRgB7YxN8M8IGPXzkn2/VmoL7O0DHOhoWfl8tnZmgyb1ed1FoHS18TusBqdRlw
 WA/7s=
X-Gm-Gg: ASbGnctA3MKHALigq/uHLSwSzxQ2/17xns9AgXnnysF97p32vCunnJt1lIs4kWUkvbP
 +biQeGgV/PNDFuRCVQEiUkRKLMRz3GSiKdigXnaZirv+WHdHUDHEL2wlTW97F2f0Lnr6smwDfyO
 ie92uyURNyW4K6LrLbXTyhMAAT2Tyk9WvqTvHU4NWTwpHapxH/plb3/FyNnkmyQBk7/6nMmkN+n
 ZbDxpdMm1uLdSgQfkP8/DvO6TRLfIp5WaHuGiWJKeg9egCLZOuPUqtJq+r236g91Ah9PqCZ/R7X
 rYeQ15vR+PxIp9gOvB4fyI2yTicRVTDY7+m+VDJJa5ENajwhT/SqKwdkjooyZO5lJcA8o7Qkdws
 0yzJAuY7E1WiXreYY3SWY/3MMEN4KeaQI7Bo1F0ibqy4la7aMM1+o
X-Received: by 2002:a05:6214:2a8b:b0:70d:6de2:50c3 with SMTP id
 6a1803df08f44-70d7722ac12mr3784006d6.64.1755635583352; 
 Tue, 19 Aug 2025 13:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAnp1senRVBtFPBwRjEhWsmFdCBol2BtP8U6B6xBW6RH43qAjRYF7z+Opwyhnt+adLP/Hnpg==
X-Received: by 2002:a05:6214:2a8b:b0:70d:6de2:50c3 with SMTP id
 6a1803df08f44-70d7722ac12mr3783586d6.64.1755635582666; 
 Tue, 19 Aug 2025 13:33:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 13:33:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/8] drm: writeback: clean up writeback connector
 initialization
Date: Tue, 19 Aug 2025 23:32:54 +0300
Message-Id: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHbfpGgC/3WP0Q7CIAxFf2Xh2Sog29ye/A/jwwZFSdxQYDiz+
 O8yjYmJ+tL0Nr2ntxPx6Ax6UmcTcRiNN7ZPYr3IiDw2/QHBqKQJpzynG8rg2oJy9gzYS6vQQVU
 2VJZ5q3JVkuQ6O9RmfBJ3+6SPxgfrbs8Dkc3T/6zIgMKGi0IUVHBdqq31fnkZmpO0XbdMhczIy
 D8wrPjG8ITRVc4UUqGFrn5g7q+oDi9D+jm88pK28Qjzkgl1plwHnfFy9W6gxzEk6/0B7Q7XzjY
 BAAA=
X-Change-ID: 20250801-wb-drop-encoder-97a0c75bd5d7
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2451;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Aa58E9QetYLLT5CJBrAOu0YiguU4bRwcPCV4OnIkTHU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN97fwBvb/Aik+XkYHZSwBiiuPfEQA1DGz3dJ
 flwtoG76ZuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTfewAKCRCLPIo+Aiko
 1YjxB/4paCYzN/KLKPzZ4YPkvDeKzFqHUnCvsWyzuoY816hxdZdIjD0TjuJ70yL9Z8yg9TjelxV
 aJ5Wyezku3fMWBxN2+cusfQUKZM6NTNTCXyuJS2MoP8/NIsExN+7TXlmIz0H6IlO4YcwxA/fjMF
 b4gU1HZFju+y58XOm2/SIV7XDx2hEwWCIbYZS7noxxHgws3tY+QOjjvnSXBVV/PT0mrZriuxIfk
 y/rjbPBSoRg8nYiSNwHEk5QwQqDPMfBapHa8nHZiwSomT8o7u3vnucIdIy5gAsggZcdJEnUf3Hm
 nEgEQ1j1JRxaBTwG65tJWl4khOBj3THsYqNzreWKeZ3h6rSF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=FdU3xI+6 c=1 sm=1 tr=0 ts=68a4df81 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cFjmsF-WLDi_aLc5EnEA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: jVfxyg6jpfXUL8V-g8riXYcAIGwvtPOo
X-Proofpoint-GUID: jVfxyg6jpfXUL8V-g8riXYcAIGwvtPOo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDIwMiBTYWx0ZWRfX6UjdGi9Asp/r
 eei4f3a1m+haYAX4PGh5OtmxPiyL+q3Iic/P53N8u3PkrThetvnh6t5Y3gEWGn+VGEsaQePM8as
 ncSWYJj9VK4cd9AiMIV6eofziPirrjUUJo+jKqXLsYbYFfscVm8H74iDsJbmbdVNurefTWSpjTi
 NwbjPiJ7k10aadwsBodQwuuPPT2OwaBylbu6xydF8v7LZdJSCgypD0otCOVPilu6AUvIoMDuEF5
 7UUfFjzmgyR7w1Jh+uxWTn02edqE4jqDmhiTzb3uBEoOaLgCZ9PxV8Pn4B3dvw9EwebvQqxaf80
 0ksWUx4wuPoe4XE2oAE5/7e+3CHqKAeMz3M+8SYWo9noAzoP549W4OduWUa31EbKWhf5OD6AIhT
 818whPGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180202
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

Drivers using drm_writeback_connector_init() / _with_encoder() don't
perform cleanup in a manner similar to drmm_writeback_connector_init()
(see drm_writeback_connector_cleanup()). Migrate all existing drivers
to use drmm_writeback_connector_init(), drop
drm_writeback_connector_init() and drm_writeback_connector::encoder
(it's unused afterwards).

This series leaves former drm_writeback_connector_init_with_encoder()
(renamed to drm_writeback_connector_init as a non-managed counterpart
for drmm_writeback_connector_init()). It is supposed to be used by
drivers which can not use drmm functions (like Intel). However I think
it would be better to drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Fixed subject prefix for the rcar-du patch (Jessica Zhang)
- Link to v2: https://lore.kernel.org/r/20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com

Changes in v2:
- Switched to drm_crtc_mask() where applicable (Louis Chauvet)
- Link to v1: https://lore.kernel.org/r/20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      drm/amd/display: use drmm_writeback_connector_init()
      drm/komeda: use drmm_writeback_connector_init()
      drm/mali: use drmm_writeback_connector_init()
      drm/msm/dpu: use drmm_writeback_connector_init()
      drm: renesas: rcar-du: use drmm_writeback_connector_init()
      drm/vc4: use drmm_writeback_connector_init()
      drm: writeback: drop excess connector initialization functions
      drm: writeback: rename drm_writeback_connector_init_with_encoder()

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 18 ++++--
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++----
 drivers/gpu/drm/arm/malidp_mw.c                    | 25 ++++----
 drivers/gpu/drm/drm_writeback.c                    | 69 +++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      | 10 +---
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++---
 drivers/gpu/drm/vc4/vc4_txp.c                      |  9 ++-
 include/drm/drm_writeback.h                        | 22 +------
 9 files changed, 77 insertions(+), 131 deletions(-)
---
base-commit: c8cea4371e5eca30cda8660aabb337747dabc51d
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
-- 
With best wishes
Dmitry

