Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EF170651C
	for <lists+freedreno@lfdr.de>; Wed, 17 May 2023 12:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ABC10E3E5;
	Wed, 17 May 2023 10:28:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8E710E3E1
 for <freedreno@lists.freedesktop.org>; Wed, 17 May 2023 10:28:10 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ac770a99e2so5214741fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 17 May 2023 03:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684319288; x=1686911288;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UaapKQTgqt42Y+aSTlZRYOojhuaRvMeWFJhrnG9fR4Y=;
 b=g0Fb+8BqqT9a+uCaxy9zuhaDOeYvt66sSthalNiZ0pB8MVel/mj3CQlOvGGvtWNq9u
 6oNvodm1jHFvBxapZuaCZgkUNAoVJb3gjR0QKmwvULdGCvUr7OA0b4brEV0Z9qFIaG03
 N0AQV+7Upc0VAfTY8BWJDYdvl7wtrQUaMUX5a38grDqyL8nGLzRGrtudNgt8NaZMraKJ
 pbJbAhBgQDTsUwBRGlvqoOZP1qGp8ETTUP9iTL0g1DaLW/XjT/QYzy3wm+s9xB/4NRxX
 Sz/9MSF+eOrHNGWr8kqtDdB511hnBVQ7++h7H+6YBs7RDG/KYiAsnx0up5vxpO3+dV/h
 KABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684319288; x=1686911288;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UaapKQTgqt42Y+aSTlZRYOojhuaRvMeWFJhrnG9fR4Y=;
 b=MtMr881JTVBAxxjMkO2Y+T1JIK4AB9Rdooed+IUOv8fc2s4If/LgTQiPDNQd5VraNp
 f6HLRVfSzxhPDC+EwUer/KyUsVr/+EbMzvC88AHsQRnSTLt06bGQLcNujL767ktwCawq
 C7jvDamOvmE0EW17LX9gEWG3CTFi4WaVJ+wAfrsPg2mDLI0gMQCKdnP35yTfpd2doXNy
 N0CPEFwBXkzzWv1VOpI5xELK+uGfvnjoBTQof3jVFXid+cixP1LrRJBOxt1ydlDRTTRy
 I+n4E7+rMQjRM2/kkqDmFnaJ+yXqxO040OA9kB/iRsCAxlh82I2xEvovK+M4AkIiKUwl
 ZrNg==
X-Gm-Message-State: AC+VfDyrzE6KJKoIpTy9R55d3/JVSAmxejiU10gsxWAVnZ25pH4M3zYV
 9E4YvZ+0PPeY7AqEqqmzUzpuLA==
X-Google-Smtp-Source: ACHHUZ6YthURubL5hbSqVlTDf6PEgfpMFUcCSadv2rtJ6KlbB9mdng0+Mjk122ro12zyj8Don09oiw==
X-Received: by 2002:a2e:a3c9:0:b0:2ae:e05e:76b4 with SMTP id
 w9-20020a2ea3c9000000b002aee05e76b4mr3167811lje.28.1684319288591; 
 Wed, 17 May 2023 03:28:08 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 e16-20020a2e8190000000b002ab017899e8sm4495356ljg.39.2023.05.17.03.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 03:28:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed, 17 May 2023 13:27:59 +0300
Message-Id: <20230517102807.2181589-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 0/8] drm/i915: move DSC RC tables to
 drm_dsc_helper.c
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Other platforms (msm) will benefit from sharing the DSC config setup
functions. This series moves parts of static DSC config data from the
i915 driver to the common helpers to be used by other drivers.

Note: the RC parameters were cross-checked against config files found in
DSC model 2021062, 20161212 (and 20150914). The first patch modifies
tables according to those config files, while preserving parameter
values using the code. I have not changed one of the values in the
pre-SCR config file as it clearly looks like a typo in the config file,
considering the table E in DSC 1.1 and in the DSC 1.1 SCR.

Chances since v6:
- Fixed a leftover of kind/type conversion (Suraj, lkp)

Chances since v5:
- Fixed typo in patch #2 commit message (Marijn)
- Reworded/fixed RC table comments to mention DSC standards and C model
  versions (Suraj)
- Renamed enum drm_dsc_param_kind to drm_dsc_param_type (Suraj).

Chances since v4:
- Rebased on top of drm-intel-next
- Cut the first 8 patches of the series to ease merging. The rest of the
  patches will go afterwards.

Chances since v3:
- Rebased on top of drm-intel-next
- Dropped the msm patch to make patchset fully mergeable through
  drm-intel
- Made drm_dsc_set_const_params() ignore rc_model_size, picked up
  drm_dsc_set_initial_scale_value() patch by Jessica and switched
  intel_vdsc.c to use those two helpers.
- Added a patch to make i915 actually use rc_tgt_offset_high,
  rc_tgt_offset_low and rc_edge_factor from struct drm_dsc_config.

Chances since v2:
- Rebased on top of drm-intel-next

Dmitry Baryshkov (8):
  drm/i915/dsc: change DSC param tables to follow the DSC model
  drm/i915/dsc: move rc_buf_thresh values to common helper
  drm/i915/dsc: move DSC tables to DRM DSC helper
  drm/i915/dsc: stop using interim structure for calculated params
  drm/display/dsc: use flat array for rc_parameters lookup
  drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-SCR) parameters
  drm/display/dsc: include the rest of pre-SCR parameters
  drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC parameters

 drivers/gpu/drm/display/drm_dsc_helper.c  | 1006 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c |  443 +--------
 include/drm/display/drm_dsc_helper.h      |    9 +
 3 files changed, 1062 insertions(+), 396 deletions(-)

-- 
2.39.2

