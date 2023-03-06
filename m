Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFD36ABB03
	for <lists+freedreno@lfdr.de>; Mon,  6 Mar 2023 11:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B84210E219;
	Mon,  6 Mar 2023 10:09:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F95510E1EB;
 Mon,  6 Mar 2023 10:09:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E84B0B80D78;
 Mon,  6 Mar 2023 10:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864EAC4339E;
 Mon,  6 Mar 2023 10:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678097358;
 bh=rgz7DkiR3NGSdYC6VIDyJIROjaHJdAcLrZHovIKQqTY=;
 h=From:To:Cc:Subject:Date:From;
 b=rt0Rn6T3lEfqba/Z5G+GS52LAph5WQwapMERJL+R1JUS7rpu7cd5CAr+ebFzIQbAE
 c/LoQffAl8hgg1QxEPWeVyefKugN4sPCm2Zw+MNdySXEXaIOyNa3RxQJ6nI0/7FFd0
 Inbw+1NarVhguGtegVLtK3JhG5pkOyCuxa9LcsjUpujzRmMyOhS4hNodFtAWAkJF9l
 XJxI4QPpAa+9jP2V/8Hv6Y1hHlyvAcvRz8RVnuCEEi6y31AOiwLRpUt0/eILMF/838
 pF19Hfx5ScWRpvIG6EJ+Vl1qf9dvvAhNGEnl7TgzGQTZ9BxnSLlLYJDsDfN/jy6HHV
 DS3dcArX4gpzQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1pZ7n4-0007QY-TO; Mon, 06 Mar 2023 11:09:58 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon,  6 Mar 2023 11:07:12 +0100
Message-Id: <20230306100722.28485-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 00/10] drm/msm: fix bind error handling
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

I had reasons to look closer at the MSM DRM driver error handling and
realised that it had suffered from a fair amount of bit rot over the
years.

Unfortunately, I started fixing this in my 6.2 branch and failed to
notice two partial and, as it turned out, broken attempts to address
this that are now in 6.3-rc1.

Instead of trying to salvage this incrementally, I'm reverting the two
broken commits so that clean and backportable fixes can be added in
their place.

Included are also two related cleanups.

Johan


Johan Hovold (10):
  Revert "drm/msm: Add missing check and destroy for
    alloc_ordered_workqueue"
  Revert "drm/msm: Fix failure paths in msm_drm_init()"
  drm/msm: fix NULL-deref on snapshot tear down
  drm/msm: fix NULL-deref on irq uninstall
  drm/msm: fix drm device leak on bind errors
  drm/msm: fix vram leak on bind errors
  drm/msm: fix missing wq allocation error handling
  drm/msm: fix workqueue leak on bind errors
  drm/msm: use drmm_mode_config_init()
  drm/msm: move include directive

 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c |  3 -
 drivers/gpu/drm/msm/msm_drv.c                | 67 +++++++++++++-------
 2 files changed, 44 insertions(+), 26 deletions(-)

-- 
2.39.2

