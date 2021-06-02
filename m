Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5727439959C
	for <lists+freedreno@lfdr.de>; Wed,  2 Jun 2021 23:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B83F6EE5D;
	Wed,  2 Jun 2021 21:53:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D915B6EE5D
 for <freedreno@lists.freedesktop.org>; Wed,  2 Jun 2021 21:53:00 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id s14so2399865pfd.9
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 14:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ntQT2pZR3LJHS6LUFfJ+Qm+vXWzrrp5nCQGAwU1JB0=;
 b=hcmQBsf5LoocnIf8a/0Ca0mlBQCzY7GjMf15ueTI3PEpj3E/TBi5Q4d6mn33d2MJoP
 o9USDMmnfkAKRC+HQmjPpNpm9ItolNHZ1gLqyQzuO6A7JT97S8N4Sxu9N2mExjgaVVfG
 /6iv9Wdl/GeNVu3eeoA7T88o2yYmvWwncmi+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ntQT2pZR3LJHS6LUFfJ+Qm+vXWzrrp5nCQGAwU1JB0=;
 b=IVA6eu+FMLdBU0dz2sn2hgDd5YBVjr9BfozhMNRrDinPKeEogb9Kb13JlXbMdtnBPS
 hxBBTNAU5v5JRLb1EpNhjnq4458HiA1FkVfdYrHUB4t+7P6lPnWJG6GoYyOjS903rvZT
 BxFHktZvHbWETdEXNYYeAeERmb7B2eRQjDp3TeYzXLLZHjlpcpxVuEIZHkTztTswp665
 qjSWO4UtdIjT+/JQU+rzqyep8ZOWQCxu8MHrSyotl5MybDXwOgQfXFSQ2U7FjhoCONVD
 uFNkOe3q82Ik5eOpaqosydH9GpwywvLstBVrXZvib/wVwYHNA1H1fwVSpcxT0pOC2uy0
 38Jw==
X-Gm-Message-State: AOAM531Iu0TxlhIdRfxMMIzGtm2HHF8FTUc7S+eU0X2/MAF+8JiNCY2f
 fGsJakpT3/ZmxKftS9o/lRtl8Q==
X-Google-Smtp-Source: ABdhPJzeQ5qvww5ymAg1YzwWIo2ptK3WZmfCNVj/MFd8/a2Itlvi0o2veU1w5SbMD5HCoN+TggIUFg==
X-Received: by 2002:a63:1b52:: with SMTP id b18mr8618637pgm.263.1622670780419; 
 Wed, 02 Jun 2021 14:53:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 60sm338761pjz.42.2021.06.02.14.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 14:52:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Dave Airlie <airlied@redhat.com>
Date: Wed,  2 Jun 2021 14:52:49 -0700
Message-Id: <20210602215252.695994-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/3] drm: Fix randconfig link failures
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 kernel test robot <lkp@intel.com>, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Linus Walleij <linus.walleij@linaro.org>,
 Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

While tracking down spurious "orphan section" warnings on arm and arm64,
I needed to fix several other issues that it seems other folks have
tripped over before.

Here's the series that fixed everything for me...

-Kees


Arnd Bergmann (1):
  drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency

Kees Cook (2):
  drm: Avoid circular dependencies for CONFIG_FB
  drm/pl111: depend on CONFIG_VEXPRESS_CONFIG

 drivers/gpu/drm/Kconfig       | 2 +-
 drivers/gpu/drm/msm/Kconfig   | 3 ++-
 drivers/gpu/drm/pl111/Kconfig | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
