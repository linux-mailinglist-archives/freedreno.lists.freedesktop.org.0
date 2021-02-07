Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA0531213D
	for <lists+freedreno@lfdr.de>; Sun,  7 Feb 2021 05:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FCB6E544;
	Sun,  7 Feb 2021 04:19:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E4B6E544
 for <freedreno@lists.freedesktop.org>; Sun,  7 Feb 2021 04:19:00 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id a16so6066965plh.8
 for <freedreno@lists.freedesktop.org>; Sat, 06 Feb 2021 20:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZuUSwDW1QlcZo//J19uXwwWVGrMnsuuGUvOzqh+LAAY=;
 b=XbbuIvVB/Ar1MJ2wdsGeAVmm5p6lIIZF+uPoC8txf+bsyY+gXm7mABMOlXwcXtMySh
 IgKTNiebjanc1weOVklTRdteWOdNyAZnvKgBSPlksrIeCsPCJx5MfazXzP9otQ6hMPuE
 ExCwcvR0YnaeyPfBJ8uG+HlkNc8RkYzTWFUpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZuUSwDW1QlcZo//J19uXwwWVGrMnsuuGUvOzqh+LAAY=;
 b=tbPn8awsoWvInfq+B4PZ0dZQ092z7oxih43r8SU2Ycs02WDtBlq39JoPmoEbXGp2Wa
 hJUguDKTOv7HL0MFNVDlC0WR6JerPBY3y4Rt1pqfMO52JlfqOZ0bNGGbZDq52X2t76KO
 WUzPA0Fn8fOtDDY3atVd+s9NFyUD3aeTzfviZk6Bqek7WqupVSeOhY9fM8/O8c53LLF1
 cyil5wdsVvQ6pg3ZTPpcGFDoKx6S10zG7HM7Y6K/31IlduWZv7di1DdQI5491uFnWwdp
 39UUbJjgjVesjRCF4ElqO8ZGj07R+RczKBAV22bSUUEfXGauEK1uyarAzMypat0du1Er
 2MDg==
X-Gm-Message-State: AOAM533+GDr4dupgTuTXBKdUXspUyE66/Dexfp1NfhzQK2uFjiGfhcLK
 aFmb8TcKHymvpx3eWMFBPP8OYA==
X-Google-Smtp-Source: ABdhPJzCyWtt6C/0vpNQnL1jkMGfNzMDP+aZniFfVTygDhZAtTN6sXQlhcGUh44k9O7mvq9Xen522w==
X-Received: by 2002:a17:90b:1a86:: with SMTP id
 ng6mr10787360pjb.113.1612671540567; 
 Sat, 06 Feb 2021 20:19:00 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:2c64:7ee8:fefb:fab2])
 by smtp.gmail.com with ESMTPSA id 76sm14392262pfz.174.2021.02.06.20.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Feb 2021 20:18:59 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Sat,  6 Feb 2021 20:18:58 -0800
Message-Id: <20210207041858.3317171-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dp: Add a missing semi-colon
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Lee Jones <lee.jones@linaro.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

A missing semicolon here causes my external display to stop working.
Indeed, missing the semicolon on the return statement leads to
dp_panel_update_tu_timings() not existing because the compiler thinks
it's part of the return statement of a void function, so it must not be
important.

  $ ./scripts/bloat-o-meter before.o after.o
  add/remove: 1/1 grow/shrink: 0/1 up/down: 7400/-7540 (-140)
  Function                                     old     new   delta
  dp_panel_update_tu_timings                     -    7400   +7400
  _dp_ctrl_calc_tu.constprop                 18024   17900    -124
  dp_panel_update_tu_timings.constprop        7416       -   -7416
  Total: Before=54440, After=54300, chg -0.26%

Add a semicolon so this function works like it used to.

Cc: Sean Paul <sean@poorly.run>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: Lee Jones <lee.jones@linaro.org>
Fixes: cc9014bf63a4 ("drm/msm/dp/dp_ctrl: Move 'tu' from the stack to the heap")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 55b7d0edffbf..95913db97616 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -631,7 +631,7 @@ static void _dp_ctrl_calc_tu(struct dp_tu_calc_input *in,
 
 	tu = kzalloc(sizeof(*tu), GFP_KERNEL);
 	if (!tu)
-		return
+		return;
 
 	dp_panel_update_tu_timings(in, tu);
 

base-commit: ce5226625a694fa5a46db241ac4c77a1430e37fe
-- 
https://chromeos.dev

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
