Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BCB6E7D25
	for <lists+freedreno@lfdr.de>; Wed, 19 Apr 2023 16:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BFD10E9EF;
	Wed, 19 Apr 2023 14:42:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E655B10E9D2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 14:41:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 iw7-20020a05600c54c700b003f16fce55b5so1579636wmb.0
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 07:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915318; x=1684507318;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gvyREH2toDbRX8jPDQqcQOz9n9jRJ61Ib08FCCvn3Ik=;
 b=fiEmjRI5sy66IY14yPYdCnD3Wng5CaWmy8/JWcrmhUpLJm++qPxhqYFuZBBwad2Bk1
 fRC3PzylukzxUDXSaONiWypd1Qdz05sGYKefLuw6OlnX0ItB1uSbRHZ8BB9JEI+2f4tG
 ODTG+NUZEU6Bz49uGDl1rbfofa0a2OQPMnNxd0z56unCc1W9/2JHjUzvzMqYysrAmn2e
 LM8DuZQPfdNstgogGHSUQYrwhPTNUpWSVbCBuwrTjhnRPl/iUG/dltawjO0l42MNo37i
 irA1ZHZz+utK25dZM6ERc+rbyPl/k+FsCapqQdUoNmpPXQDwJMZc43wHrPLb2/Bemt4m
 1iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681915318; x=1684507318;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gvyREH2toDbRX8jPDQqcQOz9n9jRJ61Ib08FCCvn3Ik=;
 b=Y8ker3wfG3IdiUtaiTJxbqXdwFtwwdNa2b6oZ0SwZkEa6QtjWoXGFdvmFENlK8s5hZ
 fEjWfiFq53ahk4Z3lDp4YgOQ6FBAVsUagvN/HeQ6+d2Ee+qOYXUneLlC+DaLp74KFDp0
 KF5dDoBe1jq05Ku90oxcmALDO6rp89mao5/TqdtsQsb9QED1Z1IG0tX8IgkWL+IxLKiC
 YLX6s9yA5tYpKA6fA4aRyvQ5i8AwgXi/LCdhoipqCk0LlI4Ottnmv3ciQrisPT5CfklQ
 GQOfMFY1dkri67p/giE1Vosz2B1r9G2xW5BVehlm0zw9ReT4TXPWF5gDIaH9di2YpVw+
 bbAg==
X-Gm-Message-State: AAQBX9e72bBEJ/nsJPZzwk1XArCgwgDLO7Rif1AdzBkAQrC5mHj5lEqi
 OhIupsqt79RdcA1W0k/oTaJr
X-Google-Smtp-Source: AKy350Y41eDbjV44lpKj/xlTrUrnQ2HFRVzK6oIGLJjemuk1KHFBsUN/7nExtMcIBIBSxZ+5N0s1qw==
X-Received: by 2002:a1c:740d:0:b0:3f0:3d47:2cc5 with SMTP id
 p13-20020a1c740d000000b003f03d472cc5mr17091590wmc.10.1681915318268; 
 Wed, 19 Apr 2023 07:41:58 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:41:58 -0700 (PDT)
From: Arnaud Vrac <avrac@freebox.fr>
Date: Wed, 19 Apr 2023 16:41:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-4-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=NbkvlB+Rp9R8nBIqIbNdud3AhKbbO3pB8C+IbGJ1/iw=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2cS8NGHA5wCfb2NpdA7+TL/3Juvg4voqljd
 dCN9998hUiJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9nAAKCRBxA//ZuzQ0
 qzq2EAC8YPFyE4WUiu8BKSb1ZitW40OEsReZvh9sxbDZTP3qWZ+pC1T6aDRLrWtGd01II9zSvnZ
 1e1WtK52yoxgFMMIs9m76wrqd+HyouhNxyA49sA+TJ54CNigIw70r1AjmJlKxS5t4D7JONHX8EN
 8WcDnTOyTyjhOSuR7GMbNNQvMSoyIbLnBwDQi2JgPFIH74gUttelxpiXYp/o3BlfmCvu+jFUJ0m
 6DvZ646BwFhHgi+WdDeR0xa1UHABA2DR5YfRKQEfsd37Utg/ljJuurZ+676ax7Q/f+x5nhrv6tQ
 3MFCvmBJ0WPec4eyrvX/O5sqBeYoGrluaPJwBbwwerXAypw1clzFh5o90KY3sr1APTgKO8fNdWa
 dWf31VLcAWvEOm552brE5gYPZ3nmq151VbNilEz0wGK9BrzP6aiA3PvLX4iJpj9MxEwGlB13zuL
 efJ1ZwqB7FcJZB73j5f4OpckUi5z6ytaxwbNhEs/Ls8H59xlpsey2J2pvhfQIayi+nKxgF2mZLX
 nknVZm6xJQd8qjCKv31ErlindIv/OJMLYWB8CGTjLDSredGRtnPUyTHFPl192rjH4UydVVLvf3N
 BB9TxwJFD+a2TxomXyKgp7DOHsOjeQeReXiNxSuqzfxaFm2ti/HxPir504dyFomWRoUK2BxkKLW
 pB4JplwICLGWejQ==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
Subject: [Freedreno] [PATCH 04/11] drm/msm/dpu: allow using lm mixer base
 stage
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
Cc: Arnaud Vrac <avrac@freebox.fr>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The dpu backend already handles applying alpha to the base stage, so we
can use it to render the bottom plane in all cases. This allows mixing
one additional plane with the hardware mixer.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 14b5cfe306113..148921ed62f85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -881,7 +881,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 	r_pipe->sspp = NULL;
 
-	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+	pstate->stage = DPU_STAGE_BASE + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
 		DPU_ERROR("> %d plane stages assigned\n",
 			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);

-- 
2.40.0

