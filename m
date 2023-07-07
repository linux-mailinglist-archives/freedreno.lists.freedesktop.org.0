Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEE974B744
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 21:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D29310E5E6;
	Fri,  7 Jul 2023 19:39:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA4910E5E2
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 19:39:45 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso3720540e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688758784; x=1691350784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m03JGQRZzgggDAPSrS4wYM6UAtubbQ6Gy43viyawZfw=;
 b=g6plaU0zekk97tTbrvVUCWPcPT0B6tt4nD7KZFvlAB9F+AsCiMoBKfM+PVpNg+2Ebk
 idh8Prl1ycwe3NfpxDmtAn0X0JUPsTnhTkk15zyaiL8k/q232X30axI7CczaUHKInoov
 0qAyTZQ3+jy8ubE1ciAOpMxJCd/w5R+n8VqHfPUTlJGnmDgy7au/UgnEEmjdnSZYVxzu
 9/oNYChRlgS9yDcUOC+PoFTn+HZDXWBOXJsXRtPRyOCYXv1pNyHKUEmBlrBRm7p94Jrj
 nGRM6mkte1TK7TjeBVWRyvIZxombLPij7gPCOkRUrZly35nK6LsWeVRb6PtsWvoSTSNX
 bWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688758784; x=1691350784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m03JGQRZzgggDAPSrS4wYM6UAtubbQ6Gy43viyawZfw=;
 b=C6mIV/6eDkzhCKCYkHNUrfhyObU62goiMp0Bwy3Fbe8Cv/6S/oOufDE1EAsi/WapPg
 5tOro7r5CcmeQ3owj9YsTpV+4FAoqfavuAzTP2eczk2ucE5XXkx5q9/XES0n9n8VMPom
 L9d22Z1rYGxzT5OVVicHNTqN7kpkzIaEwALqJppEtxqAIijo/kxxM0iAUmfhclXwTI6N
 iUv2A1UQKcw/9Zc+mYspr+dGo5R3vbWgqmos3ZtT61hNzQ8xb0kT90koQ9eZAdTGkpNo
 V2QdWUpkRUpXTSsGS+Iqm/w0FCjdMQHi/cEYNdgDshIIeuJdqQoNONCqd2hKhzZaKs2p
 pgdg==
X-Gm-Message-State: ABy/qLZblxHEhRkUEzEUcIb1fDizyHth6gVnSRNHz3F284gGlCheDeeS
 Gn0Wpg0PI6tKyRqNBZds69PJPA==
X-Google-Smtp-Source: APBJJlHkviBgOet9eYvf2B5iTWhVAGWaRPlm1BsVyU3K0LCUChjKBcvFGHK18QZLqBB0y7chWcwAgQ==
X-Received: by 2002:a05:6512:78c:b0:4fb:835a:8486 with SMTP id
 x12-20020a056512078c00b004fb835a8486mr4566225lfr.32.1688758783291; 
 Fri, 07 Jul 2023 12:39:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 12:39:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  7 Jul 2023 22:39:31 +0300
Message-Id: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 00/11] drm/msm/dpu: cleanup dpu_core_perf
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
  drm/msm/dpu: core_perf: remove extra clk_round_rate() call
  drm/msm/dpu: move max clock decision to dpu_kms.
  drm/msm/dpu: drop dpu_core_perf_destroy()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 187 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  48 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  14 +-
 4 files changed, 96 insertions(+), 159 deletions(-)

-- 
2.39.2

