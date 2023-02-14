Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC4669566A
	for <lists+freedreno@lfdr.de>; Tue, 14 Feb 2023 03:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D582610E073;
	Tue, 14 Feb 2023 02:10:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A1710E7BF
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 02:09:59 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id h17so16873833ljq.4
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 18:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NUZxia39KmOd95/1X/mi4qtVDn1DxbEw4iWrgdt25uI=;
 b=D884lBTIs+xeTiJamcskBqMMshJVklBckHxzHVJxhoDR4+M994/O9OxtVHJEN+i9bR
 /9gFPB+SnSUvedKTMQH3YalhfCiY/CB01RrF120YLcEHn/HKeMmLCmfGyHQIwSh86bSv
 1icvXTgLruDkuPJ+GW6/9ZevCu+F6Ouh1tkBjaOJgnk3aNDxYJ22Zd5XluzKQJpf/1op
 HJgRqTz5lQF7H6lPsUKqVfOq1meXrYabA9JfyibStLrKCiVmG5zv4Lh7BROKOrzvfU4W
 TCtLm0Ds8wesAkHC/pkQomKL+FftX9nIHyQXVEksO3EPfW2kyoM9roeOm3SLvAEfYqU6
 C//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NUZxia39KmOd95/1X/mi4qtVDn1DxbEw4iWrgdt25uI=;
 b=Q/PFRb31TVdPa+h91UxJ8SwiUfV7ZF6YlqzkRFrwWhUFu85ZX4KOGjhMR/eA5Y5lyC
 H8Pi3mjb36wJkH5ojxmrhwRtoz4gJaKzREWbJfVoOfZ63ez345eDpQDmnzHnlBesRMa9
 RYbOpdr2jVJvPCtEEQEMobKSNQD1zEy8OP4m5zO0HQcWOVKojp/eSZfjSzWdtRb/3Qd6
 q4iiI9BiSXnkuXFqkswTGc8IErUWySYzzgUgeJf0TXJjNlOeJGeE3cE0NdT4Pz3ZjTnq
 kzUpXkgupAJX7etulnPEp/Ob++i/dfskIm7iMM4/DDelgfX8P4mF8ccW8klHdfyyS3r+
 o+Ig==
X-Gm-Message-State: AO0yUKVWr5RqXgZSs2kSDCb/CR4WPAW5SBWFFD8J2TOtK1FkFYXHub9g
 la2wzOcxG28U9rDvG8rgqKIh5Q==
X-Google-Smtp-Source: AK7set/UWLb5Lkz55p0NgV+9IoDwUsfA2RFxX3Vl1on0pxk2ofkmeDEDDcfWuFkHvYwooh4eknAC1A==
X-Received: by 2002:a2e:6a08:0:b0:293:4b59:52a3 with SMTP id
 f8-20020a2e6a08000000b002934b5952a3mr97952ljc.2.1676340597847; 
 Mon, 13 Feb 2023 18:09:57 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a2eb711000000b0029066c8906dsm2239518ljo.23.2023.02.13.18.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 18:09:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 14 Feb 2023 05:09:52 +0300
Message-Id: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/4] drm/msm/a5xx: make it work with the latest
 Mesa
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
Cc: freedreno@lists.freedesktop.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Jami Kettunen <jami.kettunen@protonmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Mesa 22.3.x changed the priorities used for the GPU contexts, making
kernel switch between different ring buffers. This uncovered several
issues in the A5xx preemption code, which are now being resolved by this
patchset.

Dmitry Baryshkov (4):
  drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register
  drm/msm/a5xx: fix highest bank bit for a530
  drm/msm/a5xx: fix the emptyness check in the preempt code
  drm/msm/a5xx: fix context faults during ring switch

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 6 +++---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.30.2

