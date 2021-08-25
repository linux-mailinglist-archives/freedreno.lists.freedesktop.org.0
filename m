Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B05A3F7EFE
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 01:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BD86E43D;
	Wed, 25 Aug 2021 23:27:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390036E43B;
 Wed, 25 Aug 2021 23:27:15 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id j1so834046pjv.3;
 Wed, 25 Aug 2021 16:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=irm63N1v7jiSbm/lFOnEb45IxGHQFi8vlCoxcbEKkXg=;
 b=jZzmi0k9GW2sHueWQEojILsnn44e2ag1mgng+YXDTj8ls5E2MvUj2AwSZP+eYhF+gR
 Y44IHF05tVmjHitUaYQTl2LIS2olDqH1WKViKZ4p0OxaQhS/HPwn69ghDNJ/ShJC3Cft
 qXwcozGOyE0Zc5xCghDZqzoc2MHEAooHlR2tZNmkXdzQfDiqx35JHWbqwxKhrdK1pXJx
 kOTBLDkf4hSXi1mir3CO1oQlt4G3mFmCcNzS5+KGCivD53LrdPRVoSbAbKu18hf6idwc
 eXaLE60A5KMqunRtOhwxWPGH/QQrI3V2LTbMyktGwMRR6ZH1TJINkS7uEz/CfGaeCsBe
 3dfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=irm63N1v7jiSbm/lFOnEb45IxGHQFi8vlCoxcbEKkXg=;
 b=JVqeYDcZXfkUDmFbInUt8QwL6cn1Rr4sftONiFprJbYI4SSTh4nVNQM+KEwIUlqKlz
 /54l/CkOLO9Zbzat/yKh+xL58lxiWccbpJA2aMtR8wg1k7SbBIguv9WRLSmye3m0mSb5
 lgCOXTyfmaDrTgOAk/pT0cw17hytTpN3cfUHF3WGplvhygs1ccVUKweQhjG5JxLPqtkh
 9up6+zJzGVnx5f1CQlvAW6taUI2BuQRdGk3ecdjPpHJrKJY13fsKWhp9UyIzg8R6tmNN
 TZKt1tX+MfwwgJi5iziVowSnaVAVrfxTnX6XUMYEed20YqFwTgR2OTxroK4zce0v3qpb
 k4vw==
X-Gm-Message-State: AOAM533uirzH4JJcDZqhX54cLM3OMB/R8g63CTz56O+NMVATy9bH7+rX
 clvTxAVmKafyxt8rtDYHZadYshMjBh0=
X-Google-Smtp-Source: ABdhPJzSzAEdIfTHhKI9WjMVsnrG+asJfiDgMOMvO0BxkqoZr+sMnhB6e78os75ClZ86cNwICcGgBQ==
X-Received: by 2002:a17:90b:4b49:: with SMTP id
 mi9mr799346pjb.87.1629934033994; 
 Wed, 25 Aug 2021 16:27:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id o75sm701970pfd.211.2021.08.25.16.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 16:27:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Petri Latvala <petri.latvala@intel.com>, Rob Clark <robdclark@chromium.org>
Date: Wed, 25 Aug 2021 16:31:36 -0700
Message-Id: <20210825233139.1066504-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt v2 0/3] Initial igt tests for drm/msm ioctls
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

v2: add msm_device::gen and drop igt_msm_pipe_gen().. any test
    that needs to build even trivial cmdstream will need this
    so make it part of the util helper code

Rob Clark (3):
  drmtest: Add DRIVER_MSM support
  msm: Add helper library
  msm: Add submit ioctl tests

 lib/drmtest.c      |   3 +
 lib/drmtest.h      |   1 +
 lib/igt_msm.c      | 171 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_msm.h      | 119 +++++++++++++++++++++++++++++
 lib/meson.build    |   1 +
 tests/meson.build  |   1 +
 tests/msm_submit.c | 186 +++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 482 insertions(+)
 create mode 100644 lib/igt_msm.c
 create mode 100644 lib/igt_msm.h
 create mode 100644 tests/msm_submit.c

-- 
2.31.1

