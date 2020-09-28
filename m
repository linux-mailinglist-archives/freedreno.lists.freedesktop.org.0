Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7969627B520
	for <lists+freedreno@lfdr.de>; Mon, 28 Sep 2020 21:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3530289E43;
	Mon, 28 Sep 2020 19:17:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D22189EF7
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 19:16:59 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id x123so1955958pfc.7
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 12:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2qNdYqoOUB+OZLN8seN5bCPLMM8MM4+7n2C6OfWpomU=;
 b=befVspTYDlHN4DlmLZsupFoi7jPta5gqC//lynZ5l53i2YXbB5O9eUUcoZFndL1WxH
 nZejR3NzvUXWKromiDfWv0Wl6OM3HQNv+sUSTzwBG4bOViXUpGY0WGpXO4Qbo5OEKpf/
 3ZmXqnV2ju2plBqQ6AJfNFbd8xkjW1XNzA1go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2qNdYqoOUB+OZLN8seN5bCPLMM8MM4+7n2C6OfWpomU=;
 b=RQB0UCI9GuFCRy+1tWl19anV8GMlCKBqU7iZBvW0ZqLKA8k0e/y9rTjgN6tMEN4XH1
 4DwHeukSDj6Ur2rdP1hiTRSTl1HIC/+Q0BzgRKBZociU2x+zGgEbIoOVBeLdwC1omrnU
 8b84QVVjKmpzcWwvORgE9GHWvuMnOTjxLMcpdy5RrXAUXa4A7dES50lNY1Bd5Rrj/W8p
 R7Ay3YKvy/foBf1HlElNSbpmMlv40P2RkIsCf/+lA89gyxTCSdaQvdRlF7OOmNd6RWoE
 Wvdh7mE1hWKgYnDbP634Ft/F0BelROg5DUp4fSQXsFVvyQLYkdMI6qIq9pKJmfCkOOm0
 k80g==
X-Gm-Message-State: AOAM531IezLiRI/Pd8fOKWTN336JkoKbHvNSqFn0LppOpqmn5qFaIKz6
 CRcczQjaErNdHzcIvoTILvvAIg==
X-Google-Smtp-Source: ABdhPJxl1izvLcsXx/2TwQ3vV6O+f5joDNou6VpY62cP+9NybxSHwAN8LcWiD0crnjsEwlkj0C6/bQ==
X-Received: by 2002:a63:c5b:: with SMTP id 27mr463688pgm.80.1601320618567;
 Mon, 28 Sep 2020 12:16:58 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id 201sm2532090pfb.173.2020.09.28.12.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 12:16:58 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Date: Mon, 28 Sep 2020 12:16:57 -0700
Message-Id: <20200928191657.1193583-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dpu: Add newline to printks
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Printk messages need newlines. Add it here.

Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f272a8d0f95b..cbe0461246f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -906,7 +906,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	}
 
 	mode = &state->adjusted_mode;
-	DPU_DEBUG("%s: check", dpu_crtc->name);
+	DPU_DEBUG("%s: check\n", dpu_crtc->name);
 
 	/* force a full mode set if active state changed */
 	if (state->active_changed)
@@ -1012,7 +1012,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		}
 
 		pstates[i].dpu_pstate->stage = z_pos + DPU_STAGE_0;
-		DPU_DEBUG("%s: zpos %d", dpu_crtc->name, z_pos);
+		DPU_DEBUG("%s: zpos %d\n", dpu_crtc->name, z_pos);
 	}
 
 	for (i = 0; i < multirect_count; i++) {
-- 
Sent by a computer, using git, on the internet

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
