Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6E93F6BD7
	for <lists+freedreno@lfdr.de>; Wed, 25 Aug 2021 00:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957036E0E5;
	Tue, 24 Aug 2021 22:45:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F7C6E0E4;
 Tue, 24 Aug 2021 22:45:14 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id c17so21200516pgc.0;
 Tue, 24 Aug 2021 15:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=okg0hFDj8TjYsXX+EaNAzrjXTufRcIdi+BwPbEnVuq0=;
 b=VHaRffUTC9ofm4EXosGi3bHfkruxwkVWm26ty1xsnWvYcFJPfe1fLEitC93p+aiK3x
 YFFM5IFakgksv1QfC2j1IN+nkSurAaTOSBqJoJSsO/Uft+8AlsTvnqOjqeQt935rpnci
 Ff8JYfnedSzbnQpQVq6w01C4fVfKvAeDsAZZ4pgPiaaYbsOxwQYyS+32oQZKG/mFr9Zu
 y4+IcFs2JCNYKP2SbOqKaejUuwzlGqNxWwjLK35HCntbwz0Tk9RmuCSEJbcHz4uCODDf
 OZL1hqJQK2nHMbNOmxZpUgLpHPrTRx+H6rh6gQFS49r5Vogk1r7A9y/QGv8cmSrFZEYj
 4/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=okg0hFDj8TjYsXX+EaNAzrjXTufRcIdi+BwPbEnVuq0=;
 b=pfv7IwYXTO+coa1PrDMElprp0KZVYcMNr/opdWf5gssvhAWNV5oWfETzfunUE8OPex
 7IF3OAUCGuxtE4vHuCJaxF41dE+KdgSeDkhG7YC4hq29ioTzsaS5Y9Ii1+Ti7wM0uSfa
 iEc3prsAY57aj8otk3zPA5eajPukgd54DYdwuHEGyu6j7U+OuriM+CNW77gz8Td9pL/K
 Zi6xS0cJiUOhXDupcWSs3WyD5KMGRUXcY1fTD8quB57Pr3BXcX8wkjR3bj7/vWOyjehs
 pZuNMISMLhsoobgmsxutkHoJpAiFjHxGUeWHJZ8loaw/jW4RQT9IMeP7B5HozKsb9IuO
 4bIA==
X-Gm-Message-State: AOAM532R7mOyHumE4mY1YfFyHuOipACkrDkn85SpWgHh8ZhnBUxOzmdc
 Q3QZEI5PJL5zIADOHaEV98+dM4Ib3JU=
X-Google-Smtp-Source: ABdhPJyNwORw3GjlxMlyqjjW45WdD9XoCR3CwPyqBM0IRHK44V/DJSqosVpbgtToT7RXE3eBYAus9A==
X-Received: by 2002:aa7:87d1:0:b029:3e0:e44b:6429 with SMTP id
 i17-20020aa787d10000b02903e0e44b6429mr41886882pfo.81.1629845112856; 
 Tue, 24 Aug 2021 15:45:12 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 h5sm19330376pfv.131.2021.08.24.15.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 15:45:11 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Rob Clark <robdclark@chromium.org>
Date: Tue, 24 Aug 2021 15:49:29 -0700
Message-Id: <20210824224932.564352-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt 0/3] Initial igt tests for drm/msm ioctls
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

 lib/drmtest.c      |   3 +
 lib/drmtest.h      |   1 +
 lib/igt_msm.c      | 163 +++++++++++++++++++++++++++++++++++++++
 lib/igt_msm.h      | 128 ++++++++++++++++++++++++++++++
 lib/meson.build    |   1 +
 tests/meson.build  |   1 +
 tests/msm_submit.c | 188 +++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 485 insertions(+)
 create mode 100644 lib/igt_msm.c
 create mode 100644 lib/igt_msm.h
 create mode 100644 tests/msm_submit.c

-- 
2.31.1

