Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D7E44B243
	for <lists+freedreno@lfdr.de>; Tue,  9 Nov 2021 19:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80086E856;
	Tue,  9 Nov 2021 18:04:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0116E4CB;
 Tue,  9 Nov 2021 18:04:06 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id c4so93703pfj.2;
 Tue, 09 Nov 2021 10:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5hZIPrBq+zl7CIYaIh9T3HI7tQDhLiof+jHo3mVyyRQ=;
 b=GLgQMw9TaqPKomDdx+OYzx0Xl3qywVMf73hCzSoZ16GF35CAaRovYCmpj29R/60qRF
 0dX3T4CagvN7tCCBc/W7HlNC2C8g5+aXb6VLVeQsLJoxeL1mkRC/mvuTs2/nuop5m99B
 SX8MqSvdL/spZgEpB6m0CLRi/Jcz08igAKg1jMy0yLWIwsgZFEFAZvHCctU6XiZMT5O7
 lgiZzZSFsJlOqtg8TJQRSauh7fyVu1TFFZ6/vMJ5dQbN6B183hkdtPK5DVrBG0nnuL9j
 S6DIxyh6QWgyt2EDyRYLlLZNxkbxR8rBrdPuHY943286i573uled3r+n/75P6hX9wWq3
 kc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5hZIPrBq+zl7CIYaIh9T3HI7tQDhLiof+jHo3mVyyRQ=;
 b=a4tUwbWFEWE2/HJq3060wxgovkYVy6gm8Z2VmFNIuD3sUB/fLo/ldB0VaRhAFuUFRg
 4m1GVRriTIUcAqh4wYxe7Gmuu2m22AsR+2AVPq921zZJPju3XG8ubDZIzZQKIaFHFChV
 fWuhBCEUTMhqCmh68Blxeszha27869VAhg8iSl0NZpETgDFJCwR0a/6TeAggn7FiSp9p
 lhZjZIpjQX/D+I/34ZrJ22BWoWkeU+XcG6ynve0llNMXE2qOUCRpEA2E90nZOsaGREHZ
 0j/g2vKu5vCPZJED0FyVl5X2D/GvfbDzDsdg2WX65SmMhqWKBe8hcTDpcdj9SPputv80
 NUsg==
X-Gm-Message-State: AOAM532vLNeBHn4SrIiYRbvmySrEFM7a6LjV0oqljt9TxD0w7h2Sy12+
 m/1fnnuGmimjVWPH9bXRaEH6Lf1Qvag=
X-Google-Smtp-Source: ABdhPJwPo1wYioUsjuKeUMWrLB9ZxJQm/+gE139zuHXR2cxOJEsLkjG2ZHAyCAHAAWQPOJpTWHimKA==
X-Received: by 2002:a62:b606:0:b0:47b:e32f:9ca with SMTP id
 j6-20020a62b606000000b0047be32f09camr9721807pff.57.1636481044819; 
 Tue, 09 Nov 2021 10:04:04 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 t13sm15507771pgn.94.2021.11.09.10.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 10:04:02 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  9 Nov 2021 10:09:02 -0800
Message-Id: <20211109180905.590773-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt 0/3] msm: Add tests for gpu fault handling
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The first patch adds a easy way to write debugfs files (needed to
disable hw fault detection, so we can test the sw timeout fallback).
The second adds some helpers for cmdstream building.  And the third
adds the new tests.

Rob Clark (3):
  lib/igt_debugfs: Add helper for writing debugfs files
  msm: Add helper for cmdstream building and submission
  msm: Add recovery tests

 lib/igt_debugfs.c    |  16 ++++
 lib/igt_debugfs.h    |  12 +++
 lib/igt_msm.c        | 102 +++++++++++++++++++++++++
 lib/igt_msm.h        |  51 +++++++++++++
 tests/meson.build    |   1 +
 tests/msm_recovery.c | 172 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 354 insertions(+)
 create mode 100644 tests/msm_recovery.c

-- 
2.31.1

