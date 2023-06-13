Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7859C72D55B
	for <lists+freedreno@lfdr.de>; Tue, 13 Jun 2023 02:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D27F10E2DF;
	Tue, 13 Jun 2023 00:10:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0348510E2DA
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jun 2023 00:10:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f63006b4e3so5954496e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jun 2023 17:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686615008; x=1689207008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27BaSyAqy1Cnxu5e2T0eLInr8w11mQnmD00hWGVy5XY=;
 b=QAOCVKUtTOD4feIPdq1byQnfc75zs3PvnpzacyB+wvcoK5WaV+wKM1IvULTpepOo0W
 rgA6eRMyWnjNRTXQgz38ir7q3RhXv2J7M1T7KmBB9erbKtd0rM0a1qiaBZth0gXbHpQT
 IEjuoFPQIy27eP+5hATz8/ozZk21hI7vlGhmAMbeOyC/YA7rxjsmqzkMm+bDelfamkJ7
 v+a1oX1OofH7lqG6ngx2VmiVuSgi6l5UF58vOAiwPErkUoNzSPJLm1goov6FdGZQFikW
 XEaqPezRjapGYqAptpIk8ZevFkgGwYNFir2PMDKtJCu4GcDsrXrDCeqiUngrKJtdGZbN
 RIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686615008; x=1689207008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=27BaSyAqy1Cnxu5e2T0eLInr8w11mQnmD00hWGVy5XY=;
 b=dKvst9jPn10H/Au8YCaAhnJYrFZVtANnX73Zvq/OtJ/Tow4sEylJCR8DDXX/YjzGQp
 KriH1GUcZYmsbquBV4/2azHXpOShlDCSi0icGQlHXIeSK2i7kS9NGXtiPCxpv4aakdrR
 /dLgBhvx28m5w889ixWxJWwkF1kgFyfw+crXhYONw9pyTK76MOQTBWrmxf3rD6+kxouy
 EmYgiakxtc0w80mgEzsx8n7gR1vy3cAkhVnuWEKOp7M35EUEgiULuDpjnQ6WU6cLb2YY
 d0MZn0e5VU7Y2104dvMltovOGCHF+1xKfHDIeyRc3zWVNI/WcNvDTpoG2FCbi0OaefbU
 SW2A==
X-Gm-Message-State: AC+VfDyyNV8xSsnAesV6GB+J4kp6hKH+/RfeT0e9xS79oj1QeGEYcJeP
 YCCII5c1hhakAPToBk8tjqoLQg==
X-Google-Smtp-Source: ACHHUZ68C4jaT5uSfPxIfARr159iicx5JmxaUtYJQldxoc1pXFDid47hcJFg8a1KHF+ndtv62R5wQg==
X-Received: by 2002:a05:6512:28a:b0:4f4:db63:23a0 with SMTP id
 j10-20020a056512028a00b004f4db6323a0mr4964184lfp.33.1686615007749; 
 Mon, 12 Jun 2023 17:10:07 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 17:10:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue, 13 Jun 2023 03:09:41 +0300
Message-Id: <20230613001004.3426676-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 02/22] drm/msm/dpu: correct MERGE_3D length
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Each MERGE_3D block has just two registers. Correct the block length
accordingly.

Fixes: 4369c93cf36b ("drm/msm/dpu: initial support for merge3D hardware block")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 36ba3f58dcdf..0de507d4d7b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -508,7 +508,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 #define MERGE_3D_BLK(_name, _id, _base) \
 	{\
 	.name = _name, .id = _id, \
-	.base = _base, .len = 0x100, \
+	.base = _base, .len = 0x8, \
 	.features = MERGE_3D_SM8150_MASK, \
 	.sblk = NULL \
 	}
-- 
2.39.2

