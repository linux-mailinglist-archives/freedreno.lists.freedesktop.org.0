Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6C93FB9FA
	for <lists+freedreno@lfdr.de>; Mon, 30 Aug 2021 18:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721CF89C6B;
	Mon, 30 Aug 2021 16:18:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC9289BF0;
 Mon, 30 Aug 2021 16:18:07 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 j4-20020a17090a734400b0018f6dd1ec97so336993pjs.3; 
 Mon, 30 Aug 2021 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nJ/vHQ8m8iLAMD8+ZyhKRlQPyo+UcB05ujjGTF6TT/E=;
 b=Nw1jF6bKyxGf/sNll9xkljP7pmBCqi6jKbC/TW6GlQ+NG8Q6FeBAX6t5bx7b8l4kLB
 ica+QyXL1bbvygEe4YbwFdfk/nNw/yanXRuSxymVwK2dVM92y8aN1PyxcyUf25G6rpy7
 Jgy2Mye4eCnB6rbbDgTEluVmj0bv6ulxf5OpfCoz3Nf2Q42n5YHm+8B/mwKMDhU2ZuMo
 0/brg5Cyxr1Ym/hty6Le+qbfz+oBltwfo/KJc/Ohtr1JqqcK+O78qDWsrIfxdXmvKdxV
 dVvbXa0dJnR23Z9emcggHAzssSXXBrY8eyJiA/uf5RWln15455pTKaLftAFvWLBHuJWp
 WjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nJ/vHQ8m8iLAMD8+ZyhKRlQPyo+UcB05ujjGTF6TT/E=;
 b=uYRSE2whgQ/U1A4VUnqGUTRU4OcxVkFFn2t1zCdgoxe2zlzxj3ZShgkL8wdG05Jeww
 cukw28Q/cWd5lbkMPFZ8EERgb/UEkalcXH0z1aMPcW6psA8xXwD1jsUsTaBmgTkUbq8m
 2l0Zo3rsoym6yIZjbD50cm6+2OnTbMKqDEnWZZx0g568/s0QFmy2SGd8nwFKDYn7xV5O
 EShmTUYLyhvS3doDOn+pdTEd6JMZUb8XEV/heb6cUQK+qZCaVZLIy4q1PAKdhXJ+EeGu
 cctNoWBBKT/l7yg5q8durFiIy0AIS5kNV4qP9NDjPDs4hp9FpfWCYyiht8M3URP+KdFU
 wYWA==
X-Gm-Message-State: AOAM533rfHfMTgUVF63oC19z0GxtmobHDbmoqxxC68jGbIYVJ4pld3UJ
 fxxKewz5XPFzw4MEYqXdhf0SY3MCnOk=
X-Google-Smtp-Source: ABdhPJx+yu6yMj8qxSjwRpeLSgzzPPwBao5uugNAbpmeQ5HlJjIG/0cZTjdEfzPBdNf5LZOYeTLIdw==
X-Received: by 2002:a17:90a:ae12:: with SMTP id
 t18mr15907293pjq.211.1630340286911; 
 Mon, 30 Aug 2021 09:18:06 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j6sm16932844pgh.17.2021.08.30.09.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 09:18:04 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Petri Latvala <petri.latvala@intel.com>, Rob Clark <robdclark@chromium.org>
Date: Mon, 30 Aug 2021 09:22:29 -0700
Message-Id: <20210830162232.1328594-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt v3 0/3] Initial igt tests for drm/msm ioctls
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add an initial set of tests for the gpu SUBMIT ioctl.  There is
plenty more we can add, but need to start somewhere.

Rob Clark (3):
  drmtest: Add DRIVER_MSM support
  msm: Add helper library
  msm: Add submit ioctl tests

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/drmtest.c                                 |   3 +
 lib/drmtest.h                                 |   1 +
 lib/igt_msm.c                                 | 211 ++++++++++++++++++
 lib/igt_msm.h                                 | 142 ++++++++++++
 lib/meson.build                               |   1 +
 tests/meson.build                             |   1 +
 tests/msm_submit.c                            | 194 ++++++++++++++++
 8 files changed, 554 insertions(+)
 create mode 100644 lib/igt_msm.c
 create mode 100644 lib/igt_msm.h
 create mode 100644 tests/msm_submit.c

-- 
2.31.1

