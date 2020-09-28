Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA3227B68B
	for <lists+freedreno@lfdr.de>; Mon, 28 Sep 2020 22:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7576A89F27;
	Mon, 28 Sep 2020 20:47:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A86689F27
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 20:47:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e17so2438888wme.0
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 13:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nb9J0IHiYZyiiI0yNoQU8kntPHSf2s+jSr0KCIhtaEk=;
 b=nY5cddHKnN1vrtLRd+xPWeQFOAhMkKwC1OMapCOhg225IIFY/tTqfcwiU4lY9Yd5sJ
 vTV7RZmDN8mGB8523uI9NVE+BQIeebJNEtk9t1+kZmqwqSVMDY0abaQFwUBaDXb4jLh5
 EtF+8OnAZMbvCXPPnebXaAPG3oZllQc29vmiIZrnmb0wMbFThR/42N+spfTWPJcZafhv
 iFyIGHA+zNFE1d3ADms6kfFLlT9lv/Qc1DL0pA+SD3ELdysfM6o76we2gZ+KQfqd8NuB
 kYhFxwasSDQX0XZYFq8rTSyM7mTVRI8cgyhcELpe+7CW/w2MO+wK0pNYrdZi335EfvOW
 ucVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nb9J0IHiYZyiiI0yNoQU8kntPHSf2s+jSr0KCIhtaEk=;
 b=jl/SuA59oa0LjJvEjgxfhaFK3ftTkmmzCHKAMGA1yUsHX3/lJ+E3mRFZqLZ6u8/gim
 +IZT6E1Vs26b8GlRhOqj1NLuQLLwkIu4gtifu6zvOofVJPUsBhJChLGM6ojAZI7/kxKD
 oQEdOwf1s6VE3DIx4XktfaCSkueBC3d40H9aBFA5DJhGXx6gH9iCE+yFHG5VLXjpgJ/P
 RDXhA7KjqubJGzWij9fCwdl4qtPyofJ7YzRN7REZT4sRwbbx3FBZd8pUJka0BgvK259N
 gLMjUdp10FL7Gsz8j3tG8orHyMIc+HLefGEsQ7keZ+sr62Y0k4KKCg206ibsXA8CvEzS
 iXyw==
X-Gm-Message-State: AOAM530rRlp+8qE/uglBtaiJetxzVWv/kb+nkfj6XDnYTCV3ab7mmdJW
 subUZMDAwbu8+mpxUIDuS70=
X-Google-Smtp-Source: ABdhPJxZGUUQLn23xBCKNF6y5ZS2rKRzE/3ozQLK02zrD2dYVMAoHtRujiS6Qsc/HjpHQLZejmN13w==
X-Received: by 2002:a05:600c:22d2:: with SMTP id
 18mr882422wmg.145.1601326031552; 
 Mon, 28 Sep 2020 13:47:11 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
 by smtp.gmail.com with ESMTPSA id r206sm2677878wma.47.2020.09.28.13.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 13:47:11 -0700 (PDT)
From: kholk11@gmail.com
To: robdclark@gmail.com
Date: Mon, 28 Sep 2020 22:47:02 +0200
Message-Id: <20200928204709.45746-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 0/7] Add support for Adreno 508/509/512
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
Cc: freedreno@lists.freedesktop.org, marijns95@gmail.com,
 phone-devel@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 konradybcio@gmail.com, linux-kernel@vger.kernel.org, martin.botka1@gmail.com,
 jcrouse@codeaurora.org, daniel@ffwll.ch, kholk11@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

In this patch series, we are adding support for lower end Adreno 5
series GPUs, such as A508, A509 and A512 that we have found in the
Qualcomm SDM630, SDM636 and SDM660 SoCs.

On a note, adding support for these three units, also adds 99% of
the required "things" for another two GPUs, A505 and A506 but, even
if adding them requires literally two lines of code, noone of us has
got any SoC equipped with these ones hence we wouldn't be able to
test. Even though there is basically no reason for them to not work
correctly, kernel side, I chose to avoid adding the two "magic" lines.

Anyway, this patchset also addresses some issues that we've found in
the A5XX part of the Adreno driver, regarding a logic mistake in one
of the VPC protect values and a forced overwrite of the register named
A5XX_PC_DBG_ECO_CNTL, forcing the setting of vtxFifo and primFifo
thresholds that was valid only for higher end GPUs.

This patch series has been tested on the following devices:
 - Sony Xperia XA2 Ultra (SDM630 Nile Discovery)
 - Sony Xperia 10        (SDM630 Ganges Kirin)
 - Sony Xperia 10 Plus   (SDM636 Ganges Mermaid)

Changes in v2:
 - Define REG_A5XX_UCHE_MODE_CNTL and fix open-coded
   REG_A5XX_VPC_DBG_ECO_CNTL in the all flat shading optimization
   disablement commit, as requested by Rob Clark.

AngeloGioacchino Del Regno (4):
  drm/msm/a5xx: Remove overwriting A5XX_PC_DBG_ECO_CNTL register
  drm/msm/a5xx: Separate A5XX_PC_DBG_ECO_CNTL write from main branch
  drm/msm/a5xx: Add support for Adreno 508, 509, 512 GPUs
  drm/msm/a5xx: Reset VBIF before PC only on A510 and A530

Konrad Dybcio (3):
  drm/msm/a5xx: Fix VPC protect value in gpu_write()
  drm/msm/a5xx: Disable flat shading optimization
  drm/msm/a5xx: Disable UCHE global filter

 drivers/gpu/drm/msm/adreno/a5xx.xml.h      |   2 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 195 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_power.c    |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  60 +++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  15 ++
 5 files changed, 249 insertions(+), 27 deletions(-)

-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
