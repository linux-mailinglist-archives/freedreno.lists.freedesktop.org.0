Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B1E745329
	for <lists+freedreno@lfdr.de>; Mon,  3 Jul 2023 02:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF6410E052;
	Mon,  3 Jul 2023 00:30:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276DC10E055
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 00:30:57 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f86e6e4038so4833641e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 02 Jul 2023 17:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344253; x=1690936253;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yJANRZZIMK5svQNtmMZaMEVV9+AxVN0XsGlXd86Z6IE=;
 b=xc+e9mOdZ3GtvhvAJ/fseS93Odalh8jT60krEfKtrAVCeNqCSk/ceK8qirWlvI6wv0
 cJ0LcVsOniMldBihBqL2NY/2CQ1To0WksFiL1NjvG9Am86vzYYMNZz4/IDKYzxkQ6DMx
 J24DBuV18t2C7V2dxuUCxKF4uO55oHVNvlhw6YdKYekpNmAzypLfFqjEiu/+S23dUBYB
 V2CxytmdXN27tg47sRo+nOD0cOtXjDeP6g4ePi4HdASwhUOjJSVzyWG8QRYCrTU6K5C9
 OWM86FxLuG0DP5N+YD2bLln1kopWMNPdyh1f3ehzBF8GXk0QZGim8kxk5hx20O9R2gcs
 FoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344253; x=1690936253;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yJANRZZIMK5svQNtmMZaMEVV9+AxVN0XsGlXd86Z6IE=;
 b=i2L73VwdsNMEliMgyXEsv4/HMaq2SYrINpHq5HLcRYG5qSXi3e74P42y4SC2greXC8
 mmeB2CETomZyGqoTftrIEqq1fc+0V9+G9Ay+GRsW/a1w4g/HvKngaeg7tO+gMfSVP4s3
 h791FEWuzd+o1wEv1aMQhhZNtsU5KMpi6bd6RJMe9D26l5R05ouqdv9ZGrWA8UIdfXAW
 18eE5C7pNhE/7lo3iwADjB+AtI48sRmue0O3mEdLKEHSVqHLjIbyvFb8eOrTI2CWijIR
 wEoIBTZZwt5tboIqVKEy9RR8QharOVhZz5ooer9uu1RGmpWU1iTTxQ/suSWA3AvM3VAb
 +FYw==
X-Gm-Message-State: AC+VfDy7ajRqJkyh6j4FTwpR1fFlJH2+imTDjN1c3Qh5roe/RmvTtqL7
 gZ5PEQB1h/aYY6pd4ipi28NaKg==
X-Google-Smtp-Source: ACHHUZ4Ohf808GKFowwML3dOzTbtjZyzqRUDdk6LA3Aku3BokN9EK06I6ub/a5yV3idfclvqCZKOcg==
X-Received: by 2002:a05:6512:31d4:b0:4f8:5e4e:52ad with SMTP id
 j20-20020a05651231d400b004f85e4e52admr4152153lfe.23.1688344253120; 
 Sun, 02 Jul 2023 17:30:53 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 n2-20020ac24902000000b004fbb1bc1ae0sm558842lfi.163.2023.07.02.17.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:30:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  3 Jul 2023 03:30:47 +0300
Message-Id: <20230703003051.33361-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/4] drm/msm: move resource allocation to the
 _probe function
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

This patchset was left untouched for almost a year. Let's reiterate it
in attempt to solve the long-standing issue.

As discussed several times on IRC, move display subdriver resource
allocation from kms_init to probe time to let it bail early.

Changes since v2:
- Move even more resource allocation in the DPU init path.

Changes since v1:
- Dropped the applied patch
- Picked in the patch to pass msm_kms pointer via msm_drv_probe()

Dmitry Baryshkov (4):
  drm/msm: allow passing struct msm_kms to msm_drv_probe()
  drm/msm/dpu: move resource allocation to the _probe function
  drm/msm/mdp4: move resource allocation to the _probe function
  drm/msm/mdp5: move resource allocation to the _probe function

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 121 ++++++++++++-----------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 ++++++++++----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 +++++++++----------
 drivers/gpu/drm/msm/msm_drv.c            |   6 +-
 drivers/gpu/drm/msm/msm_drv.h            |   3 +-
 5 files changed, 162 insertions(+), 175 deletions(-)

-- 
2.39.2

