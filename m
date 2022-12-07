Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4A3645C8F
	for <lists+freedreno@lfdr.de>; Wed,  7 Dec 2022 15:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D211710E3C3;
	Wed,  7 Dec 2022 14:28:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0692910E3BD
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 14:28:38 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id x28so11630782lfn.6
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 06:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPYBQvv5acXmkzTDemHHFrRFZ9k6j4P1yxR7/lFHMcQ=;
 b=D/qyDVjvU17bztJd0zm90q3gMl4DPswv//AtyuMVvQBgRPMSunIFRJwtnCYSvTxSbI
 MGFXEoUZiYY1ES4ajXdt28/9loge3kI10tG1/aUMZ30cHmc7e/MlJlkxVaEcz5pJszGr
 CjzmjumcgQzP6AM+tCcsUFWmZXCAGWU/KtTd7No1FCa19c6HqGJRBhT8Nkk4rJexRcCo
 JhAupe/Uu9tNEuK2Ewh04ytfQAYPF4J/vIdqqAuWcgti8vcGZSKFw1kQkPF80KQKG/la
 /xAld0tU5WuCCCir9TdsAXyQUXaOtYDqT+rFZpgCzuFXBq0JItmm1CzhbI535WLEAykH
 PXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPYBQvv5acXmkzTDemHHFrRFZ9k6j4P1yxR7/lFHMcQ=;
 b=guKGYGcD53fGkYn/t0ktegAkPI5hGza5LLVd/Y/8OVlpCIojDCoyp+6E/hr7EY2c7m
 7QdlPf7kiXOKBcmdr+wko6FjMgpTgMKfptU5lxNPfhpleveu7HyY19OYP+mx89RkksAl
 e2ywRovg7W8WUclIP+x0uoBU1BWRhSdYrfL2LNRQaXWxtLDcgQldDjjSbDsxgTgG40qM
 KojeZ0ZwONI1h6Ftvhr7NHJAqXveHptCoqZD11R3QpkMIKqG+i6tn2AzpFP1nOh6Daks
 Yn2PqfUIALRJRVXKb4FOwNOovIFxoj1DZO1pvuHiVAIk0/Z+sp/xXkWXYIapheOoS3Nx
 z+DQ==
X-Gm-Message-State: ANoB5pmC5JRstV1xz/IZhTOYhWQjWdVcaIYK6JtKs6XukYknrjsBRewI
 9ptOW2oH5TyvJXtZQsAQYmltMw==
X-Google-Smtp-Source: AA0mqf5YPSZBfNwGLherIDiREftMg4LO0li/pk8Z+mpZuynbABROKC2jGDp0tC2GZIcIXszTAJKTnA==
X-Received: by 2002:a05:6512:281b:b0:4b3:e086:87d8 with SMTP id
 cf27-20020a056512281b00b004b3e08687d8mr22907479lfb.259.1670423316347; 
 Wed, 07 Dec 2022 06:28:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f27-20020a19381b000000b0049fff3f645esm2863430lfa.70.2022.12.07.06.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 06:28:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  7 Dec 2022 16:28:31 +0200
Message-Id: <20221207142833.204193-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/3] drm/msm/dpu: handle UBWC 1.0 in
 dpu_hw_sspp_setup_format
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

Extend dpu_hw_sspp_setup_format() to also handle the UBWC 1.0 case.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 691c471b08c2..4246ab0b3bee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -310,7 +310,11 @@ static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
 			ctx->mdp->highest_bank_bit << 18);
 		switch (ctx->catalog->caps->ubwc_version) {
 		case DPU_HW_UBWC_VER_10:
-			/* TODO: UBWC v1 case */
+			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
+			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+					fast_clear | (ctx->mdp->ubwc_swizzle & 0x1) |
+					BIT(8) |
+					(ctx->mdp->highest_bank_bit << 4));
 			break;
 		case DPU_HW_UBWC_VER_20:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-- 
2.35.1

