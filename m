Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E674937F07C
	for <lists+freedreno@lfdr.de>; Thu, 13 May 2021 02:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F3B6E5C0;
	Thu, 13 May 2021 00:39:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EC56E5B9
 for <freedreno@lists.freedesktop.org>; Thu, 13 May 2021 00:39:01 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id a22so23557646qkl.10
 for <freedreno@lists.freedesktop.org>; Wed, 12 May 2021 17:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fpaQ5hUDMlQfsG0EH4pHt8PmhSpDBypKIHC4jY8sAL4=;
 b=Ci6WPM/MI3tUHmjkH6us9JM9QQH7+l+yVKYUjvM5yh+Fsiu0cHplcKlKtlLI5kSzzj
 JLwVDzmLTjYIUaShhM24HBfC1wK11jY2D8Mn/eKJo4g6osW5Zp984Jio1l0sbcFPla+o
 z/DKJ6APH7/LGvoIGeBIisEpfd11G6AHh5v/6U7pwzQnBPpjxTI8z1i3X52SZqhsXlmF
 FC31gNnZxxCk+XEq5/5/1RbIaaJAQyy0wc/lClwizGDXyrdizdZh3JkCrwjg2bOpR7E+
 II3+8MC+J460JA8lW9IqNuVVEf5C17iZjSgoxRvfUSaFTSNIRy95Y1AAyBHtJK/IXaVa
 BKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fpaQ5hUDMlQfsG0EH4pHt8PmhSpDBypKIHC4jY8sAL4=;
 b=lDpZs4kbinV5PQLRASvkR4Vg/qqCrHxoUsYUaTge0nKmsOQ8JvU0id96QXSC/iCzPq
 /c+IieU9POReu3k4/W4nLXaWuagQXfc1bbuep4Qin4nabmdzryzqqzahMP8Nb7lEbgvz
 wJv1oraljt8kYv7IJDE2KhXXmdIIL5UNeppgUdRi7/tZkRaJDriuQ8rgm6/tijdlxQ5J
 8MQ1jv+PrOtR0PDeLuGw0utEDmRoAY3RF02EW9KTkFviIzTX3zQDb2FIBCGF/mzFH1wB
 jARFZ1ZzBE9LXID6I5XZahNPgNWEm0ynNNUhpPOY3Xg2N8GWsW+0p9vgja6D2Dobt4gy
 Gdbg==
X-Gm-Message-State: AOAM531JvUoAW98uYvYj1+7zgMGTG2XcykMoWa7bTIjRgp5sGq+XXOya
 Ns+JeclNggnGfNvQtuYOC1i0j9Flhi7v5BbE6lQ=
X-Google-Smtp-Source: ABdhPJzeXxYFHXADz5y/uwXcsiFsr488IEe98cMBVvUCBZ7+DFPHBQDjnQf20QToRZ3i6CYBm4JQRw==
X-Received: by 2002:a37:c0e:: with SMTP id 14mr3526092qkm.255.1620866340036;
 Wed, 12 May 2021 17:39:00 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id w16sm1204201qts.70.2021.05.12.17.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 17:38:59 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Wed, 12 May 2021 20:37:44 -0400
Message-Id: <20210513003811.29578-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/5] drm/msm/a6xx: add support for Adreno 660 GPU
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Shawn Guo <shawn.guo@linaro.org>,
 kbuild test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Iskren Chernev <iskren.chernev@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dave Airlie <airlied@redhat.com>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for Adreno 660 to the drm/msm driver. Very similar to A650
on the kernel side.

Jonathan Marek (5):
  drm/msm: remove unused icc_path/ocmem_icc_path
  drm/msm/a6xx: avoid shadow NULL reference in failure path
  drm/msm/a6xx: add support for Adreno 660 GPU
  drm/msm/a6xx: update a6xx_ucode_check_version for a660
  drm/msm/a6xx: add a660 hwcg table

 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |   4 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  32 ++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 115 ++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  33 ++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c |  13 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  14 ++-
 drivers/gpu/drm/msm/msm_gpu.h              |   9 --
 8 files changed, 176 insertions(+), 49 deletions(-)

-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
