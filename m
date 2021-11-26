Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D0B45E4C8
	for <lists+freedreno@lfdr.de>; Fri, 26 Nov 2021 03:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0856E517;
	Fri, 26 Nov 2021 02:35:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F566E50D
 for <freedreno@lists.freedesktop.org>; Fri, 26 Nov 2021 02:35:19 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b40so20506095lfv.10
 for <freedreno@lists.freedesktop.org>; Thu, 25 Nov 2021 18:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K08hnQBTPfWEs+HMfPYvCpN/H48kICMBN1bfcTW0bUw=;
 b=QqG5fNRfambM/9eGjhWQTDgxNeUaGRGqGj1c4RU9sVvIy/itpEUlV+wwHI5cI/I7oH
 8o9ehfSavZZFGXKRInEHik8xP6lHPHWYjCKUkQoW9WgwTk9YifloDRmbrk6SXDqNU5vn
 FG1LrcuhZrxLJdb9qGnrC8PdXYLxjvFl/SqlL+pcAiJFxzRvS+eP8NGih2CjTDdhZwWp
 LppeMsIfMDEx/ozQjfnk6va5ArvB93Cq6KfTLtMLIV4P/HqZo7OfH6GP5rLxDeGBLWmq
 Tcu/UTma/0yIMBy49/DSH6OsgXuGAOfIRBC8qEau++DTyFk9euGBpZfC7gfqMaQFCCJN
 WeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K08hnQBTPfWEs+HMfPYvCpN/H48kICMBN1bfcTW0bUw=;
 b=TKLMWzkBm3KboehenwF08AuVP2MUSDZsXRLLWzvlV7hLqpjbAtHskqLEXAlYgFJ6r6
 4v/hQaww/6yLP+9YZertDBiHfMac4zeGw38ZPtuGJUmRElkABqha6rZ5q1k52TSkh5YM
 dxl/R+Ac6v2tNIrXlCNhOy974atadW50JdCnH1GgXvdmwiO4ijjQvTZw+LWHDGF7YVUW
 BpwdtLnPBRFZwKKcurfRGGpsJQN9HVetcEQynFM3TkcQPFZIy3wHnx98ADw/wnLMJcVS
 jseSnuJrU2SMdf7KBdcbr66AvvM4n7zskNsRnw/jScG4c5NibGH9UTz7T4GwtSBYN6fK
 T/IQ==
X-Gm-Message-State: AOAM531b70SQICBVCjMxlfFkpJVS5UWBoWO2W/P7uEQUN54sfTSi0kzZ
 wyruUbxwkH3xehww7r0TgIFhuA==
X-Google-Smtp-Source: ABdhPJwaHrap7PPmQnp6flFxVBPmROMv9vSRZo//q+MyiYYJ/7khxNgpJ1SAdmODw5i2LCGwTLjfkg==
X-Received: by 2002:a19:750d:: with SMTP id y13mr28325028lfe.101.1637894118290; 
 Thu, 25 Nov 2021 18:35:18 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n7sm391005lfu.116.2021.11.25.18.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 18:35:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Fri, 26 Nov 2021 05:35:14 +0300
Message-Id: <20211126023516.1108411-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/2] drm/msm: rework clock handling
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

msm_dss_clk_*() functions significantly duplicate clk_bulk_* family of
functions. Drop custom code and use bulk clocks directly. This also
removes dependency of DP driver on the DPU driver internals.

Changes since v1:
 - Rebase on top of current tree to fix conflicts

The following changes since commit e4840d537c2c6b1189d4de16ee0f4820e069dcea:

  drm/msm: Do hw_init() before capturing GPU state (2021-11-22 10:45:55 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-clocks-cleanup

for you to fetch changes up to d6c3e05f71d0fe131f427c32553a01b6df0bec9d:

  drm/msm/dp: rewrite dss_module_power to use bulk clock functions (2021-11-25 12:20:56 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/msm/dpu: simplify clocks handling
      drm/msm/dp: rewrite dss_module_power to use bulk clock functions

 drivers/gpu/drm/msm/Makefile                  |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c   | 187 --------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h   |  40 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  46 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  26 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  19 ++-
 drivers/gpu/drm/msm/dp/dp_parser.c            |  21 ++-
 drivers/gpu/drm/msm/dp/dp_parser.h            |  17 ++-
 drivers/gpu/drm/msm/dp/dp_power.c             |  81 ++++++-----
 drivers/gpu/drm/msm/msm_drv.c                 |  49 +++++++
 drivers/gpu/drm/msm/msm_drv.h                 |   1 +
 14 files changed, 164 insertions(+), 358 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h


