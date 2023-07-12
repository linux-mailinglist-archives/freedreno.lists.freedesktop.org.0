Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E23E1751341
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 00:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650E910E59C;
	Wed, 12 Jul 2023 22:11:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA3610E051
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 22:11:42 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b703cbfaf5so122788161fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 15:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199900; x=1689804700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4RiBxelklL66UAOz090rtZPINsn9CcVuq61oI6xDxFI=;
 b=WQf8BcV6FGMCMjo247gbz4AswWQHxO3/liFJtppvv0PloXb6Wm1lojUVQvkAp0TlCM
 89h+biD8WQFYm7aOP05ySqSn4UH1cGrpk7Z1K87ZL+H/Y9dfy3+RRfs1bpobz4yWlspP
 ka8YJeKSzdJh+xtyy/y3f+D3bwOnIEXYk7cFabpgGpOuMS7aHm0QM8fMVOxobyCeCHC0
 gHqgC3J6kmcRKgD80CCizAN/8mL853U/+eEmwWOLKMSD9NK3oPfJvjZylpjO87VsRb4c
 EeVNv+6W+YpGjcBenwP/iuH+KOqIzMlh+tQYyo9fH31PuQKXTYoT8/yYXxgv7kxDOvKV
 TStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199900; x=1689804700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4RiBxelklL66UAOz090rtZPINsn9CcVuq61oI6xDxFI=;
 b=jgZXxA87Ds2I8JNZtZzkpyPwjz1Tplaf5Q2ORxcP4f8vUo9lBQA6EW3kt490xfsgsN
 XjgdM7XjevM00jO9/KEEmdzUNcNEdsRQ3LVSpkPY1IS0iSzSVDserkGmhhX/LZsATqVh
 +liHtjNLYzi6y2GcyOY25AreswpuLqIt3J+kDDH6G9lnQ4C5AFqHK+QXTBU1ptqL47Ic
 9jJHXpVhtxELmipg2jB8o2S1pITm54qbWKOZNy9mGHyivkh0NqkZqkHXFp0vg5Qz+Ah3
 jY8T6yFTh495y3OUiY82TUo2ErKbO6A2cvm8QrnQ32J7/DOSXGaw3nB0XgvsnTRKjOM9
 Klog==
X-Gm-Message-State: ABy/qLak3dkoFBgr9kHcilDlipwUYkj4jCPgIWStVBSKPTF9EKOyffmp
 az6CSTf1Jqa6pTFKhZEE+krQJA==
X-Google-Smtp-Source: APBJJlFMDe0JLw2pB86fwpjn6gTtyQ7nxVTmEY6hl0L4dX+byLo+fFMtJhgj7lYJwP7aDAzsjXRO8A==
X-Received: by 2002:a05:6512:3090:b0:4f8:4512:c844 with SMTP id
 z16-20020a056512309000b004f84512c844mr20337601lfd.48.1689199900381; 
 Wed, 12 Jul 2023 15:11:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:11:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 13 Jul 2023 01:11:28 +0300
Message-Id: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 00/11] drm/msm/dpu: cleanup dpu_core_perf
 module
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

Apply several cleanups to the DPU's core_perf module.

Changes since v3:
- Dropped avg_bw type change (Abhinav)
- Removed core_perf from the commit cubject (Abhinav)

Changes since v2:
- Dropped perf tuning patches for now (Abhinav)
- Restored kms variable assignment in dpu_core_perf_crtc_release_bw
  (LKP)
- Fixed description for the last patch (Abhinav)

Changes since v1:
- Reworked overrides for the perf parameters instead of completely
  dropping them. Abhinav described why these overrides are useful.
- Moved max clock rate determination to dpu_kms.c

Dmitry Baryshkov (11):
  drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
  drm/msm/dpu: core_perf: extract bandwidth aggregation function
  drm/msm/dpu: core_perf: bail earlier if there are no ICC paths
  drm/msm/dpu: drop separate dpu_core_perf_tune overrides
  drm/msm/dpu: rework indentation in dpu_core_perf
  drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
  drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
  drm/msm/dpu: remove unused fields from struct dpu_core_perf
  drm/msm/dpu: remove extra clk_round_rate() call
  drm/msm/dpu: move max clock decision to dpu_kms.
  drm/msm/dpu: drop dpu_core_perf_destroy()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 187 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  48 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  14 +-
 4 files changed, 96 insertions(+), 159 deletions(-)

-- 
2.39.2

