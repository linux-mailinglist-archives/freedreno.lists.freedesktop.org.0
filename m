Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDC4445E57
	for <lists+freedreno@lfdr.de>; Fri,  5 Nov 2021 04:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF086E5B6;
	Fri,  5 Nov 2021 03:05:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58FD6E5B6
 for <freedreno@lists.freedesktop.org>; Fri,  5 Nov 2021 03:05:32 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id v4so6088820qtw.8
 for <freedreno@lists.freedesktop.org>; Thu, 04 Nov 2021 20:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bBrM+10zUcr3Crlf+G77umSyOcr8vD3ZBHHHl7sVh1w=;
 b=AQFSE8l1TBEBpLSWYnXisexuUBd6hoFKen+aTDo8uIgbktzBs1PbYkcuVxA0mBcxP5
 Xfi71e9EIY/cEQtmedKdFbymtILy705bjgXBs/vuLkkDQNquj2REbP6m/BrL3hqWbMxc
 yzCv0Mv3CdQwFUf6XBTFQSOIlHk1tbi6q2XDTnhnIFwTFRigZeLyZ2hxDDMa17YIkd3J
 UEYePZ8lXreVohVj8zPpejAdqBA+vT51P4KFFFGEk891uV5UHwXIpOwLEU1l0Csw3S59
 M93Nnb464SaJJFV6yWa5kocTNhE92nKvOK8BMlGmMmyONUBuwjgJya4xFLO2rdPzBs6D
 Gauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bBrM+10zUcr3Crlf+G77umSyOcr8vD3ZBHHHl7sVh1w=;
 b=VaBk5uKnUDBjSY6PAOefSrcG+TnTBFki7/9R6YwGjuZcTyLmI9eZMkuTnfDS1ndy4Z
 WobwSth+RYAq/C94SE2YPMexLdeKTTqEJcuzbChVKbFIcU5RYy4z/60O28G7eyFPFtoX
 7r6JLla2TZ16qGviJ/Hvqt6N4xkkNLoby7VRr4VpZdNFmzPj87wWWpERroR5mxTFPNUv
 MXTwOtxjU2aWH5asDUD6SdqGiW5kMc+IyF6CduzcitZ9zQMi3sbjRcTg/c+iCqde03O9
 ogmQr4U6+3T11pkdyhCmobHnLB+edkcSDoRu7YX2/peejci3tzK1pASq5URKTC2lauHX
 b6/Q==
X-Gm-Message-State: AOAM531xjvrHejoECd+KU0k7KORxsP7Vn07rjfMogVuwrng6VofgWCYP
 gbyltw2cKgmRCbHRCMiNAAh/pg==
X-Google-Smtp-Source: ABdhPJyEdR52cxyX3J9bQK6t2hPtZmtUmF0WR8nW0o5wVdFAPNLEf5ivgXOnvuKUZNe67k1wbYCtgg==
X-Received: by 2002:a05:622a:104:: with SMTP id
 u4mr57017431qtw.143.1636081531844; 
 Thu, 04 Nov 2021 20:05:31 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id d3sm5398434qte.4.2021.11.04.20.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:05:31 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Thu,  4 Nov 2021 23:04:28 -0400
Message-Id: <20211105030434.2828845-12-sean@poorly.run>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105030434.2828845-1-sean@poorly.run>
References: <20211105030434.2828845-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 11/14] drm/msm/dp: Re-order dp_audio_put in
 deinit_sub_modules
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
Cc: jani.nikula@intel.com, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, swboyd@chromium.org, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, bjorn.andersson@linaro.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Audio is initialized last, it should be de-initialized first to match
the order in dp_init_sub_modules().

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-12-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-12-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-12-sean@poorly.run #v3

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aba8aa47ed76..79412a8fbaff 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -707,9 +707,9 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 {
 	dp_debug_put(dp->debug);
+	dp_audio_put(dp->audio);
 	dp_panel_put(dp->panel);
 	dp_aux_put(dp->aux);
-	dp_audio_put(dp->audio);
 }
 
 static int dp_init_sub_modules(struct dp_display_private *dp)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

