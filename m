Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A103451D50
	for <lists+freedreno@lfdr.de>; Tue, 16 Nov 2021 01:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2CD6E4DD;
	Tue, 16 Nov 2021 00:25:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D17F6E4DD;
 Tue, 16 Nov 2021 00:25:32 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id n23so15951010pgh.8;
 Mon, 15 Nov 2021 16:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ovgz+c/G4HmT8RdtVZtP0zl3x+vOpNV/x6Tplf+zGMI=;
 b=jexPYtw+rlIyvblwu9Cd9zDPVKoA+4AUoLuy9gcaxmaUcXuhzuKrYP23OF/jnHs9B6
 Yh29WTXm0JehaeaPlnjxNzqImEZP/E1LxMwEZsw70KAHqHB2/HO6N/ivq46uQGjriwne
 wUXiHhmaIqRRllqLFDyuRgfgflTLqfMzpKwvbjVVn9A1fLG80LPtLZyJociuctNcKsD3
 byvU0d1yLwSu7IZXMFUVCQtKaiwuQNxyixG6U36ZB/sFPWCOUihBdcXTE2i+jNHTsTPg
 wT/wajfbPCnNrtlf1I+vfVPooz2TltuPOV2aq0xkQ/fYdC2tXZFs0DNTspb5XQgFAt8o
 npcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ovgz+c/G4HmT8RdtVZtP0zl3x+vOpNV/x6Tplf+zGMI=;
 b=JvAOoywof+3xVyyh52kbbnNtf3wNGQV1XWZuPZgUzvO3q1wS6ZIGOCbEQjLygyILWV
 q5ZwY0U6VunSMdJk9rJi21dvM2NEOc0ERF8RQEqftNT+OQLVx65fTLxNJOEaYJfQpRFR
 CblnRPtCY7g+rM1UGJYAJw2mU/LkRbsMiXtzVH1AOVu/WErS3GVzOBN5wRzVUIOWwv08
 vLceWpcwQttdmAC0NjNfTzyrgOuJ2oR901ZFRC6MeW/JVG1YDK+f1hnV+mJgNCYm/iCl
 eFtPswCJU44Q+E66lkqVOP+uwkFc+Q6+mqZoTRIElZRkxQMZ8U2L1bATvMpX6U/nhsrK
 xM6Q==
X-Gm-Message-State: AOAM5336v8M2hnBCfJ/VotxflLHDL7FGGT4FvsDq3U+cOU29GHC7rY2s
 daVZmA4OQb08VgdonQGcPyHaTbpCoCw=
X-Google-Smtp-Source: ABdhPJzqE0JSEFJhEcbnhbY5Sqk2LUEFII9yecnh0tfle2h9jmn0ZO5etbyYJoebmgR3UIZaO8UFHg==
X-Received: by 2002:a63:384:: with SMTP id 126mr2072546pgd.33.1637022331235;
 Mon, 15 Nov 2021 16:25:31 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 e13sm13093792pgb.8.2021.11.15.16.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 16:25:30 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 Nov 2021 16:30:38 -0800
Message-Id: <20211116003042.439107-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt v3 0/4] msm: Add tests for gpu fault handling
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
Cc: Rob Clark <robdclark@chromium.org>, Petri Latvala <petri.latvala@intel.com>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The first patch adds a easy way to write debugfs files (needed to
disable hw fault detection, so we can test the sw timeout fallback).
The second adds some helpers for cmdstream building.  And the third
adds the new tests.

v2: Fix headerdoc comments in first patch
v3: Add helper to detect debugfs files and updated last patch
    to skip the one sub-test that depends on new debugfs when
    running on older kernels

Rob Clark (4):
  lib/igt_debugfs: Add helper for writing debugfs files
  lib/igt_debugfs: Add helper for detecting debugfs files
  msm: Add helper for cmdstream building and submission
  msm: Add recovery tests

 lib/igt_debugfs.c    |  38 ++++++++++
 lib/igt_debugfs.h    |  14 ++++
 lib/igt_msm.c        | 102 +++++++++++++++++++++++++
 lib/igt_msm.h        |  51 +++++++++++++
 tests/meson.build    |   1 +
 tests/msm_recovery.c | 174 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 380 insertions(+)
 create mode 100644 tests/msm_recovery.c

-- 
2.33.1

