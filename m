Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C7170A371
	for <lists+freedreno@lfdr.de>; Sat, 20 May 2023 01:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AD910E113;
	Fri, 19 May 2023 23:40:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5611210E113
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 23:40:29 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4efe8b3f3f7so4342286e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 16:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684539627; x=1687131627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6tgw64QArDRy7OvpPNE5Lmjz7wtWaHwDObMSRxTN810=;
 b=Ik73RGkBIkUJzAHOt+zcQM4hIdiEKd+SA86jn8b6gFksbp6y4qIIb4BojUyZqli6AN
 9AUK7Wwr9yqTthjtVdPxKjgLuonZjbKPe7yglCUtzncz8h6BjzNdlHF8WYp38/GWfpBU
 C0IoBHMd/wMI3EPBR25Dwfvk5Sd12++lHma3cYgPCwxmghFu0ywHu+tmmUMLRHHm40pz
 9HgZKd0+64khRqdlVXP/u+6ygHCY9c6ejBKy5rgadt8Ophmu+nKdWe5bhKUA3eimE0DH
 A/MOYXA5uZzyJIOtPSWaL1NcVt5RAkX5Z1HqpSuEPczHcHyVa1tmQ3kcdC0/EOHXo/h4
 4Htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684539627; x=1687131627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6tgw64QArDRy7OvpPNE5Lmjz7wtWaHwDObMSRxTN810=;
 b=DB7XKTdb13p39cu7vewGj8p8vx+4yCJ68BQNQp4d4sZvBXObRZeaZdoKnmJC51HQpi
 /jIOmEYiMdzydbtUa9oLYJ6gt1eygT7VQyG3dGJSl2xAMB6czRw1gbfBPaax9fQZ7JJx
 3+zd3QOR6i1Ti93hHKspNwsdZ6F8xGKg0tKL6D/2n1s2bAUwUhmypNprdC1qyixq7wjs
 Tx0+8b6CGSylGfXcabZCl7hPRn3/AFieKYvETlDt0HKkt0DWjaoU40AUZIaoOvVX4sIJ
 5WEc0niFEMhRqN6Z97NuiBUQycw23iKm5peBoO3msWGNeTqYmPXRpdEEoBl53autMDon
 VHpg==
X-Gm-Message-State: AC+VfDwmtgLD4N/KDaSOgOxuWrQOZXBxX2T/VGU7MnFgjSePFwflnIpf
 dc6j+dQuZzY1Wimnk3huZMbh4A==
X-Google-Smtp-Source: ACHHUZ659kbwQ+zdbPhbcbhPNXF2toD/GnKXZZ2iSe3oNSV16KRXsqgmyhbNW6lUTZB6cVqjO81y+w==
X-Received: by 2002:ac2:4556:0:b0:4e9:c627:195d with SMTP id
 j22-20020ac24556000000b004e9c627195dmr1079154lfm.57.1684539627094; 
 Fri, 19 May 2023 16:40:27 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 l7-20020a2e3e07000000b002af25598f07sm43454lja.78.2023.05.19.16.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 16:40:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat, 20 May 2023 02:40:21 +0300
Message-Id: <20230519234025.2864377-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/4] drm/msm/dpu: simplity RM code
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

Implement several small simplifications for the DPU resource manager.
The ideas behind these patches were suggested by Marijn.

Changes since v1:
- Reworded commit message for the patch 1 (Marijn)
- Fixed documentation for dpu_lm_cfg::pingpong (Marijn)
- Added Suggested-by to the last patch (Marijn)

Dmitry Baryshkov (4):
  drm/msm/dpu: replace IS_ERR_OR_NULL with IS_ERR during DSC init
  drm/msm/dpu: remove futile checks from dpu_rm_init()
  drm/msm/dpu: use PINGPONG_NONE for LMs with no PP attached
  drm/msm/dpu: move PINGPONG_NONE check to dpu_lm_init()

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  4 +-
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |  5 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 41 +------------------
 6 files changed, 13 insertions(+), 46 deletions(-)

-- 
2.39.2

