Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFAF6F2BAE
	for <lists+freedreno@lfdr.de>; Mon,  1 May 2023 01:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF23D10E088;
	Sun, 30 Apr 2023 23:57:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B15410E088
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 23:57:35 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2a8c30ac7e3so18658731fa.1
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 16:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682899053; x=1685491053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JEO1kY5gj6+OGElS2SgzMK4jEbIa9KGlbcUtbSF+QUQ=;
 b=hOMT8YyFEemF8LN+1djfEKeIY2IakpKS3tCJH4ZyWZo1cy3IVn9lzKSR+qljOO9iRS
 uBCSje9X1VsH2wlPL/cLW3ywe4+wkOYG2yyCoUv4uLKMlzcGx/LtcfC0y7wZPK7knYWo
 S32Kjm0pcsWDUVkk8BGKy8j79/PVziLh88zW5bgL7rpxXyxh7eW4DJHHs/NnISHregN3
 DN4/x4DaWwaZ47K/N4s1qKRG9F2ORAxGZW7rgQD1kl4U0e3dKOTRNpySkTEFxK1OEdD/
 2aa6pPC9TmUvAPkikZ5nbg1q9p0nDPj/mUrewoprAQzCbdC62Z/ErIB3b99IANM9dkWu
 WJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682899053; x=1685491053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JEO1kY5gj6+OGElS2SgzMK4jEbIa9KGlbcUtbSF+QUQ=;
 b=WkOE8bVod0PGKG5gXtXTZHgn+J6Vb0/pFWRVRlgoGYVnvnMx1zyUb/fnsxfGZb9ntQ
 K9jy9bDOg8vcyr54q9N9G1+w5A0CyNqxSOhA0L3JsDhXKs/T//WIuudJ2qD+s14ynEXM
 AeOOa0Oc8yepUqCOVR61h0Dm2fcutLHZvOBjXjIPiofnfF4TR6pflhx412ckWnUARTnT
 H5+S/3p14xEQjA3dpO4CyvO2S1MXbqnJWO7+ibNLBVyRcJWeE2YK6nDHWe1sGcyxbkYD
 T6G/X4NZ1XTwq5PASIVg1ng3yw3F2If/NJe1h92hXFLNVftzogVqbKqb0jsSiWoZI68o
 rIkg==
X-Gm-Message-State: AC+VfDzicFp8m5iCekDIgV7A719iwz0EpBp0gX+3s85HmbUjFz2Mt6AW
 8W/ng/vS/dZFT6sJE6RXcpB4ag==
X-Google-Smtp-Source: ACHHUZ5BIVvcrDS/lcz5f2hKdt1/pKujyBtQx3Qhi3bghKnh9g2gMe/CaNg1FxfJVnbRdtH5VSrYTg==
X-Received: by 2002:ac2:5981:0:b0:4ef:eda6:c14 with SMTP id
 w1-20020ac25981000000b004efeda60c14mr3119706lfn.35.1682899053283; 
 Sun, 30 Apr 2023 16:57:33 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p19-20020a2e9a93000000b002a9f022e8bcsm4292099lji.65.2023.04.30.16.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 16:57:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  1 May 2023 02:57:25 +0300
Message-Id: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/7] drm/msm/dpu: simplify DPU encoder init
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rework dpu_encoder initialization code, simplifying calling sequences
and separating common init parts.

Dmitry Baryshkov (7):
  drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
  drm/msm/dpu: drop dpu_encoder_early_unregister
  drm/msm/dpu: separate common function to init physical encoder
  drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
  drm/msm/dpu: inline dpu_encoder_get_wb()
  drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
  drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 190 ++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  20 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  55 ++---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  35 +---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  38 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 +++-----
 7 files changed, 155 insertions(+), 284 deletions(-)

-- 
2.39.2

