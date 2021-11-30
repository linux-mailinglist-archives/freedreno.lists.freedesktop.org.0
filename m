Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE275462930
	for <lists+freedreno@lfdr.de>; Tue, 30 Nov 2021 01:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4FE89C16;
	Tue, 30 Nov 2021 00:38:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E32289BF8;
 Tue, 30 Nov 2021 00:38:06 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id q17so13521030plr.11;
 Mon, 29 Nov 2021 16:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M6jA8oMIw0WKWHCuk49iV8tiF/OHiCn1/finUYhXsR0=;
 b=KVhdnnVCAHFsnPWTe8VbiVosUJrhlRWbOSYmJClKVCe+VaZ9aA4E3msky0yZkhPOge
 TzupGUhq4ZPtg7ADrwgLDGYCASQFORJMqNvPVcoQs0utulSImhgQObjvRJlGbjlb/Xy9
 oh9o2Hux8wQWaM56+sppx19SGsuIv3LV0xyvEq8ZzZdGO1OpomzqAoBZXjJBryYy4lEJ
 rFrmxptwAQTL1N0GMrjc11yDF0VH5UscoTYWSvRAVdlxaFM9oOMyanCoxCrQnNvnsYxk
 dCRk6JroPiKlcHOB+w1d6HyZ5tXZ5dTQu6kbz78D3XjFPneDl3YC4yx1o3FSWrtx6LR9
 2nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M6jA8oMIw0WKWHCuk49iV8tiF/OHiCn1/finUYhXsR0=;
 b=L2DxylL77ab3uZIzN9jXKDEf0Wn0a2sJaKv1/67Txb2AailsPuowLaoYLMffJPQLjf
 pJJjBF9KAh2w5fiRvp4Hch/h/gemEAbxb9DeRGumxIadw0ImUobcHxCF4IFW3odVffig
 MkUxqyxedW1xnJmy5L0RumlmC1rN8c7483DXMzbkbbz912e5uAmoI4TCkokGrnLDgNlx
 kqyhjuyaW8kfVkzQQlU0DhnBlERTuJVgaNoSatss8+yZV+wh9p94xtwRwXgwkPjKS6xW
 5QrkGmFZbEimg/KsbxbXSCrmg9tZ6KqoU0Wu3qS14CfVJwgEpKhwkGG63iL49BkKDcXt
 b7/w==
X-Gm-Message-State: AOAM530kP3jg+aFnsppIZQ/bYbY+1l2R/O2rQHx4nUp4frN8ybzul845
 rSJzj4bW21a0r6dnB+9e7rcaR6AHd80=
X-Google-Smtp-Source: ABdhPJxr4vcGGEbi0ZQCjgz2Otn7VtmY0sJgzJyqo2TQplX3iJXsHGDpQ/KAc6UTGYi8vxdBYnqJZA==
X-Received: by 2002:a17:903:22c6:b0:141:fac1:b722 with SMTP id
 y6-20020a17090322c600b00141fac1b722mr64866311plg.23.1638232685180; 
 Mon, 29 Nov 2021 16:38:05 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 c18sm19028535pfl.201.2021.11.29.16.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 16:38:03 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 Nov 2021 16:43:22 -0800
Message-Id: <20211130004324.337399-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt 0/2] msm+lib: Add test for buffer mapping
 permissions
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

First patch just splits out a couple of helpers from igt_sysfs so they
can be re-used.  Second patch adds a test which locates the address of
a given buffer, and verifies (depending on expected permissions) that
writes and/or reads trigger an iova fault rather than succeeding.

Rob Clark (2):
  igt: Split out I/O helpers
  msm: Add test for kernel buffer permissions

 lib/igt_io.c        |  96 +++++++++++++++++
 lib/igt_io.h        |  33 ++++++
 lib/igt_msm.h       |   1 +
 lib/igt_sysfs.c     |  45 +-------
 lib/meson.build     |   1 +
 tests/meson.build   |   1 +
 tests/msm_mapping.c | 257 ++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 394 insertions(+), 40 deletions(-)
 create mode 100644 lib/igt_io.c
 create mode 100644 lib/igt_io.h
 create mode 100644 tests/msm_mapping.c

-- 
2.33.1

