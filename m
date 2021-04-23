Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BEA369AAF
	for <lists+freedreno@lfdr.de>; Fri, 23 Apr 2021 21:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6C46E15D;
	Fri, 23 Apr 2021 19:12:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0046EC35
 for <freedreno@lists.freedesktop.org>; Fri, 23 Apr 2021 19:12:02 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id f12so37191549qtf.2
 for <freedreno@lists.freedesktop.org>; Fri, 23 Apr 2021 12:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kEaQvWN4Z8yVJOtNMFNTVQ5YEguXpuTG96s4DFICCJ0=;
 b=kuLS0suPNfLfL/e8JYU0ZgCsM09iPvMie9U8PBPzCHE65hayjIIyW/c4VG+rtLVCSu
 05TvT3RLM45wuNRjopgjY3Ors5GfQ3GgS4MzsYw0AROaDcmp3HGCEXLesOWJqNnwyUv/
 KNMT2zM+KPa66AQGjuCtTmcxbdAnZZFMYgSIClJJe4aldjscpatDVowDz9PfHRWwzSvK
 5ehh2Cv0Q2JZVupwoAxE/5tR84zK+L89u6vsLAHhgN95YQBxjXrULY0sjy5EImrS4d25
 9KA8QFscriXuiQggAaZlQ3YITF3zntxWUoR5StcQnymT/ycSe8fELhGgl1gqMv0AD8dM
 tXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kEaQvWN4Z8yVJOtNMFNTVQ5YEguXpuTG96s4DFICCJ0=;
 b=et65J2b5wbUfmh5IQfbYl7HJxiHritDAQs1hioI8VNZuDtp8Ws5CP7xWVW+piXtzIf
 cu/cFAdTAHSs89KC6tddiSXf8qErJezQPgc4VAPPGtzrL730ltzaPwQUr3Y6hNav2N/2
 /Rxfw05IFNzv2yQznLyy4Ld+RNdt/WmFJoKbjGSV0JGM5JJSYPm7BXIJeXY847U3rZ4c
 SZiwZ+wFEe5WcA5tcivo0xjV3KV1l3/2LpZer5Ntiw8bn4GF6ufUVf7jpJ3EQKcaV6vW
 qiRODdk4jmtM4YvE8xY2E4N2yztvSPqKIWMs4TmdTFQG30IfhtLZWKNO1XKmzLVt8Mq1
 f1nQ==
X-Gm-Message-State: AOAM530bVy+McphxTxJlKQZknrLY9c3MowKXtQDptSwIMnaqHGIT7Lpn
 bQGcZuzwKshLQzBzNcEkcL5E3BK3qDXeGzW4uJPcqw==
X-Google-Smtp-Source: ABdhPJyNFE1wEhOEH03d5WveOtjIevlxoZNdPt2fGHLKPGOwI4mNzLVERkLgfGOFwAeF0imWrkJqYA==
X-Received: by 2002:ac8:7191:: with SMTP id w17mr5368523qto.199.1619205121519; 
 Fri, 23 Apr 2021 12:12:01 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id a22sm4834630qtp.80.2021.04.23.12.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 12:12:01 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Fri, 23 Apr 2021 15:08:16 -0400
Message-Id: <20210423190833.25319-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/5] drm/msm: add MSM_BO_CACHED_COHERENT (and
 related changes)
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
Cc: David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Emil Velikov <emil.velikov@collabora.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Bernard Zhao <bernard@vivo.com>, Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for MSM_BO_CACHED_COHERENT, a coherent version of MSM_BO_CACHED
which is implemented by setting the IOMMU_CACHE flag.

Jonathan Marek (5):
  drm/msm: remove unnecessary mmap logic for cached BOs
  drm/msm: replace MSM_BO_UNCACHED with MSM_BO_WC for internal objects
  drm/msm: use the right pgprot when mapping BOs in the kernel
  drm/msm: add MSM_BO_CACHED_COHERENT
  drm/msm: deprecate MSM_BO_UNCACHED (map as writecombine instead)

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  4 +--
 drivers/gpu/drm/msm/adreno/a5xx_power.c     |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |  4 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c  |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c          |  2 +-
 drivers/gpu/drm/msm/msm_drv.c               |  3 +-
 drivers/gpu/drm/msm/msm_drv.h               |  1 +
 drivers/gpu/drm/msm/msm_gem.c               | 34 ++++++++++-----------
 include/uapi/drm/msm_drm.h                  |  7 ++---
 12 files changed, 33 insertions(+), 31 deletions(-)

-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
