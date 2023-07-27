Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB7A765504
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 15:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0065B10E581;
	Thu, 27 Jul 2023 13:31:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D06310E123
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 13:31:57 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso1757902e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690464715; x=1691069515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aVF6Gl1t1mutYFS9NN8YkCozNIb6oFM89YPHjp3dd3o=;
 b=s1dXptnePaBLtDB1/mEJggAgj2cfgysBQ8x1Iki2zCzmMTZVqp4XmrqfgPVnJuUBaz
 uoHuVCuwmveQxah/MjYXmQNUqDOjWdZG+cZ1ypLSM9kY7elsYkVciMRYPIpe1AEk9Bl3
 iYuTrFvr9E4YSI32b3JneOPW4evw7q19KEeA/QshNdcQf2LE8zoFgKrHyiVRaBzMzeXI
 C9Ml6C2OzsugocIZLI/5+FXg4DejmhCKA8Unp+RwU3QcQbV8Io8sJQvWMvxQxji640o5
 swKoWWOZLD1rLGaWKpjbtBJ+4ENrlVjuLikWvU6bGyLcwcNuVF5BT5zqbYJWBrS+JI4H
 5HGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690464715; x=1691069515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aVF6Gl1t1mutYFS9NN8YkCozNIb6oFM89YPHjp3dd3o=;
 b=HliSUI+upDG9GiW/K54tImAcc/F1pIvS2dN7HW+GyqCNTdsDMKxwiH3m0TTfACUybJ
 ydoZCYBYWe49iego90Hms+Yi5atXtCkhMen0swjMoNOu2dwx3gfHftMtBKZphF0+BKbU
 WIogDPs9l/8kkKmWp/T/ImwlQxRfSq7LrXeCh1WyXUCk3nJ6YnedVgAApxcX3td/x/nB
 tOSQw+nLwOOHJdZGFxjbeD1vZuUgyMJ+nm3ug8xS+zK+dwyoZdqEcTw1BLSTh45C69tb
 o7ccIHYH9hOAmXq7A9PB9VrqOrO+uiHvvDErLsVDFHzPFXdUz5ys4lIWSwlRFbU2D9VG
 H3dw==
X-Gm-Message-State: ABy/qLbpjqqNy3gZoYQZeFpBZCvI8bKzBlTqI3hZjNlfparPjNJv9M3U
 hewVhAF5hXgZj0eqHTaZ0QMgCQ==
X-Google-Smtp-Source: APBJJlEkC9CoQoDX2Y18CoZv8e3Tg6vTM4kIP/co/BmAx6SKQSkAAgZysB4OCeNhgPcoA+UJHQ93Xg==
X-Received: by 2002:ac2:43b2:0:b0:4fd:d044:cb5b with SMTP id
 t18-20020ac243b2000000b004fdd044cb5bmr1690109lfl.55.1690464715148; 
 Thu, 27 Jul 2023 06:31:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05651204c900b004f85628ec34sm313511lfq.33.2023.07.27.06.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 06:31:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 27 Jul 2023 16:31:49 +0300
Message-Id: <20230727133154.1421721-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/5] drm/msm/dpu: rework interrupt handling
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Declaring the mask of supported interrupts proved to be error-prone. It
is very easy to add a bit with no corresponding backing block or to miss
the INTF TE bit. Replace this static configuration with the irq mask
calculated from the HW catalog data.

Changes since v2:
 - Rebased on top of msm-next-lumag to be able to use core_major_ver
   instead of adding yet another flag.
 - Dropped the DPU_INTF_TE movement patch, useless after rebasing.

Changes since v1:
 - Enable dpu_caps::has_7xxx_intr for DPU >= 7.0 (Neil)

Dmitry Baryshkov (5):
  drm/msm/dpu: inline __intr_offset
  drm/msm/dpu: split interrupt address arrays
  drm/msm/dpu: autodetect supported interrupts
  drm/msm/dpu: drop now-unused mdss_irqs field from hw catalog
  drm/msm/dpu: drop compatibility INTR defines

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |   8 --
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |   9 --
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  11 --
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  13 ---
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  10 --
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   5 -
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   5 -
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   5 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  13 +--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   9 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  18 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  13 +--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  13 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 110 ++++++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  21 ++--
 19 files changed, 94 insertions(+), 190 deletions(-)

-- 
2.39.2

