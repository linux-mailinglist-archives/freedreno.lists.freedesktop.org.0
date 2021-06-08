Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A65039FFDA
	for <lists+freedreno@lfdr.de>; Tue,  8 Jun 2021 20:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068B96EC36;
	Tue,  8 Jun 2021 18:38:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B1C6E204;
 Tue,  8 Jun 2021 18:38:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso2557005wms.1; 
 Tue, 08 Jun 2021 11:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=0CZ6zsGDL077ByflUrLGblxh/3X5AA+P2DAAGI3NXok=;
 b=sh0LqyQtNIoetbCxFUgG84dH7ZbOYOa62Ty1uLs4FCfZ1ubBk/A+6hOml0hlDrdptD
 5gxXQu+GevHgG5IvY+WbYbW1WZfiiOujM1wyNvP6N1JecArV+Hk9ZXM00q4V+TmsQSEp
 W4Xex8rsdScBOLi/gkcLhPHz29z2t2rlr7xtH0tS/S9jhRve8vxQSI5WKFj+oW8Xkjkr
 ePuOvRhVB54d6M7rcpa9Umt20eIqz9kWa63oFuSJOca/IjQcWnk5kDZfVrIGIdRrxttN
 24eMbbMcPqlYwHnTHCb0ZFyO2iBMCOpGaS3eQ5zfo3t+Z8hVIxUvj8RgiQa/4eRY1YvL
 pkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=0CZ6zsGDL077ByflUrLGblxh/3X5AA+P2DAAGI3NXok=;
 b=KuKpUaDcI58HYyP166ObTgythMkglXIN9aoo/02T2xoLz0q9yzU/83a90mCKV8GRIJ
 b2P/9XEJu4wak1pB1edL+YFab9a/2nGe+BcKvL5QQlPJ0kFNZebfBHzaipOPO4cOXiLg
 Gznx3yBMXCjtyK+jDnA7EY7Nlya4TUWlG++FEwkF1hUjYMLrqvG/WitqV9WvSv5B9INb
 4BfasLXagLKAvcauX9nptTauU54ncRnRgtH5DGIhXw9zHyCje/0coAS2UkyU5TP4iYtZ
 3oro/FQlUoIaL/QnMr5x32qF6Mv0wp/hraH7Wwihl+4CEwtmGzflvbhGksPx/zyJWFtH
 BQQA==
X-Gm-Message-State: AOAM532Mi6yntaQHwmFKR+mOLdCBvaDL1426U8o+3qiXCK1B7Pta3F1G
 1R4Fzjt8B3AUOvTVvI19c41mkwMI1ZmJGFa2L52YgkqxjOM=
X-Google-Smtp-Source: ABdhPJxirZxedUoMUQETD/MhwZmMGfn6CphqaZt114BgCS8pQ+KfftTNOsK/xpk8l3/hTzrnzM6lvKzLDPEs4UxwBfE=
X-Received: by 2002:a05:600c:1c84:: with SMTP id
 k4mr5862126wms.164.1623177484616; 
 Tue, 08 Jun 2021 11:38:04 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 8 Jun 2021 11:41:58 -0700
Message-ID: <CAF6AEGsyenBs3hmEzPZ445JWpCaUR7Pm1e232oOYMmdpgovKkw@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [Freedreno] [pull v2] drm/msm: msm-fixes-v5.13-rc6 for v5.13-rc6
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

A few late fixes for v5.13

The following changes since commit f2f46b878777e0d3f885c7ddad48f477b4dea247:

  drm/msm/dp: initialize audio_comp when audio starts (2021-05-06
16:26:57 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git msm-fixes-v5.13-rc6

for you to fetch changes up to ce86c239e4d218ae6040bec18e6d19a58edb8b7c:

  drm/msm/a6xx: avoid shadow NULL reference in failure path
(2021-06-08 11:26:45 -0700)

----------------------------------------------------------------
Alexey Minnekhanov (1):
      drm/msm: Init mm_list before accessing it for use_vram path

Jonathan Marek (3):
      drm/msm/a6xx: update/fix CP_PROTECT initialization
      drm/msm/a6xx: fix incorrectly set uavflagprd_inv field for A650
      drm/msm/a6xx: avoid shadow NULL reference in failure path

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 155 +++++++++++++++++++++++++---------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   2 +-
 drivers/gpu/drm/msm/msm_gem.c         |   7 ++
 3 files changed, 122 insertions(+), 42 deletions(-)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
