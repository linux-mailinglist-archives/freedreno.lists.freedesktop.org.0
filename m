Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846238BADE8
	for <lists+freedreno@lfdr.de>; Fri,  3 May 2024 15:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5926E10FC46;
	Fri,  3 May 2024 13:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VZ3/Rx3h";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D6910FC46
 for <freedreno@lists.freedesktop.org>; Fri,  3 May 2024 13:43:16 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51f60817e34so1641257e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 03 May 2024 06:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714743794; x=1715348594; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zyyfp4qby9iAPOj419gxE7bqQG4AvlgS4hynSrw/+50=;
 b=VZ3/Rx3heoEgtVqZJzi//2H+qGfPmF1mE1mjwZ921EOhsaRsvWu9M5jEEHQiJVT6BY
 WMSWaXbWCfbbZy5Jru7J2a2j7eaA58WezYOAe6sVuqnltCEO3S6axI4jLXoYjD1pU8o0
 NEQogBzXVarHob/xIgsVlnplononXhkJnPuwUpJ/fmE0MPBOJmkjvLG3rYW48+QX5x/2
 m6FRCNfURpZ587a/dw8QvzhhU3t/J+057V1yQTKe1yzZF6dSaH15OGU1zHuWKD4905Zp
 6DZ5eY006MAO6V21eoFvtWAa+v5oH59btvb8O9+9KQ24K2gDCsG3iQU+9V+BWE9uJLWy
 +mYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714743794; x=1715348594;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zyyfp4qby9iAPOj419gxE7bqQG4AvlgS4hynSrw/+50=;
 b=aBOxBTfABLxxXzihKJBhHC7bJyTZV+rsDo7z8TodhEjj/uDVkMTt9TDyqXSpB65Oh2
 fGDC8obtJu6tDTdPfLnwnfYRtmNfzMJpOr2SEInzLV37p72DcLAaQI2DQD8W19rGQkam
 Y9+fd/onb9oV8r3Uh/KM+d/YuEvpciSKm+/piHcauTP6eLnXYLa+mEcNdjJU/kYejpY0
 r2ks008M6n6823d57ezEigPnGhMpIC+ttebKH9m8CnMmlDdpk55IaRy53EAofCp+Rjbq
 H3ohrXCZ7AxBokbkrvRzVQktJ8vNM2WkLMYeHThIc4Xd/ZK3Go3zFY/9qQOK3G5zoc79
 IjjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo/U/jHhyPljoBPGiY5/w+8aHde+bXlLooIJkU9E3rGc2bodbT8EqDIHrcFJBQGTLn0K9BH2N3hlv9blHaHbiWIPrOG6f7XhTLQqT/ae34
X-Gm-Message-State: AOJu0Yxzaa5mwVr8HYbn8YRX1PVVSYAwnRM3UxBfCQlaFd84W/WFTd7A
 Bmn2GTrMo/ivCPZqUb8nOjUvZ3X1c2XPG+g3Y4yjPyac8pFedsxMCdNnjQ==
X-Google-Smtp-Source: AGHT+IEuJFHTRpnejddSaorKZYTRmH7JKI71UbuwpdEkJajtnyPEeh/HIxQo38GNw/+98rcZPG+8Mw==
X-Received: by 2002:a19:6905:0:b0:51a:f2fb:b13c with SMTP id
 e5-20020a196905000000b0051af2fbb13cmr1760394lfc.11.1714743793877; 
 Fri, 03 May 2024 06:43:13 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 z18-20020adff1d2000000b0034df178a9acsm3782482wro.99.2024.05.03.06.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 06:43:13 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 0/5] drm/msm: Support devcoredump on a750
Date: Fri, 03 May 2024 14:42:29 +0100
Message-Id: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMXpNGYC/x3MQQqAIBBA0avErBMmy8SuEi0sp5pFKUoSRHdPW
 r7F/w8kikwJhuqBSJkT+7OgqStYdntuJNgVg0TZoUIprFYoHOXFR3LXEYQyTb8anKnVFkoWIq1
 8/8txet8PFCcx7mIAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714743792; l=1289;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=GuBvh1EmOKxjLNpL33C5S5sksR1AgZWc6zDs3iQDq8s=;
 b=bSJHF10HtjuZ9Tzx5wPnYVU1fQZj2PXl8Q7IjjBliL/Ur+7ZKiUVtz6bWEl18tbcBzoSMgs+d
 939KwwUv3UFCpBbAyN83uGEHxEj1sGJ9MDRhMASA7OFPUMLCWUZHa7F
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

This mostly involves importing the list of registers to dump from kgsl
and plumbing them through. We also need to update registers from Mesa to
pull in some AQE-related registers for dumping the AQE equivalents of
the SQE_STAT, UCODE_DBG_INFO, and ROQ indexed registers.

I tested this with msm_recovery igt and decoding the devcoredump from
the gpu-fault subtest with [1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27266

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Connor Abbott (5):
      drm/msm: Import a750 snapshot registers from kgsl
      drm/msm: Fix imported a750 snapshot header for upstream
      drm/msm: Update a6xx registers XML
      drm/msm: Adjust a7xx GBIF debugbus dumping
      drm/msm: Add devcoredump support for a750

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   64 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |    6 +-
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 1446 ++++++++++++++++++++
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   47 +-
 4 files changed, 1539 insertions(+), 24 deletions(-)
---
base-commit: 7e6b8924568d1aa476b77323df8d2bdd31bd7257
change-id: 20240502-a750-devcoredump-5916f90be37a

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

