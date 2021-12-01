Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFC146592C
	for <lists+freedreno@lfdr.de>; Wed,  1 Dec 2021 23:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AC06E89D;
	Wed,  1 Dec 2021 22:26:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B066E5A1
 for <freedreno@lists.freedesktop.org>; Wed,  1 Dec 2021 22:26:40 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id z8so51100546ljz.9
 for <freedreno@lists.freedesktop.org>; Wed, 01 Dec 2021 14:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fWCoIosLOkr8+Xp5Tky7xqwPwu8pC3ri4jt2sulhCRE=;
 b=Xb2SvLb1ZZ9tHGymd8d9tmuvelPOGxTOoUuK6Q+FG9Z7F/abPDzE7TWHp5oaeghX1o
 4An2eEl8JdsG302stGkaHUsC3nGi2P63gWMK0mpa9/nHbZcm4HAlW9xNEzAxzqurhFW2
 wzRu8qBkPI0gInFNlPjNACnxkzc00sxQqGzQvDu9rt50yzoqeKmdaffo7vzjqxEkLAaG
 mMQ/LqlRPSlq2vFUF+EeSgwh6FkbCcptBR8jHmOd5Vz1+kPQ1aDnM/NkpN8KWoJOolxP
 sR+kXa31AlkkzO29iSFuo7gkIhOE/+nBlJ4zJoENqYuJDY42NuJqTUjUhOYUZ5C4Ausf
 fijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fWCoIosLOkr8+Xp5Tky7xqwPwu8pC3ri4jt2sulhCRE=;
 b=tnbzk2XJ/sETEsxAYsazficb1lxcGMhMNsPpRhCRJwWrrXN9XWZmCxglbzagvBLxq2
 1uQ/Q/kf/vKLgmUXtQgbY/xEQY8MNXiA913+wZd0puSkSC5NREUjGrVcABPUIAqw511H
 kD/jm5J1v0A9A3BkLqjocp4dx/T3RkrUG6nTjXil9TmwpH60RUf4Tpg+5+zWUwN9wX2m
 XMnF94YsozEwJMfbHlioHvduUV5cmnfOU/Y0itM6tBZoqFjoD21ooxnlAEK9WbbyH8fX
 EETpHxq8hYeDfSlbs7xwLVxsODz2zUewzY1vnRLRWQTGg2nmzHmi/1m+QQAfMrvcfgjm
 uowg==
X-Gm-Message-State: AOAM532PqNj/oS8jZXtzyuM/mkEfb31+yPiwcXPQbD7BvyEWm1sDug95
 GFrH9DBNXyYUJslXBlwDfQZRjxS30DzgSw==
X-Google-Smtp-Source: ABdhPJxtqnDME8ugi6RNS2CRr24FIhayY929Ybdkjjg0tuAthvNZRunt6g/P/cX8aCOWaRL5rkDyVQ==
X-Received: by 2002:a2e:9dc8:: with SMTP id x8mr8170843ljj.502.1638397598784; 
 Wed, 01 Dec 2021 14:26:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:26:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu,  2 Dec 2021 01:26:28 +0300
Message-Id: <20211201222633.2476780-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 3/8] drm/msm/dpu: make
 danger_status/safe_status readable
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
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Change \t to \n in the print format to stop putting all SSPP status in a
single line. Splitting it to one SSPP per line is much more readable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e7f0cded2c6b..4c04982c71b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -82,7 +82,7 @@ static int _dpu_danger_signal_status(struct seq_file *s,
 	seq_printf(s, "MDP     :  0x%x\n", status.mdp);
 
 	for (i = SSPP_VIG0; i < SSPP_MAX; i++)
-		seq_printf(s, "SSPP%d   :  0x%x  \t", i - SSPP_VIG0,
+		seq_printf(s, "SSPP%d   :  0x%x  \n", i - SSPP_VIG0,
 				status.sspp[i]);
 	seq_puts(s, "\n");
 
-- 
2.33.0

