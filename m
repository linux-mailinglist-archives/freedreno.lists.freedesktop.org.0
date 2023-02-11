Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A4D692CB1
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 02:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9BE10E25D;
	Sat, 11 Feb 2023 01:59:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1398E10E25D
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 01:59:10 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id lu11so20206222ejb.3
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 17:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WsYj1dvpr8aqC1MHtJmuXbUcdvOjnso7J/f67jxofCo=;
 b=lXI/sFqen0oshgAA2YEH725UdyKaMCaZFY6j5dXA9HdJ8+Ek3+h8A/lGz0RlgUb6r2
 /CzbteHFyPs8xHI+wfz4ZkjNx0z2ZJW0F3Y3/63cIx3IFN5G3ea1PAlAtrbUG8qIlq5o
 xW5qTABRYlEquNfOtVfH/K825dJr75MLLZT6ImJssxfxEwOFprutnhjvPZoOtwvbIO5D
 mAeolfEO6pPuti99MXkWMNuNKj15gmxCEgoI7JPNU29f3ylK2kiSYw6Y5PRsDBo8Pmwu
 1ZAZCBt83iK6kjmDxw3z0JpqPssWaDxp0krc+vkNhG8PIOcTD3e/uzCuWeRiveZrPi1I
 tzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WsYj1dvpr8aqC1MHtJmuXbUcdvOjnso7J/f67jxofCo=;
 b=yM51BxWVQF1jkyUNa7Fyzil5uEyyM+e3OIlDZl6WmJrZuTl8O9R/DouY0FB/hY/CdT
 x3F2jpcBS0Y+ydXsQUB6gUDSk3AOkTZV++CK72OvSjE5xRim6JJYYZMhX+TwvAOkyAcM
 D5DKN9r4+NBgizCtlEYL2c8ZZlfFnGPPmDOssBMOrIc+C4s45nBmWTTTms7oUfiNb00W
 JnNv7cB2SVQHDWlLRQXSJTktvqiIOXviPdWR9Xm7JOEMg2SfeS3voQ/Yx4QoxSqwE8rW
 lE16UFiTRQw+EjQZ6Du2ilu0LTMBq14E6oLXtV/a42JVNQmf+XqzQhTMutnUwjsZGNgR
 jZ2Q==
X-Gm-Message-State: AO0yUKWcg5WpyYG46e1Uwgq+KTntvdTxKOoS/MTtm9IW89zLBMsZHUgI
 oSctOQquMI6orXlC0BPfyG0T5g==
X-Google-Smtp-Source: AK7set8lr2hecxNLdc0jB2qgDBb3EvRe0hdI1d1P8WmlFNoiqDDr5c3KP/VvgRK/pFJjHN01M6fq3Q==
X-Received: by 2002:a17:906:1250:b0:87b:da77:eec2 with SMTP id
 u16-20020a170906125000b0087bda77eec2mr18025808eja.19.1676080749346; 
 Fri, 10 Feb 2023 17:59:09 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 j9-20020aa7ca49000000b0045ce419ecffsm2987146edt.58.2023.02.10.17.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 17:59:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 11 Feb 2023 03:59:07 +0200
Message-Id: <20230211015907.1077839-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED
 for sc8280xp
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The SC8280XP also has a black hole at the top of MDP_TOP region. Set
corresponding bit to disable access to that region.

Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1: rebase on top of the msm-next

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 71df24a134ed..fb5120afb028 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -696,7 +696,7 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
-	.features = 0,
+	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.highest_bank_bit = 2,
 	.ubwc_swizzle = 6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
-- 
2.39.1

