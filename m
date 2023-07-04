Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0695A7477F8
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 19:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD66710E308;
	Tue,  4 Jul 2023 17:45:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A902D10E16B
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jul 2023 17:45:56 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f766777605so9137519e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jul 2023 10:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688492754; x=1691084754;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6NVP63A5kA3bVBWFMHxu9Ll3AzCjFkGOvC1AhTKo6S0=;
 b=mPxqXiHYbM2soowGCvklymGX0xgtEFNKZco2Giol7Iaqez4s7EY9LdTdQasEQ51xhz
 A9347mX4EcyDsMmo67CLfz+TzAUyQoTx7bUTendr1daGUQSG2z92MJ4GUYbLkOW7dDC+
 dZ+Azk8ZtDc8LHP74/HjQAC4cs30MRMlwrWyfE2V0gNQM41RF5+64dXXfkBPd700edXW
 VdIngYfViBcMU+k8LjmZQ5WPLl5de0tl9VWveYDtO2afKbWdfu8xJqZWyB729nuTB6sg
 Ky3f4KMfdyUrVvVGaa5pY8V7DyMrZ0TQn+8GihfZnIoaa+JPkA5AodvJHVaKLJ/QAaB5
 hgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688492754; x=1691084754;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6NVP63A5kA3bVBWFMHxu9Ll3AzCjFkGOvC1AhTKo6S0=;
 b=PUJ3yLs8NuQwZmBbeU2R1tJhaYk4HNZ60OxB3SxiJACdMzwt2TyQXaQ6DsRXX2F0VG
 tdBg9dC236oQzFj4ciZqmi/rKrfGHMPdI1uDvBxTAZSPDZKW5SfezRnlnjvGnT/nPzhY
 r7cMLZnpjS8144xdo0KaFfTAhhaqr9Kv1b6S5+TT/OZoV/UWFU2CJV+JlHtExRYwf13V
 57+GqaGOJsu4vAZEzSCg3jG334LzMEoDOLX49ZhF9gPrBKVSsNfkRoJYhekhGHnDVL8A
 +WyAfcIzp955zw4Gc+3BJ0CX5sz7y4rjq15abuVNVpDXGkxdEy+aYaHJnr/8lvmhgdLl
 plOA==
X-Gm-Message-State: ABy/qLZH6Z/oYDk1u9swdYFb8Ys9l4uW+yj+jkMo7N3Ocsjmz5Q0CI8T
 oiDw7Wr1Sm8Bqxa02b104a0ESw==
X-Google-Smtp-Source: APBJJlHW1odJg4Bh1+LqhExnDN5SfHorKlztMinWGKGapxRceXAGkdkn7U6Fg8SVrbGPdrhXrjirog==
X-Received: by 2002:a19:e046:0:b0:4fb:82ac:9d23 with SMTP id
 g6-20020a19e046000000b004fb82ac9d23mr9313764lfj.36.1688492754562; 
 Tue, 04 Jul 2023 10:45:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a195519000000b004fb6c61e79bsm4709779lfe.117.2023.07.04.10.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 10:45:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue,  4 Jul 2023 20:45:49 +0300
Message-Id: <20230704174553.216248-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 0/4] drm/msm: move resource allocation to the
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

Changes since v3:
- Fixed MMIO unmaping in the DPU case.

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

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 133 +++++++++++------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 +++++++++---------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 ++++++++---------
 drivers/gpu/drm/msm/msm_drv.c            |   6 +-
 drivers/gpu/drm/msm/msm_drv.h            |   3 +-
 5 files changed, 162 insertions(+), 187 deletions(-)

-- 
2.39.2

