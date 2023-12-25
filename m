Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31BB81E0BB
	for <lists+freedreno@lfdr.de>; Mon, 25 Dec 2023 14:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D20E10E143;
	Mon, 25 Dec 2023 13:08:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6477B10E134
 for <freedreno@lists.freedesktop.org>; Mon, 25 Dec 2023 13:08:56 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cc259392a6so37730791fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 25 Dec 2023 05:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703509734; x=1704114534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rrAR/dFA4g96DilCitrwfpxd2eb5zoEPG4NTNguHbJU=;
 b=Oa+MSqVWU0iRKKUi9In+1lE/HnftcczWJMgUVaUuEVyBvsQN5lcjwV7bkM/x3w2GoV
 reWgpTqEQzLRFjlhC3A+JLG45EFt2D9ftZHCBdUWI/kmTiuFZDc3cp3MGxcBOmfR3Ywf
 GHeipmKbpTvyEsvWGNORzW/8aAE+Ocf7mB6x2v3IUVwoiH47cOvluymYCNiQdJKbujjm
 WCNEvA/vF1hqLSNZ1KL3GqSANlAqnc34FHRNGwi1vLX7PtsLj3MdtEF/z7iqHI86l7uN
 KQKAMUkKap7VaWdUvi2Yp8qfK2Mdfh6f4sRBiBZoL85FJcD1DYALaV+FtsAqjsyuzcnH
 iMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703509734; x=1704114534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rrAR/dFA4g96DilCitrwfpxd2eb5zoEPG4NTNguHbJU=;
 b=ojry6IEdkOowhy5NE7MuORH4Caojm/W1RDFoDcAjxDIiQmC/Aqv7SmthPAsYIodxFe
 Oh1+548woEBJVoYlJcRuB31LdB3QpJagVuoDMOSxkJWlhU8Y0arTwOjalIVgQ0NCI58b
 xIII2ytE1Xs6KO1RgMu0Vh0TrYEBT+HSIu7vHDgHCSCzFa0nSsntDv10vngicIH7ptwd
 iP79LWHYFi50T3awPad3LqRKoiP5ihFdCYfLykOO5xK/lF7rTg+zCmqjlzokWpB7k0vh
 FX9zsM6FHbt4aCrgJOpX1P4PMWsMXKMEjtacrYH1kvPrfsXrhyhhhM5o7Y8zxPmUaIJn
 CFyA==
X-Gm-Message-State: AOJu0YxmK9G0MVfRXLDpEUyGtCq6lzlW429WyUOgFhtoZNKNJ/4TqBXq
 si/WJqPQB7d9QRRXCuZnEpWlotBacvnTUQ==
X-Google-Smtp-Source: AGHT+IE0tj28bje8aWKNl3TYJJNRjyVn6TReeqskiSHh8g/35ShrubXo76hswGkCfAefmRCLy/LLQA==
X-Received: by 2002:a2e:b754:0:b0:2cc:9d5d:7182 with SMTP id
 k20-20020a2eb754000000b002cc9d5d7182mr2108643ljo.2.1703509734243; 
 Mon, 25 Dec 2023 05:08:54 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a05651c015300b002c9f75a48fcsm1030207ljd.16.2023.12.25.05.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Dec 2023 05:08:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 0/5] drm/msm/dpu: remove
 dpu_encoder_phys_ops::atomic_mode_set callback
Date: Mon, 25 Dec 2023 15:08:48 +0200
Message-Id: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The dpu_encoder_phys_ops::atomic_mode_set() callback is mostly
redundant. Implementations only set the IRQ indices there. Move
statically allocated IRQs to dpu_encoder_phys_*_init() and set
dynamically allocated IRQs in the irq_enable() callback.

The writeback backend of the dpu_encoder is the only user of the
dpu_encoder_phys_ops::atomic_check() callback. Move corresponding code
to the DPU's drm_writeback_connector implementation (dpu_writeback.c)
and drop corresponding callback code.

Changes since v2:
- Rebase on top of linux-next
- Also incorporate the dpu_encoder_phys::atomic_check series

Changes since v1:
- Split trace events into enable/disable pairs (Abhinav).

Dmitry Baryshkov (5):
  drm/msm/dpu: split irq_control into irq_enable and _disable
  drm/msm/dpu: split _dpu_encoder_resource_control_helper()
  drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
  drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
  drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 94 ++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 15 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 95 +++++++++----------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 59 ++++++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 88 ++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 74 +++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
 9 files changed, 270 insertions(+), 224 deletions(-)

-- 
2.39.2

