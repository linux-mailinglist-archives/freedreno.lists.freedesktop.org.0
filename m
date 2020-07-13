Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E70221E340
	for <lists+freedreno@lfdr.de>; Tue, 14 Jul 2020 00:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F116E82A;
	Mon, 13 Jul 2020 22:55:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FD56E82A
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jul 2020 22:55:13 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id m9so6616743qvx.5
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jul 2020 15:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UB04SDsGtdgD9O0BAxZlC5pe+7E+tV+tVdZ5syl+8GE=;
 b=phQ3z4XM879Mg4TOckIPk5Dk89byIXjH5l1Ueod4hxvsspSvQrbYmrKa7jp6giCzjC
 aG0WR8fPrx31wi2pKkzaMt+biVC5PTTZ/BNVEZS86DXTtH1kfAIhUOr/DWnYf1BCxIm+
 XpOeTsFUeut8tBwi4ZyJLjOZi67wtb5RC8Kx41AENk5ZtijKl1JZQOCiOV7bdURhCSTw
 V8NVyPwGqRSChiWgc7qbgDEgMWZTq0oRPnViI9jeuNaLhxTOR0kpbFalWfjZfsLgvDb8
 mC2I2McVH3RcGEM6p+MvTn8iy4xl61VJhjF+5+h7wKlRystzel3ka5+gm+2exuDs93z1
 EJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UB04SDsGtdgD9O0BAxZlC5pe+7E+tV+tVdZ5syl+8GE=;
 b=kBIAWS4hCcRg2b4d55eZL0Z4o/kfVpAjG+rqWcj/BtUsx6yXXuzQKTQaJBwIIQnwUm
 cceXfouBdsu0ZgNrN7rAcgZ23dxm+iQwYJqo+eKu+ZOtYdTfg3FBb+f41NQxSgpAUQgV
 5Q1V8b1E1t9/RQfXqhG0JjSxY4U9ORYEJpfCuEJd0V3jCnd2foCgzR2p+x1x2c8os2OF
 WtO8YEYzfhTdXHpSgEdaPCkZIHk6zFNMfMJW/M1Za5J7p9dVSRIg7Fap5Six5smG1EVu
 M1mmIc4T48CZHGBnQp1ZTUdLT+HFZfEAnxmMJ8r4D0+OpEEo5C9lNsoMaytHsZXwEGPZ
 KuSw==
X-Gm-Message-State: AOAM530vlJM/9MEw4GWC+YvkPeQKUhL+44Y1hXxAzIDpRETSWzd689IW
 S2t6HPcdSjYKFASYxTNks7vu1W3LWiU5ng==
X-Google-Smtp-Source: ABdhPJzT4kWTe7OAToMzZZAU4W5K1Fgae2SY+FVbLq8HcjZ7nDEsaM7430chMTRWXiz9iMYU6zS6fg==
X-Received: by 2002:ad4:48cf:: with SMTP id v15mr1725778qvx.101.1594680912255; 
 Mon, 13 Jul 2020 15:55:12 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id f54sm22405752qte.76.2020.07.13.15.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 15:55:11 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Mon, 13 Jul 2020 18:53:39 -0400
Message-Id: <20200713225345.20556-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 0/3] drm/msm: handle for EPROBE_DEFER for
 of_icc_get
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
Cc: Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Takashi Iwai <tiwai@suse.de>,
 Jordan Crouse <jcrouse@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 Fabio Estevam <festevam@gmail.com>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Check for errors instead of silently not using icc if the msm driver
probes before the interconnect driver.

Allow ENODATA for ocmem path, as it is optional and this error
is returned when "gfx-mem" path is provided but not "ocmem".

Because msm_gpu_cleanup assumes msm_gpu_init has been called, the icc path
init needs to be after msm_gpu_init for the error path to work.

v2: changed to not only check for EPROBE_DEFER
v3: move icc path init after msm_gpu_init to avoid deleting a WARN_ON
v4: added two patches to fix issues with probe deferring later in v3

Jonathan Marek (3):
  drm/msm: fix unbalanced pm_runtime_enable in adreno_gpu_{init,cleanup}
  drm/msm: reset devfreq freq_table/max_state before devfreq_add_device
  drm/msm: handle for EPROBE_DEFER for of_icc_get

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 68 +++++++++++++++----------
 drivers/gpu/drm/msm/msm_gpu.c           |  4 ++
 2 files changed, 45 insertions(+), 27 deletions(-)

-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
