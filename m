Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A08A4ECFA1
	for <lists+freedreno@lfdr.de>; Thu, 31 Mar 2022 00:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE2610E25F;
	Wed, 30 Mar 2022 22:30:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB87310E1AE
 for <freedreno@lists.freedesktop.org>; Wed, 30 Mar 2022 22:30:11 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bu29so38400156lfb.0
 for <freedreno@lists.freedesktop.org>; Wed, 30 Mar 2022 15:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JtbqvUsqEzE2g6uW/TT035ax0kBfyahmOob6FsqwcPY=;
 b=hQPWu/OIb+Zegy4kT+8Em3QCWjiXaFxFPWp5W2WJaaPEXiGblSSVNAXq8q7uOJtC47
 eJ06zbMxbNw0E/hPe5Yjp02P12DRRSmUDfhM+CttqoHsY2JzvzAmyf3wiHVPDeIoKpGw
 Gq66rgG3yK108wL0ib2j/2l2m9zypCghXh1zONv+9wNSCcx7a7214v2XygnOF3Qhh53D
 muKngZCaFu3fTimsAwa7EJL10OzYpzB9Et5MUbfTxCCjOrxUViMBWYblP13jvhXdzrc5
 a6uFuEzBRgypjI7nBMWTbFx2vY2sel6pPBIfROrWd0A1tkHllnzpARSS2BurI8UK71sO
 iNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JtbqvUsqEzE2g6uW/TT035ax0kBfyahmOob6FsqwcPY=;
 b=lN0mFeFjVm2fiQ4bBQKXus/Mj3ezGplk043zDAf77ks1nZv2uezv+0O/T6bDsmoj5k
 TPbLp3QAiPwlIuhwPbrR9WxU2rHcQgxfa2rUVHYekXNfBM0MXs6H2HlB5mJ6caDubaRo
 nB34P1OCKnDe/GhddNWAYfIYKbJ7KJSHlV7oL5qFTBytgSxjqMt1HRIoJFs4CJPxwcyn
 UTDqkDgXJ25B/WXliBrxUIEWVXnMp3/hbVLZ3KuQUbhnKVpJGf/5bkAmUIIs1w/ME6tl
 MGAX71Pbn4U+nQXsOncKf3sFgIsqAQwp7pbTWSY1edNtS99UjPKGzKYIzR/EZgK6LdCA
 W7Ow==
X-Gm-Message-State: AOAM5307iavqqDJPmJBZlePSsFvN+sCAiMQXcuPeerRKMnVTpxODN5RD
 rT1+xvA+alfA6yd92XrRpDjivg==
X-Google-Smtp-Source: ABdhPJzG/f64ACIg2eEZE7Cx4oJHdTia/6Z35v5jnReSD+gy9dIQgwNO9KoopCVhR+hFwGsgSOzuRA==
X-Received: by 2002:a05:6512:32c2:b0:44a:700c:4e97 with SMTP id
 f2-20020a05651232c200b0044a700c4e97mr8590964lfg.224.1648679409820; 
 Wed, 30 Mar 2022 15:30:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a4-20020a2eb164000000b0024988e1cfb6sm2521295ljm.94.2022.03.30.15.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 15:30:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Date: Thu, 31 Mar 2022 01:30:04 +0300
Message-Id: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/4] drm/msm/dp: simplify
 dp_connector_get_modes()
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
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As noted by Ville Syrjälä [1] the dp_connector_get_modes() has weird
on-stack interim copy of the mode. When reviewing the mentioned patch I
noticed that the rest of the code in dp_connector_get_modes() is weird,
unused since September of 2020 and can be removed. This series removes
dead weird code leaving dp_connector_get_modes() simple enough.

[1] https://lore.kernel.org/linux-arm-msm/20220218100403.7028-11-ville.syrjala@linux.intel.com/

Changes since v1:
- Remove unsued ret variable from dp_display_get_modes()
- Add a patch making dp_connector_mode_valid() return MODE_CLOCK_HIGH
  (suggested by Stephen)

Dmitry Baryshkov (4):
  drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
  drm/msm/dp: simplify dp_connector_get_modes()
  drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display
  drm/msm/dp: make dp_connector_mode_valid() more precise

 drivers/gpu/drm/msm/dp/dp_debug.c   |  2 --
 drivers/gpu/drm/msm/dp/dp_display.c | 12 +++-------
 drivers/gpu/drm/msm/dp/dp_display.h |  5 +----
 drivers/gpu/drm/msm/dp/dp_drm.c     | 35 +++--------------------------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +--
 6 files changed, 9 insertions(+), 50 deletions(-)

-- 
2.35.1

