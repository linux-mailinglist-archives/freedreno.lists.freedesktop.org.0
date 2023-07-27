Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C8E765509
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 15:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B43A10E587;
	Thu, 27 Jul 2023 13:31:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E744810E123
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 13:31:57 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fe0c566788so1757508e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690464716; x=1691069516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozXv1DbyX/9IhURbF1Fhd2b0LEweNNt8AgMpeAaCDSs=;
 b=zb2W3eK/b/MZqCt7dAi/hm5nFrtkgtJjWYhU6x+w9Xxx1XLN4gcWTja2i78xHtff0j
 50KrEssFUgnrWqJlZl/qMwA81/4idRnbxvMUV7AdjfIB8e0Gj2stYz5t1KClNeyyicNy
 d2+qxAlqNenTOok//5/760EMY49VIRAeY7+PTa7roVIYMNbqGwhxZ7+WZo3tBbRt16Up
 6WrW0ntZoyxcx0q+lt/0fx0wu1T1I4RCbRkccFhLGP13FX/N9Y+BctFuN2BuG2l9yA+e
 oEUbZPsnpDXHJoEBqIzSDWHy1jCWeUM67t0GErsjDW4qCsuxT+paBhvJTOjBYDtfR0m7
 VgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690464716; x=1691069516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozXv1DbyX/9IhURbF1Fhd2b0LEweNNt8AgMpeAaCDSs=;
 b=X+YQx3WpZWvQ3wGbhd3XVRIJK6y5yPYGFDxUrMiwZnL01hdqQan+8R2vhtSWzmw3hG
 OYGjaukgU45XN4digRtoM4uqAdlw6vQ9+yU5uqKsyhgSndgVsJUUbhbUnfFaVfug78fW
 BWRPgYfwkBOcLRIgkMqCUMjsysVqV2/X7i1U87EaPbNZrxn56iB9VBN+0EOxVJ/6acGA
 DX7B7ZEn03LEOJze33IeUhkGy++PdL27d6+2OZZ2XbsikOEuPFjAEVX0sCUlbxg4Nd2N
 /j+yllxLLYuBPfuqT4rqv4VLJv3kKnYlyGFFSh5GB+cQzHuThDbGLjZHYBzYh0qW1bD4
 FSsg==
X-Gm-Message-State: ABy/qLZN1ZEyXI3m3JCD7cQDlGKeeY1322EvymMNutHTai+a9ph4fzx+
 +fjf6wjHIvWL2iu5YHQeX3vsjQ==
X-Google-Smtp-Source: APBJJlF831cH8Viq1+Mko5h4Kwp7fkZvwJT0KjKfc+8mmrWwUZZGZoWb2CRXvfYX6a7ClB6hJqD8hw==
X-Received: by 2002:ac2:4893:0:b0:4fb:c885:425 with SMTP id
 x19-20020ac24893000000b004fbc8850425mr1700078lfc.9.1690464715891; 
 Thu, 27 Jul 2023 06:31:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05651204c900b004f85628ec34sm313511lfq.33.2023.07.27.06.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 06:31:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 27 Jul 2023 16:31:50 +0300
Message-Id: <20230727133154.1421721-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727133154.1421721-1-dmitry.baryshkov@linaro.org>
References: <20230727133154.1421721-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/5] drm/msm/dpu: inline __intr_offset
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

Inline __intr_offset(), there is no point in having a separate oneline
function for setting base block address.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5e2d68ebb113..0776b0f6df4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -435,12 +435,6 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 	return intr_status;
 }
 
-static void __intr_offset(const struct dpu_mdss_cfg *m,
-		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
-{
-	hw->blk_addr = addr + m->mdp[0].base;
-}
-
 struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
 {
@@ -454,7 +448,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
-	__intr_offset(m, addr, &intr->hw);
+	intr->hw.blk_addr = addr + m->mdp[0].base;
 
 	intr->total_irqs = nirq;
 
-- 
2.39.2

