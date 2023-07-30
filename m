Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04705768314
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 03:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0C110E250;
	Sun, 30 Jul 2023 01:01:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EE810E130
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 01:01:11 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so49729221fa.2
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 18:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690678869; x=1691283669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2DuTgbIVG01rucluqHZXMfn6fgJVuPWJQYKqeE48JKY=;
 b=ZR0F/XS+oewEfkAI4LqftoLhW++P/PgzoXtpm6aGosSuji1UEASpBXuQBvGUmoynKP
 05fG7BAsc8aubjjQEIzC/9PUK+bscvjlWJf77fcZVDVI5KdqJGT897InCtrV4EKVB0IB
 zuLs7sWlyqXI7/8kZakBGkMfCVHdhP/SXWWJG6iA3GnAYet66jFj9gBn1pEugFysjc+M
 Y9M74W1JbpC+A39P8X3+p5iqABZRXy3vZWXQiOfVZ4a/zg+ux6g8+KPeubrLFKVJUfL7
 y2EQUStj9EBccD27l9YWUqM4gx8gEel6IQV8COwmsHNClKMhgpYGpGl1n6IBGPveOmVl
 rnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690678869; x=1691283669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2DuTgbIVG01rucluqHZXMfn6fgJVuPWJQYKqeE48JKY=;
 b=EqSQGIN03cPSCJ2h7cwsTyqWXTTMdGwBKxGc+74lOvRLAuYBuIRNRg2/GLSlFhkZAD
 Vs0AcNOiqctq6ZlE4Yeps5xE5gbofIqu6qNQiQvMvTe+rQ4Fc7i9Xb48EC2LRpFyLTO0
 Z3owkgfnGtYbnmiDf2Jr3XRpWQQ8ctt94siCty9AvOKeZzxn2pXn6NiVIiRpQloqrzN5
 s7WoqBAuFtVwbsXTcPTbn2oGui/z96i32Y+mXrIX507yUKvqVH/6VuqaDIbiCKfpVPc0
 mH5xab39x/Omuny1vl0kqN/Lk/35LpPThdCb2MDcdIqzAov2M8ewIhqmsshJuWWay6Ko
 EUXQ==
X-Gm-Message-State: ABy/qLbIvsTlL0AcH1CtPy1nQrK3d6/bwmx82BwfJFg/sXHv3TQLdBqp
 vQEr4Qv2tXEr0UMlzFZYcyqbyw==
X-Google-Smtp-Source: APBJJlGapWuQ8lAK9Ja32K/3KnziQMJWOT3VV9UhtWijMGLRaEjETlLaL9qrJfW0M/PDWKkekK+Pxw==
X-Received: by 2002:a2e:8003:0:b0:2b6:c236:b040 with SMTP id
 j3-20020a2e8003000000b002b6c236b040mr4820159ljg.12.1690678869779; 
 Sat, 29 Jul 2023 18:01:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:01:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Jul 2023 04:01:00 +0300
Message-Id: <20230730010102.350713-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 08/10] drm/msm/dpu: remove extra
 clk_round_rate() call
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

The dev_pm_opp_set_rate() already contains a call for clk_round_rate for
the passed value. Stop calling it manually from
_dpu_core_perf_get_core_clk_rate(). It is slightly incorrect to call it
this way, as we should round the final calculated clock rate rather than
rounding all the intermediate values.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 3dddec868bf5..6a0f0ede4781 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -294,8 +294,6 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
 			clk_rate = max(dpu_cstate->new_perf.core_clk_rate,
 							clk_rate);
-			clk_rate = clk_round_rate(kms->perf.core_clk,
-					clk_rate);
 		}
 	}
 
-- 
2.39.2

