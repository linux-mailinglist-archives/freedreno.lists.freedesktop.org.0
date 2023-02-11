Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 074A6692D20
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 03:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406F110EE79;
	Sat, 11 Feb 2023 02:11:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A5F10EE63
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:20 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id hx15so20148334ejc.11
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PiwbM5jVpZ/ScUiqOgdJmFOTHUE0umLQvB8ZcggfPGo=;
 b=UvKldGRp2CcamB4vzqSNr7sTW5JhdhVqfP9T5peJuhY48brILNsWEbloqMyysFkWRV
 wuliOdKKlLlQen4WUNtDA+GcsllLfBnEpBgF3eyMwQDe6X0fcyK5QTIIgl7BW1dsoDZV
 eoeuOVEx7DeDss9AuIips2K5iq7s3Oqn03lv8ua8DMataMbcDHMjzCStWAzjHpoL5Nxm
 Tic//MskCZwFLLdrVtgQ0RF1YqJdNQeOwiB9xEzufzggHA+VaPZGjuFgOyuMZ8RMaHlP
 YOuzNJbtwrx9E1kpM30vk2fM6BKdQ8RjJWmMUv+jg8UB+CltYhiKEkL+/yy/Ggs5qM2Y
 dmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PiwbM5jVpZ/ScUiqOgdJmFOTHUE0umLQvB8ZcggfPGo=;
 b=Q7DMbxN4aZAskTVeduHid87Mi2TqQ0PqTUxPMYSuY+0Iblp/bubt54TClWM3NDl+hN
 XgaUQOgoTkNzcteo4pwWOlDnJBK30bDSnSeg4SNqr5Eys12QnhImVmqAZM2j+dU0Qcou
 NxZwG7F7tNutnr2LMWjGBJReA1SdsgpWHkA/qrm07pLZOyJSAXi2BQE17wcao2VjEgQp
 2H2vkI5yp1iX7X1Hj8JOsPrOZDVPyhVABnPiC+cJMNy7GdS06oaRm2jRlDTotaU83F5c
 IEtn9oqu2gXlSDTzeG2TGDSMLKlOIqumFLLrmy7PFD9LKLRBMuEis0NfZgLPMhMDJ3d0
 Kidg==
X-Gm-Message-State: AO0yUKWs/xAhfqwu7KCaNrn/Lm39pyUE55vkg1MfWXk7GzUy+1Fe5lcI
 4T7iNippOyJRVf7euZRzAAg06g==
X-Google-Smtp-Source: AK7set/baO+bEqGhAd4fSPtG1MetVoNQrqnKWIqhm4eMqmlHupto06Cfx3rz0a6AUsADTq28uLMk8Q==
X-Received: by 2002:a17:907:7f8d:b0:8aa:c2e1:6a64 with SMTP id
 qk13-20020a1709077f8d00b008aac2e16a64mr18548744ejc.61.1676081480442; 
 Fri, 10 Feb 2023 18:11:20 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 11 Feb 2023 04:10:34 +0200
Message-Id: <20230211021053.1078648-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 24/43] drm/msm/dpu: enable DSPP_2/3 for LM_2/3
 on sm8450
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

Mark DSPP_2 and DSPP_3 as used for LM_2 and LM_3

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index dcf47ff877db..432f47d1e33c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -107,9 +107,9 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
 	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
 	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-- 
2.39.1

