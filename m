Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9454F4819
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 01:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D56C10E2E6;
	Tue,  5 Apr 2022 23:51:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D9910E2E6
 for <freedreno@lists.freedesktop.org>; Tue,  5 Apr 2022 23:51:02 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z12so1165101lfu.10
 for <freedreno@lists.freedesktop.org>; Tue, 05 Apr 2022 16:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7YSYDjPb6rkMrUy2ND+BWShKjgnutY8vFHmoniTCXNs=;
 b=oUMaw5vOO5xHZB0ujTF7+xO0htbaaZj1/WNJHYE/P8urqcDn2s8bz79kbFXcBeqLce
 biHoxfW5KopBRgHA3vrpXUrOowoFXtet80WKRIYEIOZAYtJRwOJGoOTrNLrY1/RXGEJB
 K/TKHAS2vmENqVrWHtE5C/BLrUtLrMYZVDKbs9D4BgKh88mkYA5sD1L2i+HpbvIUu4KA
 gUlBmMfxjyStiQxUExiGY8if4v7i0Yr9xOxtaM9qZmE5+2Jfb5jrSHoqy3opx53MDnl+
 fLMi8dkd2QV7voWs6Gslw1sUGRBd5Urcrl04hj8ts+xa+E1Nmm+CV6He5lilj6opmzs3
 3T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7YSYDjPb6rkMrUy2ND+BWShKjgnutY8vFHmoniTCXNs=;
 b=peNIPQ9E4YvxPzTFC1VKuMuOKg2Z5UhyMbj0Jdq9QkmzariZoiFInetDwPYkDHZTFK
 lOLl8g+h0lR1obmUdzwj0doXGQKIPMCDMk3QE/6DCbyuQ7dmxTw6IEwe17YUNv4w+s8z
 6YH2F0o/l5XdCMI4EiW+rf0Gy/jfp2tBhru0gMcLqczn/O8CQpap8qaDJCy8L1wOSKrt
 ji5UIcUnVPJjfAY/aBclJsDtGwt4zmGowQ8BXtJFY9OWDdPEnf+acJkRhAP+W0+gv7co
 wG1/WegBYNJYBwqP+ztVb3cLQ86vZoR4dEYCsG9JmLwEaXZUaZyo9AvlAaHhMJyKWtXN
 nDrw==
X-Gm-Message-State: AOAM530o9eQ4+b5mdwcT/D3pqo7FOU8CJMrCXMIsCvdstnJ3V5XGcB1G
 4HQHOsLJIeQfP40X9pTTQPMIPQ==
X-Google-Smtp-Source: ABdhPJzNHlLedXR6pzP6xqaOfB82l/XCYzRdWX7WDvO/+hf1SMfxV98iC7FNMSzXJUdhbhpipNuK5w==
X-Received: by 2002:a05:6512:22cd:b0:44a:6d2c:8b9f with SMTP id
 g13-20020a05651222cd00b0044a6d2c8b9fmr4189272lfu.142.1649202660661; 
 Tue, 05 Apr 2022 16:51:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f26-20020a19381a000000b0044ad7a29b4csm1645280lfa.37.2022.04.05.16.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 16:51:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  6 Apr 2022 02:50:56 +0300
Message-Id: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/3] drm/msm: remove DRM mode setting object
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

Dmitry Baryshkov (3):
  drm/msm/dpu: remove manual destruction of DRM objects
  drm/msm: loop over encoders using drm_for_each_encoder()
  drm/msm: don't store created planes, connectors and encoders

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 50 ++++++------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  7 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 ++++----
 drivers/gpu/drm/msm/dp/dp_display.c      |  2 -
 drivers/gpu/drm/msm/dsi/dsi.c            |  1 -
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  1 -
 drivers/gpu/drm/msm/msm_drv.h            |  9 -----
 7 files changed, 20 insertions(+), 67 deletions(-)

-- 
2.35.1

