Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAB8381B94
	for <lists+freedreno@lfdr.de>; Sun, 16 May 2021 00:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2C96E454;
	Sat, 15 May 2021 22:58:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD776E454
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 22:58:01 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id r5so3457961lfr.5
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 15:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eBTQmpM/Ml6k7hvWgriWTmEFhLechL8G1HA7n71TelE=;
 b=tPV/dGjVkXN5nq1h7uNLOhDPoF7XIcwERQ76MsEgF+PmQ+QNYbhhxO/i3T0iTCSlpk
 Id217cfqi0fgG/CyxbuCgmf6iN9tKMto3qPIUyecAs6aXtKd0C0vQM0oKdYgKzmzSdAc
 n1RlD/yevvkHZ1I1zlgXPVMy1D216pn9TCpDuwWM+K8WRnhjRSEpsl3HaBWgJnOH1udo
 Y4TabnrlRylsZzU4MUzuJTVWgMVbVMRkt/fjRLBUx6nc+0fFsIEpzN3jKHJcFw+LamsZ
 w2giAV0YkEuL+/jrweoT1nntGdN1hTwSxTo5u37CljFcQQmyM6d1VjHr9VccR+AZsYYv
 ODUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eBTQmpM/Ml6k7hvWgriWTmEFhLechL8G1HA7n71TelE=;
 b=MiuYmoAiUWsVPFRwZw0nsOum0RqDZT+gxPiZkIeHxlG/okZ/l9qJt1m1ap1aAr9cak
 m4Gk0OZR5xWMBUMTI9J3MsLT3XZVlxS5ZXq/XezVp9oU6TfVexS+lMt/mUJLcQ45HXkU
 oJC0vbpIi0U/bRGp/VGaV+hrSqPY27F6R6reTW6Yyx23xCWHMC7nhyqXA8V3kVTRmR0F
 mq+EjC45l6SrA+KcNjrlvpGQQaw9qbZYgk/WZUHFwd7C4KqNddcDz9k6gzKq+Hb3lvKs
 T7JhMVeK+6yosD5fBjVEoErUoxoKdoz1DU1dSs7s+t6zQec/tXL8wLXechmcDxKES4RW
 c4lg==
X-Gm-Message-State: AOAM5331fzyQcI4XR72UF30yFa11kcXuIlFzPCoiuvoxzuhKOPTbx1/9
 YZRGVJ/jcrfZMTJ/Woif2CuYQg==
X-Google-Smtp-Source: ABdhPJyq+Rs0oTEyhmaCf7LKxlQ+Eibtf/uz0XmOMbZgMJIVeNGzdm5yvJ8vMU0kQV39Xg1tenk4hA==
X-Received: by 2002:a05:6512:22c2:: with SMTP id
 g2mr39209032lfu.305.1621119479940; 
 Sat, 15 May 2021 15:57:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id j3sm1499729lfe.5.2021.05.15.15.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 15:57:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sun, 16 May 2021 01:57:51 +0300
Message-Id: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] (no subject)
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # This line is ignored.
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reply-To: 
Subject: [PATCH v2 0/6] drm/msm/dpu: simplify RM code
In-Reply-To: 

There is no need to request most of hardware blocks through the resource
manager (RM), since typically there is 1:1 or N:1 relationship between
corresponding blocks. Each LM is tied to the single PP. Each MERGE_3D
can be used by the specified pair of PPs.  Each DSPP is also tied to
single LM. So instead of allocating them through the RM, get them via
static configuration.

Depends on: https://lore.kernel.org/linux-arm-msm/20210515190909.1809050-1-dmitry.baryshkov@linaro.org

Changes since v1:
 - Split into separate patch series to ease review.

----------------------------------------------------------------
Dmitry Baryshkov (6):
      drm/msm/dpu: get DSPP blocks directly rather than through RM
      drm/msm/dpu: get MERGE_3D blocks directly rather than through RM
      drm/msm/dpu: get PINGPONG blocks directly rather than through RM
      drm/msm/dpu: get INTF blocks directly rather than through RM
      drm/msm/dpu: drop unused lm_max_width from RM
      drm/msm/dpu: simplify peer LM handling

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  54 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   5 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   8 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  53 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 310 ++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   9 +-
 16 files changed, 115 insertions(+), 401 deletions(-)


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
