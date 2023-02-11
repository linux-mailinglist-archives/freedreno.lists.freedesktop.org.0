Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 494C569351C
	for <lists+freedreno@lfdr.de>; Sun, 12 Feb 2023 00:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE78C10E40B;
	Sat, 11 Feb 2023 23:13:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB4610E3F4
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:46 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id hx15so23890841ejc.11
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pCNhmTyhkeISKvFLOykUTjbjiGKCdGxhslVjfkllADs=;
 b=LVSwbNnqyV02HYGaGq+oxqylXUd/CZJuOWa2qU+TRpuB6bUiSXXGrcNGSzCalZeQIZ
 uMayYktXwl1QD85g3Qwpsg7q+eOT+1Mu1SV1078ruR7kpozAU+Pq25NrDRrARKQPDK/1
 cMv6iapvSfaqQ84WcPDeMUDevicarJ4abN3TLjigorKF8z4iRTc5Xjyf9/1CeY1hbIDE
 Qo9LoshyfWvG8eH6n1y+iFJfc6vzy6Q8fBKxs6z0rENddatmqqhPIaNlsD5J14/WA+Ko
 fBLnzYVhqNovTZarsllmSSw1eV6ZuGQsCe6T9BFc+ORiq6P/FPzhE01dC/1iw1JkllqJ
 QhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pCNhmTyhkeISKvFLOykUTjbjiGKCdGxhslVjfkllADs=;
 b=njO3oWm1kzpIgEV8XyemBR5G8m5Dh0/015v+y2zJ0GAJcrVpICMtnbgYBm2WhbTcxw
 jG/7nw/XqoQUlbP0xJOBuaRCj3DbsSrHXCWLRDrj5GftJTp2QPfACdyO/KXP5xIlkpmC
 ZhJnWhcQwISzuhd63izGzontn7Gll3/LmRxWdya3IJDDI/oI3/m8uJV4ruQiGwA+V2gd
 BmAH6ndsjsN/LNgxzSFQAr2/MfsOiHon5X30M3jdj7mZJ/z5pA1A8PG8u9zgWDNEl/BX
 PsHnvs28RsXtGHZ2i4C3+HgeRSA1Ihcj5qwXeORiVF2Um5u3C4Vh9NTNFgC3mWN6UEhf
 lgHQ==
X-Gm-Message-State: AO0yUKW/nDMdF9Jjgw0i5k+2u/UKgxsE5VuSK6b1uopIfqcRUDZmQnP2
 YYESoPtH9mrLYIEfyUnwUr4jmQ==
X-Google-Smtp-Source: AK7set/LgXO/XBlBP8R9jAk8yD6BU7XE0F0Lk/CDyQ7HVMSGfsYGJabdBCvZF+XLJVuh7Pq/iZwsng==
X-Received: by 2002:a17:907:1c22:b0:8aa:bf48:aae1 with SMTP id
 nc34-20020a1709071c2200b008aabf48aae1mr25112450ejc.6.1676157225787; 
 Sat, 11 Feb 2023 15:13:45 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 12 Feb 2023 01:12:47 +0200
Message-Id: <20230211231259.1308718-39-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 38/50] drm/msm/dpu: enable DSPP_2/3 for
 LM_2/3 on sm8450
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
index a3faaab2226c..3d95f2472e7a 100644
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

