Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A40F4B9781
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 05:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3469C10E796;
	Thu, 17 Feb 2022 04:16:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DD810E747
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 04:16:20 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id b11so7601614lfb.12
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 20:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=loQg9Lv88UsmY/ReqbxoXCP0a5sJwzcAHa4A0tvMWIs=;
 b=AzFuca5fyFdYdw6eKegri3YbNYkKo9TFBMH08tlGI52ZWeHBe3m0WtmMjkOzo7fH2M
 GtneKaRdUQVuePkl4ZqLFqTN+5BtdGE9lyc9tq+NcwbciJjhcW9FciRpVSdSXAqwpjL5
 T/FX+3TorFhs+7M34ym/rHtn1PWNPGDfp9OfG3TUk6GyUhV9owo9yehPlR3r5F9PYM1F
 oZ8r85FnlxXWRxgghC2IYcKfn3c71EO4qgrkhtqZW8P/cOgpBrI+bPb1A28NYJg5iuzH
 siXGcvYeI+LhQK9kgFRcolK+E5alJ8pfSlx1cjn2lIB7FS4d1ndG0onXCMqrhrYlrx7d
 EREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=loQg9Lv88UsmY/ReqbxoXCP0a5sJwzcAHa4A0tvMWIs=;
 b=FzqiL2vcfmfVl1FYXOsEZRkq+uG4VjpUunJ5NeGax7Pgr5737zRh5GK+wp9/d4LMQJ
 T/4eAI2et2mXR4wqZN32fcEyp1HjSyAdJOxpgU6aHhziHiyn7LPGFpkazWOHRIygbXTv
 ctiW+TgZ4ER7V3KDeJzzc+KC4sHVBQBK3fKQkJ/Blvn0/ZYsad0sPFBzHiXBEk9F89as
 XJdkMtG935ZcxoAdBU46X5sHLKRjqZ/w4gdM8tByIG1GTq5twyrymm/hADP8p92gur9T
 FrlvvL7XYSFs9zn0ZM//8BbFRqvxzja+xc3kHnoF2Kn3Nk6uKiL3a512uBGVsmckoCtN
 +T8Q==
X-Gm-Message-State: AOAM533TydI+lPjPB3KyGXvmHP0gc74gMIHdBRV90MwE+11P559VkAEU
 fOV4/0YBbxY1KPL8F4FtfPeHnQ==
X-Google-Smtp-Source: ABdhPJzv6IBL1HyDtH61+hP/wrickUo3bZOpYpC+2wKeBUBv/f7w4xTwO5LGAfQpp0lz9BxE1BABVQ==
X-Received: by 2002:a05:6512:3ba2:b0:443:6701:bb04 with SMTP id
 g34-20020a0565123ba200b004436701bb04mr787098lfv.644.1645071379010; 
 Wed, 16 Feb 2022 20:16:19 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id k16sm2452349ljg.25.2022.02.16.20.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 20:16:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 17 Feb 2022 07:16:11 +0300
Message-Id: <20220217041617.470875-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/6] drm/msm/dpu: simplify IRQ helpers
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This is the second part of
https://patchwork.freedesktop.org/series/91631/ reworked and cleaned up.

Changes since v1:
 - Use ARRAY_SIZE() rather INTR_IDX_MAX when clearing irq arrays.

Changes since the original pull request:
 - Split applied patches
 - Add unlikely and WARN_ON in dpu_core_irq_register_callback()
 - Remove extra checks in dpu_core_irq_unregister_callback()
 - Remove unused arguments of dpu_core_irq_unregister_callback()
 - Clean the cb and arg in dpu_core_irq_unregister_callback()
 - Split the last patch. Leave enum dpu_intr_idx intact. Pass irq index,
   callback and data directly to dpu_encoder helpers.

Dmitry Baryshkov (6):
  drm/msm/dpu: remove extra wrappers around dpu_core_irq
  drm/msm/dpu: remove always-true argument of dpu_core_irq_read()
  drm/msm/dpu: allow just single IRQ callback
  drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
  drm/msm/dpu: remove struct dpu_encoder_irq
  drm/msm/dpu: pass irq to dpu_encoder_helper_wait_for_irq()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  32 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 112 +++----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  43 +----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  92 +++++-----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  51 +++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 157 +++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  12 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  53 +++---
 10 files changed, 193 insertions(+), 398 deletions(-)

-- 
2.34.1

