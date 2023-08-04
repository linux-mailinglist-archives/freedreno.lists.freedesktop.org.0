Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 333E376FDC7
	for <lists+freedreno@lfdr.de>; Fri,  4 Aug 2023 11:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F5C10E143;
	Fri,  4 Aug 2023 09:48:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E2B10E143
 for <freedreno@lists.freedesktop.org>; Fri,  4 Aug 2023 09:48:07 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b962535808so28918861fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 04 Aug 2023 02:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691142486; x=1691747286;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ia7ixFWhmmaN0o7SC42Vjj/tmV60762EI0Hz3GNAHW8=;
 b=hNE792IZkYahHM15H25k7VCHg9L338Ls2XiVE1JZvlbICnqcAMQzIIoIu/pxeqqvGH
 NC1LLLpw8HIdYhoyIIoP9M3cDsaNfm60mFQ2ELWcdiUxP4H3HrFSVj/jX6t81AxyS88X
 uOrn3rQPaK5fnDoGuvl+iub52NEj6drd59MR+Fxljs17Yk0SKnG8iued9fJs+08YZy+j
 j2th4ttvgSU8umJ4L3QUFiaPkFhpusn6jyry5QNpnGZdXIj8m7wp5XcFarFgcxouJbcl
 22XHe9uaZxwJfO8z3Lfee/DCP6zkGj7h0JKN9Qfp0StFSLiAasObwhQvUdtDdoo/IA46
 FX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691142486; x=1691747286;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ia7ixFWhmmaN0o7SC42Vjj/tmV60762EI0Hz3GNAHW8=;
 b=MvRdCPYw0zQN8TZDp1QUH9rXvso13hUHxRa+PidkEZLHkvRfYaAH7KM2CaE2ZSi38J
 owNqnT1DjaVZ2vs/g+46lXjyKIFjRZ3vC21Ea2WyXRfds1hWTXpv0OL36iY4WuaT93fA
 E9uZ31vgEqTz6kwuRFGTrzleadn7A9nUpast+yI+Ed+FG4CqWCHas9rhUVhQnPC+9HSw
 YZsOULJomZ8Hv+4KKgwn7VQ+uwmBeKFXPMbhraCrYbzGJ6iMClTuB6+391JnkcyC9qG1
 2C58L+2ClTCqoomvJ0F6qGEmzHwo4pIisvNL/z6P+QNiy6haYF7uuFp7OBeVAVAYCppQ
 5D5Q==
X-Gm-Message-State: AOJu0YwHkAQV4qRlsm1AQU5O9rB9rFBQRe0gd9gP012ySwWK14QsYmHg
 Lq6MANx6H+Qul2vy0AmfEfZUqw==
X-Google-Smtp-Source: AGHT+IFFYyMhY/dwT3vckRQ4+nd0tP7F/nqRCzwAkUASSgIB7U7IV8MP40hPgycRnIa+74Q4HnzxzQ==
X-Received: by 2002:a2e:b0c6:0:b0:2b9:ea6b:64b with SMTP id
 g6-20020a2eb0c6000000b002b9ea6b064bmr1092055ljl.37.1691142485789; 
 Fri, 04 Aug 2023 02:48:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a2e3203000000b002b9de06f119sm364670ljy.67.2023.08.04.02.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 02:48:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  4 Aug 2023 12:48:04 +0300
Message-Id: <20230804094804.36053-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: initialise clk_rate to 0 in
 _dpu_core_perf_get_core_clk_rate
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
 David Airlie <airlied@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

When removing the core perf tune overrides, I also occasionaly removed the
initialisation of the clk_rate variable. Initialise it to 0 to let max()
correctly calculate the maximum of requested clock rates.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: 6a4bc73915af ("drm/msm/dpu: drop separate dpu_core_perf_tune overrides")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 0b54a659a940..e843e5f3b3dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -289,6 +289,7 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
 		return kms->perf.max_core_clk_rate;
 
+	clk_rate = 0;
 	drm_for_each_crtc(crtc, kms->dev) {
 		if (crtc->enabled) {
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
-- 
2.39.2

