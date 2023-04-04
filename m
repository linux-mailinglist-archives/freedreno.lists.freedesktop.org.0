Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF126D621D
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 15:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2765110E69F;
	Tue,  4 Apr 2023 13:09:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4C110E69F
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:12 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id q14so33757746ljm.11
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R7yPbS03d0KFCJ5oWBrsyaZqeOyc8khrgg5i4VNLqRE=;
 b=XxiPduBzohb3r/9wHf90hJeaptrLAgaB4EjiFF4gsSieKu7BOTUgWsg9LwCSasP1E9
 09uuS+A+gEDQBtqc6+oJj0YHQ7dKSODFdRGo+6OaCziBdeJSS+aFRXkuMkcwaa+hpMak
 /GA1qD3zyup69ezKEMmJViyURz2npTC604nGADA0ZcpdIkzTrym1Qu1zMyfZDyjzltQY
 EBsvFynOswuMmihx+QQEqSdJ5rRptz9Y4EJClJzyVHRCp3RiIBtV3aXN6tEDkrXqknhc
 6sMZ8zPQsKxoAfnpSQPOlvO0NW1JWU6cMkQ6gtFAQ2yL4UR8Ku7QfU3pB3VtGO3uDDeq
 nVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R7yPbS03d0KFCJ5oWBrsyaZqeOyc8khrgg5i4VNLqRE=;
 b=ooaPwBV8ezwTiGpy/I57YWOWJWm7hoA++Jet+JzmLCk+eQG8pdoMHGTkmuFD9s9NvU
 klW24ooJlb+I3Gr4u+s/23vsc7WCNuz/OG6Pzj7EeULLNqFXo4fKfFMO+tXdPuVzGAsa
 7llVd7m+xthFsUkgDNxeUDH+vu5KnLQ7663BH4urAyIdF7pzgyBpGJunA5n8GcuuJlk1
 Q7D10AW3O6w1Unc2R1AJFoUerYsuLSL8GUR13EtbgtmT9a8wbCtFgVr4LipykZG6RP0+
 flOzk4zyKuoEDblltlmNNNz7fTuF40zRBJER+toBmW3IpR0gTuMhzz66ZlsRriEWs1o1
 /cng==
X-Gm-Message-State: AAQBX9e1Clmka5oTNehBTiJyzT5OHvkQ+rZPeMVxf4WiNKy8XQMSmWyx
 DODWMoH1AtqD3qC0OjNBnM8fVQ==
X-Google-Smtp-Source: AKy350aSjCdvEjeEgqQNJy4WvySRR8ezOE1v33NYDUxv7BJcg6T7y2cy+6x4SdRM7CMwuGy8FwWMvA==
X-Received: by 2002:a2e:9a82:0:b0:2a2:41cc:fb1 with SMTP id
 p2-20020a2e9a82000000b002a241cc0fb1mr681131lji.12.1680613752191; 
 Tue, 04 Apr 2023 06:09:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  4 Apr 2023 16:06:03 +0300
Message-Id: <20230404130622.509628-24-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 23/42] drm/msm/dpu: duplicate sm8250 catalog
 entries
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Duplicate some of sm8250 catalog entries to remove dependencies between
DPU major generations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 295e2370b3f2..787d67a28490 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -80,6 +80,25 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	},
 };
 
+static const struct dpu_sspp_cfg sm8350_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
+		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK,
+		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK,
+		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK,
+		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
+};
+
 static const struct dpu_lm_cfg sm8350_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
@@ -177,8 +196,8 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.mdp = sm8350_mdp,
 	.ctl_count = ARRAY_SIZE(sm8350_ctl),
 	.ctl = sm8350_ctl,
-	.sspp_count = ARRAY_SIZE(sm8250_sspp),
-	.sspp = sm8250_sspp,
+	.sspp_count = ARRAY_SIZE(sm8350_sspp),
+	.sspp = sm8350_sspp,
 	.mixer_count = ARRAY_SIZE(sm8350_lm),
 	.mixer = sm8350_lm,
 	.dspp_count = ARRAY_SIZE(sm8350_dspp),
-- 
2.39.2

