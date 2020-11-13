Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 146A32B1C3D
	for <lists+freedreno@lfdr.de>; Fri, 13 Nov 2020 14:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490AD6E4FE;
	Fri, 13 Nov 2020 13:50:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71756E4FE
 for <freedreno@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:25 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d142so8201283wmd.4
 for <freedreno@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFGPsQBWaqIstUovZEQuV7ZoQw1xUxoIPu10HqknCTI=;
 b=hDDNRtwmjy7UzVPZNCJaQ+bu+PRm7kW3v0HnLqD/oaFNjNOldbhgb4hKirvW7RQ3XG
 txtByjBe8inFiRzGvNE+0ZhuM7fV8Syu7RL2PxTSw2iQ4LD1FFAVBa7/GJ93TuAgl0XA
 ACpV0/PDpouzHfBWTiLt7rJyhWBmcfvQ9qFIvNY4YbDDotBVfQmZZoxQ8vEKkrAwZ3DS
 i3XKYmnsRMMZb3YU7tGhZTUDY4RrTNSSIqPhVlTAfqW/ZFop7DarUDsHz7+LSVLhD4vD
 hnfZR+RX+VS+Bxjl5AVbcbeSDW5bYjOBDFd4HsO95GvFkJNQ/mV9Ogq4rZyjmic5vcYi
 FTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFGPsQBWaqIstUovZEQuV7ZoQw1xUxoIPu10HqknCTI=;
 b=VaJcAjj85LNkMDvNLLem+Fw/AOJkJfuVthfApVSL8Qa94Xi3gZM1VpCZpJgfQL4tXr
 mfGvQDfxWckU/A5KuvwtoHWOu0hrHDsTY5v1JuGKT6CefEmn6ib4bZzAEyB8WPIg8f5k
 mB+SOfV5jyi9VSI8ncaaQLO1CD1xlZTmtAForMMreAbN77h7LCbTiMjg/nvGxZpffgYI
 EhzwKBoy780eIAihz5TdjwyCIIuP34b30YMXbEEt9RrwNeV8XZvdriRLWviIwIATaTEc
 qMtccLyPDNa3zFxnROgJrM5mFHagnFb+7Zz3MOWDF0T16gXShwhPMeSkuS+C/UY47x2z
 aTqA==
X-Gm-Message-State: AOAM531VICeSgpo9Iwan1GYX0quvSItMHNWSmluAdirNVqogICPYZwJ2
 ajE8b42fCoUCWL52prs/gCxVjA==
X-Google-Smtp-Source: ABdhPJyRl6lkCY0QwpZX7ubai9WllsidpusPMAw7vEARujcTCQ0A8ompo9Cv1/xtXRSuPmAwCaT85w==
X-Received: by 2002:a1c:2cd7:: with SMTP id s206mr2533032wms.182.1605275424372; 
 Fri, 13 Nov 2020 05:50:24 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:23 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 13 Nov 2020 13:49:32 +0000
Message-Id: <20201113134938.4004947-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 34/40] drm/msm/disp/mdp5/mdp5_ctl: Demote
 non-conformant kernel-doc headers
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Very little attempt has been made to document these functions.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'enabled' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Excess function parameter 'enable' description in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'flush_mask' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'start' not described in 'mdp5_ctl_commit'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index 030279d7b64b7..b5c40f9773629 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -213,10 +213,10 @@ static void send_start_signal(struct mdp5_ctl *ctl)
 	spin_unlock_irqrestore(&ctl->hw_lock, flags);
 }
 
-/**
+/*
  * mdp5_ctl_set_encoder_state() - set the encoder state
  *
- * @enable: true, when encoder is ready for data streaming; false, otherwise.
+ * @enabled: true, when encoder is ready for data streaming; false, otherwise.
  *
  * Note:
  * This encoder state is needed to trigger START signal (data path kickoff).
@@ -507,7 +507,7 @@ static void fix_for_single_flush(struct mdp5_ctl *ctl, u32 *flush_mask,
 	}
 }
 
-/**
+/*
  * mdp5_ctl_commit() - Register Flush
  *
  * The flush register is used to indicate several registers are all
-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
