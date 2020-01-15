Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6698113CE61
	for <lists+freedreno@lfdr.de>; Wed, 15 Jan 2020 21:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C236EA9B;
	Wed, 15 Jan 2020 20:57:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe64.google.com (mail-vs1-xe64.google.com
 [IPv6:2607:f8b0:4864:20::e64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7006EA9D
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jan 2020 20:57:19 +0000 (UTC)
Received: by mail-vs1-xe64.google.com with SMTP id n27so11324412vsa.0
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jan 2020 12:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qHyeBb8P8MuXBOujO8Ub/x9es/mztS5rWLEPJQm2/Ko=;
 b=gemQ994QSr6JkWm5dYBVsYR1LIUE6WIVOW8OxEKlh9bU4AqNaICD0FbZpeOl6z/LAl
 vuC+aCpJJETBjSq2TECPu90Go2szUdkpo1gjupaHPIGJ9ZZooVYxI71Rirzmg6A4bu1L
 C/inqb7wdAsLxPei6JNCqpy1b5SAaEnWS23sMH6VFSBAKedca6LycF29bEiadY3uRsC2
 5pyd9Vh82G2+fmvOBf/aPdjBWU9KkWz+IfbKfdlYWoElECqklH7jr3veHq3W7vdY5cHF
 /ZlDSYv6Igq7WkuojeDl6YSvE69k3n6aCqYrLg13TbuutyCBl5JkOU/tEG1KzumGXC9M
 Tfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qHyeBb8P8MuXBOujO8Ub/x9es/mztS5rWLEPJQm2/Ko=;
 b=JfUjri3bvJDPqiS9ZC2X462ayW0m4b0oHaGhXra2SSZ6tVL5RvnCRSmgHJiYl2oifY
 JAwlP27J9tSFj5aR+L1qnUf+BF4cHPlUc8PFQC148XBUYYxNaAi55tuznC/O7hG/MZMo
 mOFqWBRRtnY5OJySLKrWUDI4EwePZUX0+1SRSqO62I1NAm8C/u7kXlt9Rtvku/NaB8s1
 gvUISm/CoijZ61tFZqSBNUWhZMgWie+AlYtxGFQwlCtKX29UIofu8LFphDatZmXSiQTU
 CDlzbT+fGDtz075zC6R8EZL1AW52ixzw14J0DmfUzn8w3U15VbfFimd0IIlZBR0heXs3
 wPAw==
X-Gm-Message-State: APjAAAWIMFhBbHh4BI9QJQHVzet4vdWiVSi1qYxgSaQIwk5OOPSZqE52
 0O/9R2kgff9pOiKbnWzVydDkndxjmzYJ0tmLuWziSgpZbQOdwQ==
X-Google-Smtp-Source: APXvYqwa4eobrkUlejkxbm2vmrBfah47TV7vVGHvbgpZIUMZp/IuDRvCLBzND9WHntaSOfLkMYAbMYa3NIun
X-Received: by 2002:a05:6102:3126:: with SMTP id
 f6mr5458988vsh.204.1579121838618; 
 Wed, 15 Jan 2020 12:57:18 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id j26sm1472756uak.1.2020.01.15.12.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 12:57:18 -0800 (PST)
X-Relaying-Domain: brkho.com
From: Brian Ho <brian@brkho.com>
To: freedreno@lists.freedesktop.org
Date: Wed, 15 Jan 2020 15:56:47 -0500
Message-Id: <20200115205649.12971-1-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 0/2] drm/msm: Add the MSM_WAIT_IOVA ioctl
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
Cc: robdclark@chromium.org, Brian Ho <brian@brkho.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 jcrouse@codeaurora.org, hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patch set implements the MSM_WAIT_IOVA ioctl which lets
userspace sleep until the value at a given iova reaches a certain
condition. This is needed in turnip to implement the
VK_QUERY_RESULT_WAIT_BIT flag for vkGetQueryPoolResults.

First, we add a GPU-wide wait queue that is signaled on all IRQs.
We can then wait on this wait queue inside MSM_WAIT_IOVA until the
condition is met.

The corresponding merge request in mesa can be found at:
https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3279

Changes in v2:
    * Updated cleanup logic on error
    * Added a mask
    * 32 bit values by default

Brian Ho (2):
  drm/msm: Add a GPU-wide wait queue
  drm/msm: Add MSM_WAIT_IOVA ioctl

 drivers/gpu/drm/msm/msm_drv.c | 61 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c |  4 +++
 drivers/gpu/drm/msm/msm_gpu.h |  3 ++
 include/uapi/drm/msm_drm.h    | 14 ++++++++
 4 files changed, 80 insertions(+), 2 deletions(-)

-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
