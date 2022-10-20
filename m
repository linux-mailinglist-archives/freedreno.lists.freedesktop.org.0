Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635226068E7
	for <lists+freedreno@lfdr.de>; Thu, 20 Oct 2022 21:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A268C10E471;
	Thu, 20 Oct 2022 19:32:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2246C10E678
 for <freedreno@lists.freedesktop.org>; Thu, 20 Oct 2022 19:32:00 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id c22so776358lja.6
 for <freedreno@lists.freedesktop.org>; Thu, 20 Oct 2022 12:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3FLf2jGC6agDdYJZ5+vrm0x/EXG2lDA+AUkXWt5l31g=;
 b=y3EJkcit7qMxi0ZUqMGyQ5B8T+E5Oc1h6eVpWTrnAV1LyDSWdoquwKXUAR/rgrcRUc
 +SSjPYqzf+zZqdE+1Vd77V39xZ2pu8OpiYK1DHGQTBH401edZFlM1v70YVBfFj7w0tjJ
 wt5Tg9/A+9YOLEJP/TVl+Ki9pyfGz+a4nRw8VGX7pLu0VGG0jWZktaUyxmty7++hjgxo
 aiH83ytM2oJmZLJZrDLma0pkktA0eFkQmLF/NJq1SBHvWRRj6oLX/MXPutaWdo/QOPj+
 pY+I50NQS6fcFZreuNPgulVTM64HgH6+L17z3bwSvo+O6LnskfDq65vo/SsXQCQXeH6F
 feBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3FLf2jGC6agDdYJZ5+vrm0x/EXG2lDA+AUkXWt5l31g=;
 b=gK5NTEypj/kV85Q4pANkC/H26q0MobFOU+oEWibBUTCQ8Vp7vQ5lzT2zLSCb1t4zM6
 tfsMdhlxDJVJA3WajMSP/xQldsJDFWPW+uXImbgUJpz3oT8WkF9ZUFAcEzV2Da2AIBoI
 WEHPq09+QxQHgyssOABYJegbabLZBVxC892TAL9U/f2ZpZc1rf3DTWxkvQ+DLXcXvBTS
 OeIP4WhAJ9ugC++2nQwH7hTat5HXHdsRGkHq5MggNUMPvub772vTrIIdcI/QgOji53Sz
 EcrDeSzfWaqpYieutldVpkMl/00xz+IIk28ph3w9Y9xedMDvHguv5cbikt5EXnLFWpzX
 ghzw==
X-Gm-Message-State: ACrzQf3e9JoLGvY1Yd+aamGqP9zQQ0AsIBCEuwetDUOkI/EpkMY6CaKA
 UyacjfKopcnEIchpvN/kS6bKzQ==
X-Google-Smtp-Source: AMsMyM6t3LA7a7zZSUSBM/G1xeBu4xoo9Q22Su/3RoL/L+68pvp6cD2qKCooKmyhCpVP9iNPsxmTEw==
X-Received: by 2002:a2e:809a:0:b0:26f:c1a0:2557 with SMTP id
 i26-20020a2e809a000000b0026fc1a02557mr5139227ljg.54.1666294318354; 
 Thu, 20 Oct 2022 12:31:58 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d7-20020ac25ec7000000b004a2c3fd32edsm2830652lfq.144.2022.10.20.12.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 12:31:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 20 Oct 2022 22:31:55 +0300
Message-Id: <20221020193157.2147112-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/2] drm/msm: clean up iommu interface a bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series started as an attempt to rework the drivers usage of IOMMU
domains. While the idea ended up to be wrong, these two provide a
sensibly looking cleanup.

Dmitry Baryshkov (2):
  drm/msm: remove duplicated code from a6xx_create_address_space
  drm/msm: move domain allocation into msm_iommu_new()

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    |  7 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 31 +++---------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 24 +++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 ++++++++-------
 drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++--------
 drivers/gpu/drm/msm/msm_iommu.c          | 25 ++++++++++++++++---
 drivers/gpu/drm/msm/msm_mmu.h            |  4 ++-
 8 files changed, 63 insertions(+), 67 deletions(-)

-- 
2.35.1

