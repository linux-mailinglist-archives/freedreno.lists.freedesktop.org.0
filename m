Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E27A30801C
	for <lists+freedreno@lfdr.de>; Thu, 28 Jan 2021 22:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47AE6EA2B;
	Thu, 28 Jan 2021 21:03:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA196EA2A
 for <freedreno@lists.freedesktop.org>; Thu, 28 Jan 2021 21:03:42 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id f63so4802462pfa.13
 for <freedreno@lists.freedesktop.org>; Thu, 28 Jan 2021 13:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3WONUXtOBA+aimidJBvuVmUVV583MRFRwJEB2kxrPYs=;
 b=YBojJS9p5xbUaHKy2Lz2exq+I/GlOwWsVyMzlakgcN5k6/BM6757RCUFuEhsw8dCfB
 9UEEpZeZj1zog1T/mkmttEZM8l3dbQVyYDv6LBQdB/UPJOe03VCWXD5VBq0BRQX4KiLH
 ma3VCoVUws7V3pu4w1LfWsKEv02ZUmn/UfmGg4GY77V1wJvPlaOdIRlro9d6Dp9PopvF
 kM5Qmt/lRx5kDPtA06kkMyG3RDp0Pu3B/eGPIRRA9JzNr98Sey/KnZuJbIt1nh8oIh5l
 SHsqgSF3FTXSJpCCzOoNGuU48b99UVXx/HwVY7lwCRKEnfBuDbIIZ09OjEDuXF+ikVee
 C3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3WONUXtOBA+aimidJBvuVmUVV583MRFRwJEB2kxrPYs=;
 b=j0n1KVuhqksFwz5ZbgHV80/RL8bNQ/Qew9wsODObQUKXQ5lph9lajsdRXH0zxUq3fW
 sKS1IevOpWPrxKswqvl/xUSA4KBUz6l2ckIeTQz78pBeOPWzYgHF16ISbtCX0vYJO5go
 zMV/j/eCc+raw3fu5tL5AqJ+BLm4m1dHuEYfkQ9x0tzeyepkCO3UxwCIgnUt24T9X1eY
 tTasgOxFcAcKyRM8Q/byBcw07Qp4qdQfC8zqx7XDectXfg9qpwzwSFmSbaTCJOBhucZ3
 iKoULsY/0am5TEKdycJiH+0vG8lY6oZz2j95Q1sjQ+Myul2XY2PX3GV6lMgi+hTMk9dq
 IUIw==
X-Gm-Message-State: AOAM533/55CU5GGmOUXoeMFioCAtNS/gBrZ4VauHKOY232UWB6Pgku5V
 nCSgmmQffBi6LFf4I4rBjoq6pA==
X-Google-Smtp-Source: ABdhPJyjDHTf5cZ2T8LWCexxoeNi+YORZrAIIvHkgQ9CukxkleXU959cZ4xsh58LnwRvlkSO+tlCgw==
X-Received: by 2002:a65:62d3:: with SMTP id m19mr1313991pgv.180.1611867821498; 
 Thu, 28 Jan 2021 13:03:41 -0800 (PST)
Received: from wildbow.anholt.net ([75.164.105.146])
 by smtp.gmail.com with ESMTPSA id l2sm6753295pga.65.2021.01.28.13.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 13:03:40 -0800 (PST)
From: Eric Anholt <eric@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>
Date: Thu, 28 Jan 2021 13:03:29 -0800
Message-Id: <20210128210332.1690609-1-eric@anholt.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 0/3] drm/msm: fix for "Timeout waiting for
 GMU OOB set GPU_SET: 0x0"
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
Cc: Eric Anholt <eric@anholt.net>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Updated commit messages over v2, no code changes.

Eric Anholt (3):
  drm/msm: Fix race of GPU init vs timestamp power management.
  drm/msm: Fix races managing the OOB state for timestamp vs timestamps.
  drm/msm: Clean up GMU OOB set/clear handling.

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 105 +++++++++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  49 ++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   8 +-
 3 files changed, 84 insertions(+), 78 deletions(-)

-- 
2.30.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
