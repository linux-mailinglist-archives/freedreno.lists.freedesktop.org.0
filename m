Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544313FCB41
	for <lists+freedreno@lfdr.de>; Tue, 31 Aug 2021 18:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BB36E0EA;
	Tue, 31 Aug 2021 16:12:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0926E029;
 Tue, 31 Aug 2021 16:12:49 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 d3-20020a17090ae28300b0019629c96f25so2820283pjz.2; 
 Tue, 31 Aug 2021 09:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nJ/vHQ8m8iLAMD8+ZyhKRlQPyo+UcB05ujjGTF6TT/E=;
 b=ShrvEdu4aBcZuH9JQOrGSy5IboFfiYymwSoisBjRrV5v7aapU7MLCcajLG+cvPcidq
 6rJkTEoUyl21HJ93R/q0D5Y0dWQvWFsLjCEc6TKpRrxYBI0LBoRc3lFXuolvQoZSaMjs
 M1v8rZ/k+KK/Y/wcAQj3jzeFJQjfRLhtkVmP39glhN52Lxmw+btmis/QMLmD2O2urNNj
 kmk6gx9Zxsti+4SHkTEVJ+DsZA67rCM1NthxOO8oieo+6RI/SHguz3UjMcgcImWQMG8L
 qpIPaewOz3j+3kFeitJN39iIt9RCrmEB7fw6jj9HVCp09nDNMknxvDIUhxKBt/PlEbQO
 AcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nJ/vHQ8m8iLAMD8+ZyhKRlQPyo+UcB05ujjGTF6TT/E=;
 b=Ycwa8R9tPE47vsnAVfPYyi0NGGj4KHcDkqE8ImNKQbjUK/6wq3nh4fQocaBBtsPGvz
 KeVaOlz7Fs2L+Te0IRXjoOLtFMFSirsDFnfa6jN5ghRIXbNgkUIwdUVcr2GUZV2M8HI3
 5X8leCQa+nBitQI2V1YjDeI4A9/DW9RRWnEuNavpzr5FJzcEHzHM44G2r7KeqiBShYFA
 CHd21MBzRQgcccDo6AUbVLX6YbBGdW7LCDF8/VGkfJ8JLqvBefQWl8HiTT8oH2p1vDzc
 J2lN1EGzA69ukgFjpLert8T0SeKFO1o6hNjHDFWOdd1f3GxZngFYWYjNT7z1vZNgl41z
 Y1Vw==
X-Gm-Message-State: AOAM530Jyl+CyCVv139ZJv83k2tXUUEbn2fnYW469WP0gxfxQfx3/01U
 tMafaCFFDYWiE3QT0fLvQscTN35wZeg=
X-Google-Smtp-Source: ABdhPJyfGDeblGXkDl4WZ1mV/1NAF3JEfJAqlDwzgZp48do1VYkeKvrEdCp7apeoDZQRlFawms82AQ==
X-Received: by 2002:a17:902:6b47:b0:12d:7aa6:1e45 with SMTP id
 g7-20020a1709026b4700b0012d7aa61e45mr5351215plt.80.1630426368260; 
 Tue, 31 Aug 2021 09:12:48 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 v20sm21386083pgi.39.2021.08.31.09.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 09:12:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Petri Latvala <petri.latvala@intel.com>, Rob Clark <robdclark@chromium.org>
Date: Tue, 31 Aug 2021 09:17:13 -0700
Message-Id: <20210831161716.1400057-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt v4 0/3] Initial igt tests for drm/msm ioctls
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add an initial set of tests for the gpu SUBMIT ioctl.  There is
plenty more we can add, but need to start somewhere.

Rob Clark (3):
  drmtest: Add DRIVER_MSM support
  msm: Add helper library
  msm: Add submit ioctl tests

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/drmtest.c                                 |   3 +
 lib/drmtest.h                                 |   1 +
 lib/igt_msm.c                                 | 211 ++++++++++++++++++
 lib/igt_msm.h                                 | 142 ++++++++++++
 lib/meson.build                               |   1 +
 tests/meson.build                             |   1 +
 tests/msm_submit.c                            | 194 ++++++++++++++++
 8 files changed, 554 insertions(+)
 create mode 100644 lib/igt_msm.c
 create mode 100644 lib/igt_msm.h
 create mode 100644 tests/msm_submit.c

-- 
2.31.1

