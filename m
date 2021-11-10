Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF8D44C6CE
	for <lists+freedreno@lfdr.de>; Wed, 10 Nov 2021 19:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499966E12A;
	Wed, 10 Nov 2021 18:37:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E806E105;
 Wed, 10 Nov 2021 18:37:10 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id r5so3816020pls.1;
 Wed, 10 Nov 2021 10:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fTqyXg15VQ6Usewdg3YZaLywhlttYK7TtczoWmiTCj4=;
 b=G1nZAjLdj5VAs6N6FkuhGu52Xu+4W96O2qk/fBNZO0D4l85Zr24Ir8RfkezRNW2j3U
 q4hwtLgB5bUvnKi96cMPDHzo3Cw8UboD1mPecViRFpvxXP69lQxBcoVi759sa0r5TTNX
 5zAiLz2Ne+LgeDBnTb4eJc+lip4t5X6zN3mE9QMzcXYJkwPbbzRlUtlSLtMyPybyKA2s
 ay1DGI73wg7/kFrcUF91vVRwmMI4WiBaxdc5x7ybZeeBvt0nPhnC0CwjtyIDNAyyDjTM
 1jLEg0wzaPZfu1LwTvFPlaPsjqbf7dt6g2EI1ShYAehv05/z0iHkSBjk4x1+ks4y9CI0
 T7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fTqyXg15VQ6Usewdg3YZaLywhlttYK7TtczoWmiTCj4=;
 b=KlBBYm0jlfBmMCg7uNQr52NF45bejU8RKjLZxnBV8aFQ0SuNfvsQ+zwO9WqMTERzXH
 7rmO9GPIalIlU5cMMRBDjLemMdKeUT6E6OGmHJpO+cSA2y6jGLokq1Xx9QF0eV6+fblJ
 oPJSxt99VsO5hjFbTEZ38RxWjHFFHR9+6yaj2y61s5DAyE/r8EWQtJnWBof/Loz7pSgB
 p8F2We5k2RL7IOXK4Fvw3GEydChS6gyaVmc6jNafZn2x3AHRZV5/F3quP5zutALQOMtc
 k2TomuyWWh7EIZDXrTQ06lyjU/7p9rLurKk8Lilm4gPvgxP4MKwmnN42vG+l9SIbPgi+
 iitQ==
X-Gm-Message-State: AOAM53079e//tHdJvYJ4dvgyvfHDY3vN6e4+jyBY5nA5N/pIgW2SX7D/
 SM9YXwo+hwA24ywDvF9yyAlJGXSp3Yg=
X-Google-Smtp-Source: ABdhPJy7ooc2BPjtBlaQOp8ySkSMhDHZ8t0r3JquEM+e95v2iYBmMLIveyhm3NKIEFAglm0BzwX3ZQ==
X-Received: by 2002:a17:90b:4f86:: with SMTP id
 qe6mr1139272pjb.198.1636569429333; 
 Wed, 10 Nov 2021 10:37:09 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 s2sm260067pgd.13.2021.11.10.10.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 10:37:07 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 10 Nov 2021 10:42:10 -0800
Message-Id: <20211110184213.649787-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt v2 0/3] msm: Add tests for gpu fault handling
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

Rob Clark (3):
  lib/igt_debugfs: Add helper for writing debugfs files
  msm: Add helper for cmdstream building and submission
  msm: Add recovery tests

 lib/igt_debugfs.c    |  17 +++++
 lib/igt_debugfs.h    |  13 ++++
 lib/igt_msm.c        | 102 +++++++++++++++++++++++++
 lib/igt_msm.h        |  51 +++++++++++++
 tests/meson.build    |   1 +
 tests/msm_recovery.c | 172 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 356 insertions(+)
 create mode 100644 tests/msm_recovery.c

-- 
2.31.1

