Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A5C696390
	for <lists+freedreno@lfdr.de>; Tue, 14 Feb 2023 13:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB1710E0D6;
	Tue, 14 Feb 2023 12:35:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5528610E0D6
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 12:35:07 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id o20so23284255lfk.5
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 04:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vgeYEYP51vHsST01dLtYg6fF7hAGkVx9e9N4X/a0L4k=;
 b=jI/GJxl9CNH2yhi4NRFnnuwuG5OSEgx3+S3X4x3j5vT07hrw80oy8Uo1yXGbgbSR7F
 RXeX5rCRHIFWHTWPg/E/E9DtmEAZQPSxMsklPqB1S/ccE29vGCDKQoylx2Y4BD1dow79
 iqKf3XCKxcA3qKhYQ3lqrSH/qRE93/n7418YQH9/kZa4siLe/cSXZmK9lKxBb76JEgvs
 MzDAq4KgSBwMgyRXTRg3513tYvOrhYSdkH5ZBKAJncMQG+V0ozRLX+HP+kyiNiSk7mQl
 HMwyJUUbBTVylyy/wDVq3WBoj47EY4xpfUwsBfgcwN7qDp8oK1LkLLtDykdWJLt6YQAp
 dnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vgeYEYP51vHsST01dLtYg6fF7hAGkVx9e9N4X/a0L4k=;
 b=SwJr39IRi1fTA0zloYwvaD0USgEpiiNjhs6a7lUL3Wfzy0EaOkC410TwZjYdDH0Xi5
 tjRo0Gyxq83dGofbhSGTdw7hFeW5C1WfZ3XlUGAJf3Eo3UI3Uh9ADuaPyiq8AAm+vY8T
 TeSp4Ce4y2gtR2UsKdRrojI7yQIn5Qb/HyEgnOIFP6wU9pqgxI6kZvEDmSZ3Im7ja+Ic
 qeBuvJzJN6pXC444PY2Y59EPkR5poN53DZe0B0ducdbONKvSBiFb11aYzbw8z7DSYEzl
 ftMdDh7/kZ2L07VyTs1UAkbl+hYMBU3ndJAeHi4IDqucdTcVaM85kQtPcbVmu84Umo8a
 126w==
X-Gm-Message-State: AO0yUKWmqPt9qKR/PxLMJT2HxZ+fAZHMGShaXbXtV6AG2sauojK0wPyk
 6rx0o+8R4G5ZX+PR3Z+fCW6PLA==
X-Google-Smtp-Source: AK7set/iTdHf7YxO2g+rThSDtaij0QNrbLQRJIotuyZCyn1GzpiayUW7c6kW2TTKlkDRKdXpb3E9Xg==
X-Received: by 2002:a05:6512:374e:b0:4cb:10ad:76bd with SMTP id
 a14-20020a056512374e00b004cb10ad76bdmr522821lfs.64.1676378105420; 
 Tue, 14 Feb 2023 04:35:05 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v19-20020ac25613000000b004ab52b0bcf9sm1077158lfd.207.2023.02.14.04.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 04:35:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 14 Feb 2023 15:35:01 +0300
Message-Id: <20230214123504.3729522-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/3] drm/msm/adreno: implement devcoredump
 support for a5xx
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

During the debug of the a5xx preempt issue, having the devcoredump
support was a great help. These patches port necessary code bits from
being a6xx-specific to generic code path and then enables devcoredump
for a5xx.

Dmitry Baryshkov (3):
  drm/msm/adreno: stall translation on fault for all GPU families
  drm/msm/adreno: split a6xx fault handler into generic and a6xx parts
  drm/msm/a5xx: add devcoredump support to the fault handler

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 13 +++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 64 +++----------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 62 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  4 ++
 drivers/gpu/drm/msm/msm_iommu.c         | 38 ++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h           |  1 +
 6 files changed, 109 insertions(+), 73 deletions(-)

-- 
2.30.2

