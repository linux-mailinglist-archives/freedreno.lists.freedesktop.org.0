Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816DD736A70
	for <lists+freedreno@lfdr.de>; Tue, 20 Jun 2023 13:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18C910E2C6;
	Tue, 20 Jun 2023 11:10:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CC710E2C2
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 11:10:44 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso5951672e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259440; x=1689851440;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IoT2GR/Uoi2aGgdfRzromK+7BmskPgx1PJTo67yINu0=;
 b=SjWj58M0HawcUhEnQUhjDM2rl2u3ACNUOQeMLzsfSi0fTfnUMqvhrYeKRIRujPz8eW
 O7EEYwV0QGDFDPaCpuyfIx23shDmD5szRESu4SFz70X5NOVfeNgexNX7qzjUAgWn4v6h
 FwyolvZ1znYI46bFZgQcjoaCwKRHBQ2+Imxbz9y139MVOilQxeRvXK2XLDyqp3JUwCKU
 LUcRfiEI6VcFsvIQ9Ll7TwR/L9A7nVmyDthePNoE5cr6DgJ9mMcA70dsrYIJK9GWyuxY
 hLgXz/e7892voLDN5mNhNxyw3NuYJMK2nO8PWJZu4VKw7rMMyzFK0WzB0ebL9rcW0Rv8
 BQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259440; x=1689851440;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IoT2GR/Uoi2aGgdfRzromK+7BmskPgx1PJTo67yINu0=;
 b=hgCMLmUDMPwvmyLNVfamrXvD85JQUF8qy3CoSmaadPc9BqgPMuwjsAtkMqT1Sc0snm
 P1isOU6alRQzBPFHZM5oZG03w5mJzcb0b4TgTi7PL5v4kXX9u243GBdFla05XJql0sDU
 KbVs3FolQUIHYJTgs0BacFCfBOia7sXB88TkP7fnfcu9oOfHAMrHyv7yH3V9+LjQHJNZ
 wsgjbhabjp8zuxVUlpbAU3Ap5XuhRFyGhDdiNIEfgIFpJ+wqYwP8DZhxOnfSR6f5AtHO
 o3nWI2A6lkMi5gYkENoufdQ5n+/n6SFubkYUOkD4Sa8fJc/HsRJvdeAYne4rshrG/bui
 sPKg==
X-Gm-Message-State: AC+VfDygA5D8foX8rvuPM+a0e92Zi6zbUanbUYH36O0T0qQlfCF1TIPy
 Qz8MT7K+2c0KdEsJNPn6GOfLLw==
X-Google-Smtp-Source: ACHHUZ45duw0feSQ/bSA0cRlMKEsqbS53ljbZe0BeA7XZhGamKkfrfynxW77p5B4lFpDMQzTPbmzPQ==
X-Received: by 2002:a05:6512:288:b0:4f3:a99f:1ea1 with SMTP id
 j8-20020a056512028800b004f3a99f1ea1mr7040192lfp.45.1687259440360; 
 Tue, 20 Jun 2023 04:10:40 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a056512041a00b004f764716afdsm314395lfk.257.2023.06.20.04.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:10:39 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 20 Jun 2023 13:10:35 +0200
Message-Id: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuJkWQC/4XNQQrCMBAF0KtI1kbSiW2MK+8hIpM0sYGSlKSWi
 vTuju5EpMs/zH//yYrLwRV23DxZdlMoIUUK++2G2Q7jzfHQUmYgQIq6UnxMQ7Ac1Txfh+wGrg4
 KG21VK7xn1DJYHDcZo+2oF+99T0f69GH+zJwvlLtQxpQfn9Wpel//D0wVF1yhbvYenNYWTn2Im
 NMu5Rt7YxOsAEBAbXSLCAasFz+AXAEkASitkwpqeajNF7AsywvpOsZDRgEAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687259438; l=1738;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=eX5ZTxH/9LwPpvZBJk24YxyZZoovg4iLjcTUF8O57GU=;
 b=eYdW9DwxTwYnC48PMFoXBqN4XCttHvlsNmTdrnieqG6ADJHwq4DgAv5Euo8IT8Sgs6KGjoJYS
 bcv2VpLfEIlB4d9XqRNEN7KOTFEqoKzs66a9BGbti6xQED2Id7N9kH3
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v4 0/6] Adreno QoL changes
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series brings some niceties in preparation for A7xx introduction.

It should be fully independent of the GMU wrapper series.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v4:
- Fix an issue where half of patch 1 got squashed into the cover letter..
- Link to v3: https://lore.kernel.org/r/20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org

Changes in v3:
- Pull more definitions from mesa
- Decode CP_PROTECT_CNTL bitfields
- Rebase on next-20230619
- Link to v2: https://lore.kernel.org/r/20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org

Changes in v2:
- Drop switching to using the GMU_AO counter in timestamp
- Add a definition for REG_A6XX_GMU_AHB_FENCE_STATUS_CLR, may be subbed
  with a register sync after mesa MR22901
- Link to v1: https://lore.kernel.org/r/20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org

---
Konrad Dybcio (6):
      drm/msm/a6xx: Add some missing header definitions
      drm/msm/a6xx: Use descriptive bitfield names for CP_PROTECT_CNTL
      drm/msm/a6xx: Skip empty protection ranges entries
      drm/msm/a6xx: Ensure clean GMU state in a6xx_gmu_fw_start
      drm/msm/a6xx: Improve GMU force shutdown sequence
      drm/msm/a6xx: Fix up GMU region reservations

 drivers/gpu/drm/msm/adreno/a6xx.xml.h     |  3 +++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 21 +++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 14 ++++++++++----
 4 files changed, 32 insertions(+), 8 deletions(-)
---
base-commit: 9dbf40840551df336c95ce2a3adbdd25ed53c0ef
change-id: 20230517-topic-a7xx_prep-787a69c7d0ff

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

