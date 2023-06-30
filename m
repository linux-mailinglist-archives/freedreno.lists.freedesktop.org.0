Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 511AB744506
	for <lists+freedreno@lfdr.de>; Sat,  1 Jul 2023 01:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF5A10E1CA;
	Fri, 30 Jun 2023 23:12:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D715210E1CF
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 23:12:55 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so3910342e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 16:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688166774; x=1690758774;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tk7tcTZ9mb+wfLY/iSHZQg5Fo49rxNkkvriMan5x4EY=;
 b=gJIYWpjQGjk6Ok+6dezGhjo5v7Ut16pua5m5HKrlE85emWC48Xz4Ko3bbJKppUc/0C
 q0SYc3QyiIFBMtbdWVXeUZuMwbLeRnNo9iJh0UA7K3l3uQ3IYbjbAtAuHVeQVID/6vhJ
 Tptgk9JmVyYr/qTMBDWOoZtZ7MpSzG0lOgAC+MzvmOwBsc/LDA5zVw9K10peQnMg4WZo
 r3tv9j96jCjfEC4tabffa3HLXbc0+x/RYYkN4MAH5reRNu0O0RxSgHE/I3HrKwvYNI5/
 kLzCCaRf9KERj6Hyn23l/5/8fdLmOrCzFOnhcAf4c/NneOasRvWQ3C9v6qSbz3hL6lRf
 wZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688166774; x=1690758774;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tk7tcTZ9mb+wfLY/iSHZQg5Fo49rxNkkvriMan5x4EY=;
 b=aTN7Wu9JsngKSfN7funW/zai3BaOCJ1uQDtS3bWrUUEg0Tfaf00T1R8WKyZfq9lFhq
 OWjMBFZzlmvXdF0iXehMjjbHPrR+NJpEA1J7qkSHWZQLmAy5/GKGLpKENkaePFqA2RUb
 cDSV+Pp6tG1rf8aAYtOGYFR6cHCilvbrUixKYrLy9OzBgq2zFP5crPrz8k3johMob4VT
 p+FZu0TEmiqha7+E2Ipe6koUv43EkfMjIPv9Dx/9oWktHuFthWaQGkV8Jz3xpyc+izkZ
 YtfbbLb/kFAQqROO5eS6s4eilMa9ysz6yYI9AYeQxHG41ylzDTfIVsl3F2yIxp+MQYOO
 6ZjA==
X-Gm-Message-State: ABy/qLYsnAjGOHQMy5bAdUmSIKv97t4kQFAJ4L/2hYY70MqWazBU+Yl4
 EW5m5lilA4lC5julpg2ipyxfsg==
X-Google-Smtp-Source: APBJJlGOQPbPsy71Zzasb4tSYlvGnNC3rxke+QcuIHviwP4fP+a6VaJuxJz+B/ssCIrt7lEFXNhmzw==
X-Received: by 2002:a19:655c:0:b0:4f8:770f:1b0b with SMTP id
 c28-20020a19655c000000b004f8770f1b0bmr2951107lfj.33.1688166773682; 
 Fri, 30 Jun 2023 16:12:53 -0700 (PDT)
Received: from [192.168.1.101] (abxi253.neoplus.adsl.tpnet.pl. [83.9.2.253])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056512390600b004f1383d57ecsm3009499lfu.202.2023.06.30.16.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 16:12:53 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 01 Jul 2023 01:12:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a635-v2-1-5494c881b8be@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHJhn2QC/22Nyw6CMBBFf8XM2jFtkZcr/8OwaOsAk5CWTJFoC
 P9uZe3ynOTes0EiYUpwO20gtHLiGDKY8wn8aMNAyM/MYJQpVGUaXOLMHm1VlKhd4Y1vm/qqa8g
 DZxOhExv8mCfhNU1ZzkI9v4/Co8s8clqifI7gqn/27/eqUWOpyopU61XTu/vEwUq8RBmg2/f9C
 1kqkqK6AAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688166772; l=1261;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=oIevmiIoqBZEtyln22cHTlwhLGk4BKvbTI7KGaU8Yyc=;
 b=cKjj71LJhyQygBD7KLDoI76DTuLJ/0I8sUl0gry+/5Ze1m61sRakaDfaNwGegIBghEYrcCsVa
 aBNNJ9GGLn2ByljvvUFj5h7/KEa0LoFvaQzZTPVTEWKSlBC5av9OqZD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2] drm/msm/adreno: Assign revn to A635
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Recently, a WARN_ON() was introduced to ensure that revn is filled before
adreno_is_aXYZ is called. This however doesn't work very well when revn is
0 by design (such as for A635). Fill it in as a stopgap solution for
-fixes.

Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before being set")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- add fixes
- Link to v1: https://lore.kernel.org/r/20230628-topic-a635-v1-1-5056e09c08fb@linaro.org
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cb94cfd137a8..8ea7eae9fc52 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -345,6 +345,7 @@ static const struct adreno_info gpulist[] = {
 		.address_space_size = SZ_16G,
 	}, {
 		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
+		.revn = 635,
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a660_gmu.bin",

---
base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
change-id: 20230628-topic-a635-1b3c2c987417

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

