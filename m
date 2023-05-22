Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9128D70B280
	for <lists+freedreno@lfdr.de>; Mon, 22 May 2023 02:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F024F10E21E;
	Mon, 22 May 2023 00:42:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC7910E21F
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 00:42:30 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2af225e5b4bso35710241fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 17:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684716148; x=1687308148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bKu4gKGvs+WAdhSbwvOc7isenmKfDUb8D+/Pt5dQNBE=;
 b=AaFhJOwM2DAChTMb5HTqwJ6XmdF15LKyGRQayJzv/2m21AYVdV9j58DfUjL1TF18W3
 W3KmPB2q02aLuUhNwl7HLh+mf5H0zmPmigSiWU/SJf7eTLtFzaIQgoRRbQ6TT3qJVlmX
 dPGyCCTMCq8W2Zx8+7zD4qlVZEP48eJGfc0C4BjBZTSAeAphIjWprksOEKFWsTaQbY/Z
 hzOSl02rKu0Xp4OFqCCEqBT/h9Ga+l22mfycqDwO4PQpQhbCbIhZvn8LiyFwBkvXwalZ
 PT047KghElWPWcYQ5G3Iuzo5ZLtL7N95gRpwyKVxdaOAXakoUMn2M85ieZ8k9PPznpxa
 aQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684716148; x=1687308148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bKu4gKGvs+WAdhSbwvOc7isenmKfDUb8D+/Pt5dQNBE=;
 b=HQFNJS0jxkfeAD5b1ZNvB1Qv5TGTbjpKc0y20CakK6QSASsgHhHxjUi6ShWH0Euipi
 i5j12ZHhsEQswunpggVkGeJ6JbKtevIs4+mp1ZkB3Hov9WoWvEui13NOS+tk7SbXHsxk
 iEcNm3XMSV+peQdeh76A8d/t3PIIb8GVpdhjtSubqce3dln0IRRR2Nvn9TVOVc1Qpgbw
 eUaqnaX9nTly6i8TMA/w2bgdZknfKkfYEQvzvzUKrp1p+PK/J8+AnR8OdUCIujtW0I0m
 8XrnQwCzOVU5GGpTtLwH8taHdSkzrilbzggcTYHXVDWpPp/cyuEPimHczXl/Nq1Q61gu
 aqTw==
X-Gm-Message-State: AC+VfDzyqDVKOp19ZiBMBHf7j0sL2xfuyxb2a4PD2Y2YjH6s4V20x8dm
 gsr1KZi6ZheZK7cZ4VSqX2x+Bw==
X-Google-Smtp-Source: ACHHUZ6dCYV+20WpcnsMIqMQQkkVm1RftMryyED3QDdJcrj+koY7XSJwaQZR8xc10jieIuEaQzvKow==
X-Received: by 2002:a05:651c:22e:b0:2a7:8b35:8270 with SMTP id
 z14-20020a05651c022e00b002a78b358270mr3432378ljn.35.1684716148455; 
 Sun, 21 May 2023 17:42:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b15-20020ac25e8f000000b004f139712835sm768159lfq.293.2023.05.21.17.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 17:42:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 22 May 2023 03:42:21 +0300
Message-Id: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/6] drm/msm/dpu: rework interrupt handling
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Declaring the mask of supported interrupts proved to be error-prone. It
is very easy to add a bit with no corresponding backing block or to miss
the INTF TE bit. Replace this static configuration with the irq mask
calculated from the HW catalog data.

Dmitry Baryshkov (6):
  drm/msm/dpu: don't set DPU_INTF_TE globally
  drm/msm/dpu: inline __intr_offset
  drm/msm/dpu: split interrupt address arrays
  drm/msm/dpu: autodetect supported interrupts
  drm/msm/dpu: drop now-unused mdss_irqs field from hw catalog
  drm/msm/dpu: drop compatibility INTR defines

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |   8 --
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |   9 --
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  11 --
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  13 ---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  10 --
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   5 -
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   5 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  13 +--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   9 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  18 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  13 +--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  13 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 110 ++++++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  21 ++--
 17 files changed, 97 insertions(+), 175 deletions(-)

-- 
2.39.2

