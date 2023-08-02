Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE37B76CA51
	for <lists+freedreno@lfdr.de>; Wed,  2 Aug 2023 12:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9777810E538;
	Wed,  2 Aug 2023 10:04:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC49E10E531
 for <freedreno@lists.freedesktop.org>; Wed,  2 Aug 2023 10:04:29 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fe3c7f16bbso4401999e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 02 Aug 2023 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690970668; x=1691575468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pz9p9H1gH6Z2qG0n33HfyJPwsmR7261k80eGvXXicJE=;
 b=ix2Tn2myJSxhFqIoer/5iWlas3B0FRrEcSoDHBqKcSgHR+dfxV0eWePnnKTMmG+FOA
 o1VxnhvzPMyVaaVLxIJDKyKqNqS2f8HbLzbKBVkKonU2sEeYGnN9HO1TzYV7NZpQKE1U
 seykqfqVMGXUmBRQ756RYtxAad7QlHjg96GmHh89yJHfQj6YSfpAjzCSVDpw+Mmj9RH+
 krLm+NVtavYO8txFnmXwIQchKh/kc//mW0HORoH+lCKx7yLgpn4ls8QLLozxVgWiYmTh
 IeuzkFY7YbexKOSFsGK++jJtfa0UdiDMjhOO60LPT7IOGxFnPtSf7n4DLJTDJJ320OyK
 t5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690970668; x=1691575468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pz9p9H1gH6Z2qG0n33HfyJPwsmR7261k80eGvXXicJE=;
 b=jnJyI3qnvAfhwoQlxyN4D2dPhKOmucu1ai0yl8p76SppwuzfQn1vNINm76n2CzDO1Y
 Fafu293LMa6MXqqttDjIcbvBRPSB9tKZnjYmaPwFzDMQuBQCd3/1O+fbl40I0njOJ8gn
 9UasHKisQz1iWZnuAGczNtolxv6KORnoiQHjOxQovLGcsR0ufiy4LPP1ubGB25JDAVQm
 8WiuG4A8WA8UoMDaCb5qI9bQutVUBNEfgjEvb65/cPynWCfL165rT7Q5HDJG9CN9VFO5
 NoR2UQEoaA+cPSZZ2NS7jpYoGJ+BSGhLmPw1YcIJCsoa4ts/WCZER8uy/r0eObOMAX1R
 brUg==
X-Gm-Message-State: ABy/qLbWlpq47cN6gCg/DugI7suspYDzyxpd0lQv6vwkjj5xL/OoDidN
 GhboYK6nkVSkueO+WQkCtJiguw==
X-Google-Smtp-Source: APBJJlFtVRVPgbYw1NzWRXDam1xhTvn+p1AKo13hr3Lc0+Jw87f8yJNa7r4Y1W7+jEnmVEOX85Nu4Q==
X-Received: by 2002:a19:2d42:0:b0:4fb:8948:2b8e with SMTP id
 t2-20020a192d42000000b004fb89482b8emr4153860lft.8.1690970668076; 
 Wed, 02 Aug 2023 03:04:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a19f015000000b004fbf5242e8bsm2402353lfc.231.2023.08.02.03.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 03:04:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed,  2 Aug 2023 13:04:19 +0300
Message-Id: <20230802100426.4184892-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 1/8] drm/msm/dpu: fix the irq index in
 dpu_encoder_phys_wb_wait_for_commit_done
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

Since commit 1e7ac595fa46 ("drm/msm/dpu: pass irq to
dpu_encoder_helper_wait_for_irq()") the
dpu_encoder_phys_wb_wait_for_commit_done expects the IRQ index rather
than the IRQ index in phys_enc->intr table, however writeback got the
older invocation in place. This was unnoticed for several releases, but
now it's time to fix it.

Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index a466ff70a4d6..78037a697633 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -446,7 +446,8 @@ static int dpu_encoder_phys_wb_wait_for_commit_done(
 	wait_info.atomic_cnt = &phys_enc->pending_kickoff_cnt;
 	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
 
-	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_WB_DONE,
+	ret = dpu_encoder_helper_wait_for_irq(phys_enc,
+			phys_enc->irq[INTR_IDX_WB_DONE],
 			dpu_encoder_phys_wb_done_irq, &wait_info);
 	if (ret == -ETIMEDOUT)
 		_dpu_encoder_phys_wb_handle_wbdone_timeout(phys_enc);
-- 
2.39.2

