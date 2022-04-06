Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2444F5A79
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 12:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8921410E30E;
	Wed,  6 Apr 2022 10:12:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB80F10E30E
 for <freedreno@lists.freedesktop.org>; Wed,  6 Apr 2022 10:12:50 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id p10so3164707lfa.12
 for <freedreno@lists.freedesktop.org>; Wed, 06 Apr 2022 03:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNQASTvlLKNLD8hR/6/xkEqB3XhYihaOxq6BEyH/MZ0=;
 b=atuQiS5mxF0A6lAnssEBE+S1ASxnrBGHcRwSnMFpHRoBjSDhVfRkxwwRzVahRjk6Kd
 CYfKax7GiZwt/dT34ce2PxX97U9vax8orJomtkNh08SW0wwrRG9LNBHSPcKvp90QE/Nu
 OA7CNTWDuS/A1FhFLqkjMNGp0zo1iNOvsIjISChvcphencilmMlHA27gioK6FaMYevRk
 yxaHouk9KZE9tq3cIqnCJAKdIPmxzOlefnfXq7Poxyu06lnvbaTb78z3qv/JUR7v439w
 O+LEn93cnx88bt4nUAkM73TEzkOmEBf38fFE3WGvi/XRZzhw3QHaJ1WY/qy94YChmR2O
 9sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNQASTvlLKNLD8hR/6/xkEqB3XhYihaOxq6BEyH/MZ0=;
 b=buaXsIm+UgE0f5yX4m7UGrJpfWbFVP4MSis6wHuLXISFkMAB8HTZZIUsBZySZ1rbnm
 BCKv+VFk5D7M96YpF4H4NoS4SXUCfKvMsAqpRNhl+LTteayKmjXK6V83WHnpLzLQ18t0
 znF3RoxEnzOxA97DpZ44GbsHORsudbHpapjNrDKTGWY65eiNP2IYV52I7YTSSMfjp91X
 0TARLwQ4+hLJO019ZwaqGfOLAGP5GNiXWpzm5HmH1MWGHENuFRZ/Sq1in5gDcXk1auwO
 Gxm2beynRfYRtNxPw35UtyPWq4xcOIJ4e5T48nwmuy33TxpNRKHprwyuA47g3uzC5Bdw
 Sk6A==
X-Gm-Message-State: AOAM530eNNzlW5d9weo/pvY47bELIkM/8AB6mGGYnEApMCryMRSkO/t0
 xelnfViOuNHV77A3ernJW9OcvQ==
X-Google-Smtp-Source: ABdhPJzX2vCNyl1ZY1jdgUYMJAG16UJYPGAkYgC0AA1daRXryqUe34e942NN/QJZfTZ+Xv4ynJbxhg==
X-Received: by 2002:a05:6512:10c3:b0:45c:d26a:d5e with SMTP id
 k3-20020a05651210c300b0045cd26a0d5emr5470082lfg.296.1649239969045; 
 Wed, 06 Apr 2022 03:12:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i4-20020a056512340400b0044a310f72f6sm1782154lfr.250.2022.04.06.03.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 03:12:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  6 Apr 2022 13:12:44 +0300
Message-Id: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/3] drm/msm: remove DRM mode setting object
 arrays
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

MSM DRM driver stores connectors, encoders and planes in the arrays
inside struct msm_drm_private. They are not really necessary, as
drm_devices also references lists of these objects. Drop private arrays
and use drm_mode_foo() macros.

Note, the crtc array is kept intact as it is used in vblank handling
code. Maybe it can be dropped later, but it would be a separate
intrusive change.

Changes since v1:
- Also drop MAX_PLANES/MAX_ENCODERS/MAX_CONNECTORS defines (as suggested
  by Stephen)

Dmitry Baryshkov (3):
  drm/msm/dpu: remove manual destruction of DRM objects
  drm/msm: loop over encoders using drm_for_each_encoder()
  drm/msm: don't store created planes, connectors and encoders

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 51 ++++++------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  7 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 ++++----
 drivers/gpu/drm/msm/dp/dp_display.c      |  2 -
 drivers/gpu/drm/msm/dsi/dsi.c            |  1 -
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  1 -
 drivers/gpu/drm/msm/msm_drv.h            | 12 ------
 7 files changed, 21 insertions(+), 70 deletions(-)

-- 
2.35.1

