Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD6969566E
	for <lists+freedreno@lfdr.de>; Tue, 14 Feb 2023 03:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D72A10E7D0;
	Tue, 14 Feb 2023 02:10:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A6610E7C6
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 02:10:01 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id d8so16827353ljq.9
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 18:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dg5npVEtTASzGcr4eJ+wVqqeUH6/+1vX9dbbBaUyogk=;
 b=BbmlxycFhE3h4MvUvNFd8zT591n4v4/EU0aisVF4e+55hZYOB42kTG74R4pGlLPki6
 NYAYux1rPnTKkb4Q6t+toPisCVWOz1k9DmQRcYWQFtgmE3YOc40c/9+tVzzzS/E1csx4
 SDu9M1hAIPwMUyJAsH/1/W++hwVDJV5AyE+Wjskp7LyB4+kkApKykU9Hr3+O7OsNA9DB
 mSYJv8XCnKnrfPRKSKJqDCoEFRcaTRH3Ym6DFOPHsjP+7TQtA3q8cywJGAuxvBPJPNAR
 MvPtireHDvJ0VUiY/ds8OE+28adRU0feMoHH9kgm9mHF3ksXU/Unu934Ju+Z+YWA9ECn
 nTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dg5npVEtTASzGcr4eJ+wVqqeUH6/+1vX9dbbBaUyogk=;
 b=Dtt/lr3JQlrwtXHejDk0QvpRH4yZUpkXp38cYYH9kJ0fAtu9tlBwZO0arL36aMFrXA
 WtovHNprUdx+8hyQO65lvagjfrFYEi2UB1soP6T4ibImEutak/TWnigQEsFB+9raf1RW
 StizQ9toJihjtaWIsbvdp13ji21FuoXuqIaJxXkxB9IEpCfc6EdxVnx3HVTVRmxAxhmo
 ov2JcN2Jk5juw52/88rom72mXFanlhjAMJGgcIkcEQoSxQSY2Ec5kehUNgrtsi7K4oFi
 zigvequ+Qa0cf7ojc3acEe7bpf/vm2EL3XtE/Q27J4tDNCcY+t0KRfkcNGBmD16T/b59
 RzRA==
X-Gm-Message-State: AO0yUKWKMLrFWualfiDZVadYgVtmYchBjEMLhI0kx1dkas4V3AMPs1V1
 daFO0KwnD6Ylt1EdheOPIl/PBA==
X-Google-Smtp-Source: AK7set8FVMLGIVOfdD5mO52wDbfe3E+g/JNRA9zhUYix0s/deyvUjeuPyCPbl3Ydzfzfsfdn7EdEzw==
X-Received: by 2002:a2e:9106:0:b0:293:528c:c6c8 with SMTP id
 m6-20020a2e9106000000b00293528cc6c8mr260477ljg.33.1676340600300; 
 Mon, 13 Feb 2023 18:10:00 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a2eb711000000b0029066c8906dsm2239518ljo.23.2023.02.13.18.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 18:09:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 14 Feb 2023 05:09:54 +0300
Message-Id: <20230214020956.164473-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
References: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/4] drm/msm/a5xx: fix highest bank bit for a530
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
Cc: freedreno@lists.freedesktop.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Jami Kettunen <jami.kettunen@protonmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

A530 has highest bank bit equal to 15 (like A540). Fix values written to
REG_A5XX_RB_MODE_CNTL and REG_A5XX_TPL1_MODE_CNTL registers.

Fixes: 1d832ab30ce6 ("drm/msm/a5xx: Add support for Adreno 508, 509, 512 GPUs")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 8b2df12d8681..047c5e8c87ff 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -806,7 +806,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
 
 	/* Set the highest bank bit */
-	if (adreno_is_a540(adreno_gpu))
+	if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
 		regbit = 2;
 	else
 		regbit = 1;
-- 
2.30.2

