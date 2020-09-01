Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84BA25A10C
	for <lists+freedreno@lfdr.de>; Tue,  1 Sep 2020 23:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD636E03F;
	Tue,  1 Sep 2020 21:59:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E71C6E0BC
 for <freedreno@lists.freedesktop.org>; Tue,  1 Sep 2020 21:59:44 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id ls14so1295261pjb.3
 for <freedreno@lists.freedesktop.org>; Tue, 01 Sep 2020 14:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3rnwj2YW6I8HLfDh0uPTOzbh/3kFrbTfzm4Bn/WyYBA=;
 b=RXPbcL+/x/0/MCRLgV/vAAejfDzweAhJZwltTuPOwujDYS6sVTZv6LcDC0toDGfsR5
 27pTZsYznoxtJo9BWxj3FqS06iQt+BCkzz4EzmAtE+kXFe26jaN7/pwok/7gmxRtKHfG
 Pu6xK0H/CaFc3L4FSKt022kwlnRYfZVf6g/HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3rnwj2YW6I8HLfDh0uPTOzbh/3kFrbTfzm4Bn/WyYBA=;
 b=scZmN/H9hhQGFDzVsEerwSDUvUF9HN84yxi+MoT+LdY7vhDMaNzTTxH1gGc+IA9fqp
 vDEGehvM5oli5079x8pkcWzfbqjwgAbfevzDgbzpWwLwBUSpVlpstexDAglsdb5SOWl4
 uxeyQDDz2DFnDRqOQuenE1wIObod6/8M4a9ddWoeC/MUC6hk9LxSk7U9Ma0IJM2eYATL
 dKtp/xPS7qCTu0TE6IrSbRtokt/F8Jd6PNNOUpn5X2fnaSJ7T6LGDMKsSIo+W/3ePAei
 I4JQWJOPPakJc/qS7EnW0U9GA5CsnekkuyUBxXQcb0sH4tWRz4mofIh4vfMU0aNdDMy8
 BDNw==
X-Gm-Message-State: AOAM533S6mqNWt+a8qdAX51b9XtNLcQEfTRjHgBJradJfdfeZG6hxlHz
 yVZKmrqSeEhTsKDa8uPw36k2+w==
X-Google-Smtp-Source: ABdhPJz9RPfwEsuY9az8y012sHdT37924RbixUIVrrwiv3YuNEPc599qRWWZD3WwDHJJOHxIT49HpA==
X-Received: by 2002:a17:902:7b8a:: with SMTP id
 w10mr3245995pll.145.1598997583989; 
 Tue, 01 Sep 2020 14:59:43 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id q5sm3044037pfu.16.2020.09.01.14.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 14:59:43 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Tue,  1 Sep 2020 14:59:40 -0700
Message-Id: <20200901215942.2559119-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/2] A couple drm/msm fixes
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Two small fixes for an UBSAN warning and to make debugging a little
easier.

Stephen Boyd (2):
  drm/msm: Avoid div-by-zero in dpu_crtc_atomic_check()
  drm/msm: Drop debug print in _dpu_crtc_setup_lm_bounds()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
Sent by a computer, using git, on the internet

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
