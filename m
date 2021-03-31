Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8675F3501CE
	for <lists+freedreno@lfdr.de>; Wed, 31 Mar 2021 16:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202336EAAB;
	Wed, 31 Mar 2021 14:02:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461186EAA5
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 14:02:26 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id u20so23935429lja.13
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 07:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MuZeoVHEvpr+twaPQswyeU0R2hfnHxepbRcYA7KH75o=;
 b=l2L1151wnl4+sV7aqaC0RpYZ079X1QdGAxyQCBF1iuFD7wABWyAUSHIto1S6x+Wo2f
 jhdUJCof/A4cyK5X1JqLk2kJRYHYt9cWaasAfERA2gpRvfvxL0yo/d8mamjt7+WVUEi6
 XLstzAle4OxKEzzYhB+4xIpBQhT620M7p6lO9aILLRyMqZIuBC9KVR4P7R7hAqXlVkCd
 GwkSNnDzCUMJRaP0YPlh78rEjATEpy4b8ykGhenOQGgvzQ1FFrRBA5idJNbTEkl2sIZ8
 xO4nEIK7CWmmi1iX/DzFy0qHrpHOGAgKHPVqUFFGn3lg4BkEaEePuvZCnTbHe6Lrd57k
 o8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MuZeoVHEvpr+twaPQswyeU0R2hfnHxepbRcYA7KH75o=;
 b=AU6nQihc2BExMgYJJ861PvB8Pmtyl3aNtoQozvx7qz59yzyepgU9sybJZcac+MCZrd
 wJJA+asp/QA3T+FC3CEmzu800YJgQAoJzvmA8Erl+7jevog6S8rDwFmJ5Zd4YIJEf6+9
 Vjyw9+XPcJ21qwF6M9NMznNNwHF1rXB5wY3uGHXCZpc+CCA9m3Y73Cf0D78s7CKNyI7g
 u3GM1vmRQnUL4pF4qASiXRHPd7JAbfcgwSu/oL+TMQqqVqA/DvsxOMOds5/cBM28cAja
 ZuYD4u8VbU8DK5xuBinytn6I5CfF2FgD7Bts+ody0I2zRZkXTqDdWZK5ZEOL9kynWAsR
 qYmg==
X-Gm-Message-State: AOAM530aV0O6YU+HJAsCg3CVikcEfWiE+h08mu+yuPUIjfQjp0YncRlv
 kRQuVRDBhVSRrhi38qLkuRbikA==
X-Google-Smtp-Source: ABdhPJy8Mbo2B65joihqEln2ts8luLCR7ANP31lGLObFfH8jrCzNlaIxSnlSSk2VBmLQqc2BJBl2lA==
X-Received: by 2002:a2e:320c:: with SMTP id y12mr2250115ljy.360.1617199344558; 
 Wed, 31 Mar 2021 07:02:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id r123sm245033lff.27.2021.03.31.07.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 07:02:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Wed, 31 Mar 2021 17:02:23 +0300
Message-Id: <20210331140223.3771449-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm: a6xx: fix version check for the A650
 SQE microcode
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Jordan Crouse <jcrouse@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

I suppose the microcode version check for a650 is incorrect. It checks
for the version 1.95, while the firmware released have major version of 0:
0.91 (vulnerable), 0.99 (fixing the issue).

Lower version requirements to accept firmware 0.99.

Fixes: 8490f02a3ca4 ("drm/msm: a6xx: Make sure the SQE microcode is safe")
Cc: Akhil P Oommen <akhilpo@codeaurora.org>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cb2df8736ca8..896b47dc9c85 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -567,17 +567,17 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 	}  else {
 		/*
 		 * a650 tier targets don't need whereami but still need to be
-		 * equal to or newer than 1.95 for other security fixes
+		 * equal to or newer than 0.95 for other security fixes
 		 */
 		if (adreno_is_a650(adreno_gpu)) {
-			if ((buf[0] & 0xfff) >= 0x195) {
+			if ((buf[0] & 0xfff) >= 0x095) {
 				ret = true;
 				goto out;
 			}
 
 			DRM_DEV_ERROR(&gpu->pdev->dev,
 				"a650 SQE ucode is too old. Have version %x need at least %x\n",
-				buf[0] & 0xfff, 0x195);
+				buf[0] & 0xfff, 0x095);
 		}
 
 		/*
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
