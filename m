Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547EF7656C1
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 17:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CBB10E5A1;
	Thu, 27 Jul 2023 15:05:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB8910E5A7
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 15:04:59 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99357737980so140321466b.2
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 08:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690470297; x=1691075097;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WwHOgFrq4/BhE3FhnBJjD27ZTh7D72yQxXf5H5vBWvw=;
 b=YyErZV5gOb/2JmBJfdzn/w5mH8QPep+4zdzQnLZTub1pUqNlA5Ol1VEVGkzfT4w9tH
 wVdzJcNfBrCnsTHL8hRQzDAoS4B8sawi9RaGRI+cRneDWVeHimF1jsU52d5Lf91IdESj
 yU32WPnsrxofrlILD5PzpMxJPL/D2MoAT2yvh/gub81OFvhykyVOI3KpI/wIA4SzbFXT
 g0JC3nqBc13pnE5hha3BAcBfcp96zlHVT/Yhxa1J56mtpNd6237KhtGjot9/XsIa5EBh
 zLncMLXbMNceRRCd0NX0eWRibNcz4thdRTfdzgh+6ytdVSI/0wdvsmigauJxonaXDOG4
 jmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690470297; x=1691075097;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WwHOgFrq4/BhE3FhnBJjD27ZTh7D72yQxXf5H5vBWvw=;
 b=GXcsCH3qhC/pud0Deb0D0a2SzgktunEJxf/8TI0F0GhtDuyZ3NRgk9S31PJI5KsyqQ
 aCoMzlrFx7F9KlamP12wt7ht4ntBUbsbpU2uau8+LpvuMRrR+V8bETnGS8puKbOhdhAC
 fDbS8dNh/U8x1NScHXa/oo2WwohUUtbpzGbNiMmtIBfqaX9dFiA8dPdoaieUxQiuP/hI
 2UyRsL27rXLwYuh63wj/2iuseScQjwpO2uGuX8cAbglPc+hWl2ciSB58uykjPeqwYzzG
 aqX9ArtI6e6eNrZuemD650+PChUifvHUbrozpaZJCARjTNWFA1MoNd4g06MhZtcIZ53P
 ryVA==
X-Gm-Message-State: ABy/qLbmIAg2r3yLetyOOkpIACuVUd2QJgPeWSpw6bina2LlL8l1sCtq
 HVLkG/v1a/H1Xx9nVgOAShJKwQ==
X-Google-Smtp-Source: APBJJlHjj5zESFdiS3a1fGwYRHuinc3/xPR6hP19ChaulLFr4stgnxTMHMnnM0a0xFf0YnLO7sfIlQ==
X-Received: by 2002:a17:906:31d3:b0:993:f2c2:7512 with SMTP id
 f19-20020a17090631d300b00993f2c27512mr2170774ejf.33.1690470297393; 
 Thu, 27 Jul 2023 08:04:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 jp21-20020a170906f75500b00992e94bcfabsm857195ejb.167.2023.07.27.08.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 08:04:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 27 Jul 2023 18:04:51 +0300
Message-Id: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/4] drm/msm/dpu: change interrupts code to
 make 0 be the no IRQ
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

Having an explicit init of interrupt fields to -1 for not existing IRQs
makes it easier to forget and/or miss such initialisation, resulting in
a wrong interrupt definition.

Instead shift all IRQ indices to turn '0' to be the non-existing IRQ.

Dependencies: [1]

[1] https://patchwork.freedesktop.org/series/118088/

Changes since v1:
 - Rebased on top of msm-next-lumag and updated IRQ rework series.

Dmitry Baryshkov (4):
  drm/msm/dpu: remove irq_idx argument from IRQ callbacks
  drm/msm/dpu: move several IRQ-related defines
  drm/msm/dpu: add helper to get IRQ-related data
  drm/msm/dpu: shift IRQ indices by 1

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  4 -
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  4 -
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  8 --
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 10 --
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  3 -
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  8 --
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  3 -
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  1 -
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  3 -
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  1 -
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  1 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  8 --
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 13 ---
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 12 ---
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 12 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  8 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 16 +---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 14 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 94 +++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 16 ++--
 25 files changed, 93 insertions(+), 174 deletions(-)


base-commit: be4dacf4eee1c4e2e91586e75e95b2852274dc58
prerequisite-patch-id: be3f3e5df89f9f2cc6b6289a83422d65e29d4900
prerequisite-patch-id: 59cd61ccd3cde7218fe3db6a8c672faafb7167f5
prerequisite-patch-id: d493b9bd85d518c15ca94f22174cb5ab2e2443d9
prerequisite-patch-id: 6a5bf3083c3da70ca110c17d54027e96c0335636
prerequisite-patch-id: 670883101f3b5dca122501f2828d8e45a6843b38
-- 
2.39.2

