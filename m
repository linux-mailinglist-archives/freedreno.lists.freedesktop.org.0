Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B424A80342B
	for <lists+freedreno@lfdr.de>; Mon,  4 Dec 2023 14:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571B010E1CB;
	Mon,  4 Dec 2023 13:15:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C49510E1C5
 for <freedreno@lists.freedesktop.org>; Mon,  4 Dec 2023 13:14:58 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50bdec453c8so3069195e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 04 Dec 2023 05:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701695696; x=1702300496; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8FXfNmjk0/FPoln77FIQlKYMoeFsew2x/wYq+84u+hg=;
 b=irL6GP2su9IYR3pNRvNxUusJCEIwaLLiEIV06+7HkSbt0S8xIo4/qSFmpMI5mhXHlA
 HBTsB87zVzMjJfl87nMq5Lv2OKokOxVwBf/dqeAfA3JTl2vFzHoRa6s8/LXuOscTIX1h
 K83yr7XsGpGDi1Jc6hq74wfzj/rMq/hwRRshHfW31e/geWcHRmQhr+tpixQdgvlXRgl6
 HNevKDK6j4NwbrEdszbNNeXrH7uRGsVbheuHZBHNjDCLJAUw0o7wuvLx10b7n3J2bd2C
 d/ZYxMun/h2oXUT7peMuujnVgEQrgyjYPCQdrmCBYFSJShXOmQtp+h6OG6naEvckHDrp
 488Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701695696; x=1702300496;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8FXfNmjk0/FPoln77FIQlKYMoeFsew2x/wYq+84u+hg=;
 b=BuysU6t0Iuqu6QOwzin+2+DF8tZBgLEqRy6FR9W/d9vYWU1JwnCN4eQ78+a7Q7WMhS
 WZJOEWPffBSlKiCj5Au890brZUJA4lOy86DNAvWJo+lYMDiBnuyuHc5OJN7CVlv9B1QI
 skS0Brg8y88FUHKbiZ3iRpVAJwzVEekqerx9ZmfogId0jwTn8Pje/yP4gby4gjCkL4G4
 v0kyY0/qDolMe45yz1ysfZmKnWgTxy0O1heC0Mn+I12T23R15uoJoBp3PQYfInaZWxeQ
 6+fowfAGqo3qk5HZ2xnB+FKm+nnQXhA6zf+fDXmI0ProOAdmsB/MmspCXePNcNLRjZds
 RvRQ==
X-Gm-Message-State: AOJu0YyAfyQngehYuhNqYuQwyR9jjzsfazlOYJ39rkwE57PdsgfM1zl1
 pym7a/bcj01aB6HfX6fj8moSfA==
X-Google-Smtp-Source: AGHT+IGD0A8642jBm/8iajKiw6EkrNIqrKxuiUZkj2SDjATgXK7NJGhtxWQa5GEz/hYoM63L/w1G1g==
X-Received: by 2002:ac2:5f5a:0:b0:50b:f792:3265 with SMTP id
 26-20020ac25f5a000000b0050bf7923265mr732882lfz.123.1701695696448; 
 Mon, 04 Dec 2023 05:14:56 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 br25-20020a056512401900b0050bc59642casm1251924lfb.286.2023.12.04.05.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 05:14:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Mon,  4 Dec 2023 15:13:47 +0200
Message-ID: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/7] drm: revert solid fill support
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Altough the Solid Fill planes patchset got all reviews and
acknowledgements, it doesn't fulfill requirements for the new uABI.
Merging it was a fault of mine.

It has neither corresponding open-source userspace implementation nor
the IGT tests coverage. Revert this patchset until userspace obligations
are fulfilled.

Dmitry Baryshkov (7):
  Revert "drm/atomic: Loosen FB atomic checks"
  Revert "drm/atomic: Move framebuffer checks to helper"
  Revert "drm/atomic: Add solid fill data to plane state dump"
  Revert "drm/atomic: Add pixel source to plane state dump"
  Revert "drm: Add solid fill pixel source"
  Revert "drm: Introduce solid fill DRM plane property"
  Revert "drm: Introduce pixel_source DRM plane property"

 drivers/gpu/drm/drm_atomic.c              | 148 +++++++++-------------
 drivers/gpu/drm/drm_atomic_helper.c       |  39 +++---
 drivers/gpu/drm/drm_atomic_state_helper.c |  10 --
 drivers/gpu/drm/drm_atomic_uapi.c         |  30 -----
 drivers/gpu/drm/drm_blend.c               | 133 -------------------
 drivers/gpu/drm/drm_crtc_internal.h       |   1 -
 drivers/gpu/drm/drm_plane.c               |  27 +---
 include/drm/drm_atomic_helper.h           |   4 +-
 include/drm/drm_blend.h                   |   3 -
 include/drm/drm_plane.h                   |  90 -------------
 include/uapi/drm/drm_mode.h               |  24 ----
 11 files changed, 86 insertions(+), 423 deletions(-)

-- 
2.42.0

