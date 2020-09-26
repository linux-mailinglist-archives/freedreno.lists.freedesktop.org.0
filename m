Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55276279909
	for <lists+freedreno@lfdr.de>; Sat, 26 Sep 2020 14:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A635D6E07F;
	Sat, 26 Sep 2020 12:51:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC456E07F
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 12:51:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k15so6806387wrn.10
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 05:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/qMNYE0eTMh5KJYROOdw24uWxCTrmW6gJQZgul1FUS4=;
 b=Xzgm6wn4J/4NiC0PcNx8YtYeNMwbwXmxSLid0z2d+VUC+C06JsbAJyjzvy2PhtHPho
 0dwgsF1gedNsTidLRJYBwjVdt8WBilvjeFyfluf5FI3OY7zja0xBhJhVCXTdzVldMroA
 IqqUZk1NK5oI/tlf5F4AzkiQdnEtQ/Ol+yajZAqSQcC7FhSkLZIhzsyFcOzArkfqtL/5
 e6EySKwVJ6UAq8nR/g3gxHW/W8LB1KYNA3tjowSrZb86RcOdCpKfPa1OqUzO33eR/Lwo
 eBA3UefYyj7IivosPGHfV/koKrG2fDZuzBJLLVit2stJm7eceY9CJ1Bdk+/CaYwuyhEd
 ZYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/qMNYE0eTMh5KJYROOdw24uWxCTrmW6gJQZgul1FUS4=;
 b=Di2ss7uZsEsR4zVNDs4ycJF5Koa++978C2Flp9bjga4lsxJwus7//mMbICqknrl6+8
 MRTUykNVgYdp6y5bEYRMhOEekYbtbKYdYB0UW4oqU18GuxKJl+P2CKICjQ/RWZMOiIel
 xYob8bZQrbilYpGvOfGE1d6uCQWW7123TBsCQBiCPL1adw5R5sjkmHGxJcSv3zzVQvot
 Dun5HyjiIup7KKKghSVpWBEcmm7Yk2Fh9mOJM+ha2l79p/lP2XTXUxAFkJpsZhhc6nGJ
 hKOV9Y6CFB7yn5Y+8q2Wy/wi0UCJg5rlwN575x9MKedRvqBTXeSKiwoIyfdtNXL+8l6N
 SwNQ==
X-Gm-Message-State: AOAM530NyfSDa9xTcmmW/KAN6loxGS8If+/zc6yh70aY10EAgYY45aHd
 FCwwDteNpmhgZrA0ZPOuWFA=
X-Google-Smtp-Source: ABdhPJykRj8XBuin0jimtNNCc6XvuRCYJBYE70paF0aDxhecfU/Oo4M7P/54UjKiEqXlKS+mazYOJQ==
X-Received: by 2002:adf:f508:: with SMTP id q8mr8979753wro.233.1601124713966; 
 Sat, 26 Sep 2020 05:51:53 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
 by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 05:51:53 -0700 (PDT)
From: kholk11@gmail.com
To: robdclark@gmail.com
Date: Sat, 26 Sep 2020 14:51:39 +0200
Message-Id: <20200926125146.12859-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/7] Add support for Adreno 508/509/512
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

AngeloGioacchino Del Regno (4):
  drm/msm/a5xx: Remove overwriting A5XX_PC_DBG_ECO_CNTL register
  drm/msm/a5xx: Separate A5XX_PC_DBG_ECO_CNTL write from main branch
  drm/msm/a5xx: Add support for Adreno 508, 509, 512 GPUs
  drm/msm/a5xx: Reset VBIF before PC only on A510 and A530

Konrad Dybcio (3):
  drm/msm/a5xx: Fix VPC protect value in gpu_write()
  drm/msm/a5xx: Disable flat shading optimization
  drm/msm/a5xx: Disable UCHE global filter

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 195 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_power.c    |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  60 +++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  15 ++
 4 files changed, 247 insertions(+), 27 deletions(-)

-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
