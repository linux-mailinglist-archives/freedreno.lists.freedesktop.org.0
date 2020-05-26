Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A661E19CE
	for <lists+freedreno@lfdr.de>; Tue, 26 May 2020 05:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6667989CD3;
	Tue, 26 May 2020 03:22:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD30E89D2F
 for <freedreno@lists.freedesktop.org>; Tue, 26 May 2020 03:22:41 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id f18so2484738qkh.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 May 2020 20:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=irxvBr3fhjh3o4PcQX5WrXrjZ+soB6XClWrdckT/PEg=;
 b=wmMfYz4Q49KJhfEacTGOCEZGd7yE3D0nE8Xn5qM/BcmKBnqiZ6B7luz3x8cSBRfwTC
 3/UZNtYoswmTXLHvaHCPwGjCMMI/nfBNbClpHanLQhJ6coFId0GsNjsICZAyGj6Ca7hY
 0aQ9bcBvpbtTHKFmKmHY6lkFfbQT8C+DVZNLH7skIdJysABoMm84FnF6WUs+yYJjlBF6
 5OoMApXdGII3qUGOhb6uIvuiifELzRRIun4gCUSA5CqkgUu2yiRCnb6dkPc2f6U7ZiyR
 T3W7w3AdU5w406o6jibD13vYtURGesBheFcXiu9WWa7YzsAB8hEJ8ZlswFmN9E2eUJe7
 nDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=irxvBr3fhjh3o4PcQX5WrXrjZ+soB6XClWrdckT/PEg=;
 b=LRVniP0dWK8PD1wwuR8DrKdx4e8jRfN+g9K0zSR5xDDAgyyW7hCiXn5nHSp24orE9/
 jEq/nyjAS6yzaBKpo03SZvHGsMuFRWBQUSUJ3MT4SecdkWZiF2cSoyRlqNaOoOabW7SC
 BZU/h2JJ6WJ7Yls+Xxvlv4WrWsCkZSaNHXLGmTg1KyF3KrqpGcgw32TiL/V0P1OIhClg
 SSkc33KJqVAY5ZRDH8dd0YQlkWROt7znkdfnGFtc3gSp0Ir3JdG1tWjmdcul8f95Nu9l
 keuqX56H2LBcLakAFskNI9tNjCNv9QolZ12wemPCOhtctQZH2nXP57CK2K/BSFLQqdNw
 mnkA==
X-Gm-Message-State: AOAM531JzPsQqLF/scZnAo+nO3DxZlk7u00UPDFlmXKPX4F6HSBymYuS
 ZZsbVZwEezo+74dAbPVHxdfG/bU5vjMjZg==
X-Google-Smtp-Source: ABdhPJwcJbeZ44TzgeR1njybd+DRRmfS48J8wtcs0R4IFp7dHY9QeqGiP5i6eANoJ24H0JQXZ7BQZg==
X-Received: by 2002:a37:db11:: with SMTP id e17mr28833862qki.336.1590463360740; 
 Mon, 25 May 2020 20:22:40 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k20sm2530796qtu.16.2020.05.25.20.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 20:22:40 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Mon, 25 May 2020 23:22:07 -0400
Message-Id: <20200526032235.21930-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/8] Initial SM8150 and SM8250 DPU bringup
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Chandan Uddaraju <chandanu@codeaurora.org>,
 Brian Masney <masneyb@onstation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Jayant Shekhar <jshekhar@codeaurora.org>,
 Alexios Zavras <alexios.zavras@intel.com>,
 John Stultz <john.stultz@linaro.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, zhengbin <zhengbin13@huawei.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Drew Davenport <ddavenport@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These patches bring up SM8150 and SM8250 with basic functionality.

Tested with displayport output (single mixer, video mode case).

I will send patches later to add support for merge3d and dual DSI
configurations, and possibly also patches to fix command mode on
these SoCs (note it is also currently broken for SC7180).

Jonathan Marek (8):
  drm/msm/dpu: use right setup_blend_config for sm8150 and sm8250
  drm/msm/dpu: update UBWC config for sm8150 and sm8250
  drm/msm/dpu: move some sspp caps to dpu_caps
  drm/msm/dpu: don't use INTF_INPUT_CTRL feature on sdm845
  drm/msm/dpu: set missing flush bits for INTF_2 and INTF_3
  drm/msm/dpu: intf timing path for displayport
  drm/msm/dpu: add SM8150 to hw catalog
  drm/msm/dpu: add SM8250 to hw catalog

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   6 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 287 +++++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  48 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  18 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |   7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  75 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   6 +-
 12 files changed, 363 insertions(+), 156 deletions(-)

-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
