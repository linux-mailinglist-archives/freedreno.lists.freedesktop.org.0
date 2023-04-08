Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5562A6DB7D4
	for <lists+freedreno@lfdr.de>; Sat,  8 Apr 2023 02:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A33910EE92;
	Sat,  8 Apr 2023 00:28:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31A110EE97
 for <freedreno@lists.freedesktop.org>; Sat,  8 Apr 2023 00:27:55 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id y15so56209116lfa.7
 for <freedreno@lists.freedesktop.org>; Fri, 07 Apr 2023 17:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680913674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0F6te40Cb/Ad/ox5RO4Z2KRQpaY2oFJdM/k3yKFfV94=;
 b=IzrnaasFKXy0N3jlJFdW8Z5eDspSyDGhW/GDGKvqO+BuMzlL7dLghr5KKDV69Y4AGM
 uKlH3/gsn9YMNj/KsReVKH83vrxHqCVbwcS82WxSERQM/36thUeANcKw1jm7Y9CgizNR
 qhkARizC4sEIA1xG6sUwCoOZh2pVKC283CDCLhu/ZxrfwB/lb5yBirZQm1R4J8pvYzad
 l89hiNAUZ4z36wXT6298HZ8s5PZ2KRZVD3AsToOCpirQyveNl2eJDLjOW2mgwqu6L/w9
 WCl/pCg499g0OHZWklMXevavt14ypdYp7aYSBDV5P2JDR4qhRbQ8KwMWlse2gCKFSs9O
 XwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680913674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0F6te40Cb/Ad/ox5RO4Z2KRQpaY2oFJdM/k3yKFfV94=;
 b=7B+rlIV8ZZV/ydruXY7jzockoX86XwyzSUW+xT8EBpKjKEYLz94grXwDtSPh/eJGbY
 tKyxqCVM10lUq/HRGMdeQZ9E9b8/q3SEZEpthkOmsXCWJcqWT9+B8Bc+0+Wg1w9QO8ZA
 XUz/Fa6o9SPPU4Pxj+GQXXxqNwfbkJIHwsqy30KWI2bc6CTNG/ehExR6mcfrQAUSEnMO
 C2sJoq9x8G3wMo+Hy/p9aA1iJdG0jIoG+dqF8PcQZg4iwGl4ckSbAg/XAC3HCgfXP3aX
 +clygZF69IB5vWF/BJwpgfMfWRCuHW4qtt3+DjgZdY9Jz88vV5y2QlkwRJ3OjzqkTXL7
 DkFg==
X-Gm-Message-State: AAQBX9db7RR60VOVX3wVodm0nw41CDFk49zH/WcQStkVKwOMNHP/efVh
 t1+7IwYaNjAetx+iTm0sQGw3EQ==
X-Google-Smtp-Source: AKy350b2wbXFMZJQfSlITNPYmwClKMG1rCnTeltJYoSbVsAPPdHkBGanUTqCiBOKl1fohmdDlgZRgA==
X-Received: by 2002:ac2:44c8:0:b0:4ea:c730:aabe with SMTP id
 d8-20020ac244c8000000b004eac730aabemr1157484lfm.20.1680913673898; 
 Fri, 07 Apr 2023 17:27:53 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 q15-20020a19a40f000000b004db3e2d3efesm915759lfc.204.2023.04.07.17.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 17:27:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat,  8 Apr 2023 03:27:50 +0300
Message-Id: <20230408002750.2722304-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
References: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 4/4] drm/msm/dpu: use CTL_SC7280_MASK for
 sm8450's ctl_0
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

On sm8450 platform the CTL_0 doesn't differ from the rest of CTL blocks,
so switch it to CTL_SC7280_MASK too.

Some background: original commit 100d7ef6995d ("drm/msm/dpu: add support
for SM8450") had all (relevant at that time) bit spelled individually.
Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
despite being a mismerge, correctly changed all other CTL entries to use
CTL_SC7280_MASK, except CTL_0.

While the current BLOCK_SOC_MASK style is not ideal (and while we are
working on a better scheme), let's follow its usage as a least minimal
surprise. For example, sc8280xp, a close associate of sm8450, also uses
CTL_SC7280_MASK.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index e111ca1f4bf5..221358b9892e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -47,7 +47,7 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-- 
2.39.2

