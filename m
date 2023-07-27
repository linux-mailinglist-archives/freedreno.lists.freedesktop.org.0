Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FA9765632
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 16:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE33410E5A2;
	Thu, 27 Jul 2023 14:45:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35BB10E597
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 14:45:46 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe1489ced6so1860156e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690469145; x=1691073945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AaVR++jkAbk5lOudvbAkb+yuYak09u1ZunnxV6fVwE4=;
 b=KznsrfP3bnT1LvVctNi3r+GWeMYdM8x8wGXQizIHC4eGlhDAlO5SuCh1+SDJ61/Kpk
 55xRPpguyS5txEdcSdp5rkBAschmdj/XB6fW7gGVh/JoFVVOACvi9qa4cLxmer82PpVS
 ZM9eWMiTXccRHATZmjigTUfClXw8iIWaFEipYO/AdRY22O69A16YWvdcL5fY4h+h5A/2
 Nq4APVomnRhchWRJHTx2SiIYKqY6Ze199UW1fZnbMn5ZyoIr3JYCWY+yqXYyFMpRhv+f
 nPJ1IaidhpLmhzYL6WfmH/sOI2q67zkPyF3ITXu3+iENbAnRwDv4B+0OXA9mI3RYQIe7
 4zJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690469145; x=1691073945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AaVR++jkAbk5lOudvbAkb+yuYak09u1ZunnxV6fVwE4=;
 b=eqsky/cEND0d9+P/zy00EndHON3f7V+rdGmJir/dclfmYz6OElPMJdH35/XCM19Qhu
 7uN5NhBiAQfdm3k1O8S88DRzwKbJsoNMTXT7WkaL7+edARktOi9xlY6cNAO+Fn1jiLQE
 kisxvfd8KGy9vKkO5Mu+Lx96ngFqVp3F7JaImduvWXg7nF5Q7RSYglH+yH67QNdkrT5z
 PDaUQLUs2L/WIi9rBW5MvsOhrlKdaRQWyG21Ex1txzb3brTYtq8xBxa1c3ltnb5Hj6uC
 h0b0O3RLKwIEM9im2d1Qpdb2AdE1x9cdulsgXKIs4aM4OvWHUBVBRATrtGKpNH5iwej+
 krsw==
X-Gm-Message-State: ABy/qLby01CWNzyXWwQN3Duf8sCMf6+ZBVh2t7H0sWlq/mZH1fquGovA
 CBbj/fkeN/cGGmBWgJsEOD29UQ==
X-Google-Smtp-Source: APBJJlHcNaVsnq5IxLwKHZK87F69UYwFuKz7uKNszuET8IAmX7/wC5TbZLXxF0i9Uw+NvD4BgLLdrQ==
X-Received: by 2002:ac2:43ad:0:b0:4fd:f878:c3fe with SMTP id
 t13-20020ac243ad000000b004fdf878c3femr1744140lfl.43.1690469145136; 
 Thu, 27 Jul 2023 07:45:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d28-20020ac2545c000000b004fb86662871sm334110lfn.233.2023.07.27.07.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 07:45:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 27 Jul 2023 17:45:38 +0300
Message-Id: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 0/5] drm/msm/dpu: rework interrupt handling
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

Please exuse me for the spam, I missed the triggered WARN_ON because of
the dropped patch.

Declaring the mask of supported interrupts proved to be error-prone. It
is very easy to add a bit with no corresponding backing block or to miss
the INTF TE bit. Replace this static configuration with the irq mask
calculated from the HW catalog data.

Changes since v3:
 - Rework INTF_TE handling. Stop depending on DPU_INTF_TE and enable the
   relevant interrupt explicitly.

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
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 106 ++++++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  18 ++-
 19 files changed, 87 insertions(+), 190 deletions(-)

-- 
2.39.2

