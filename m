Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59936E7D1A
	for <lists+freedreno@lfdr.de>; Wed, 19 Apr 2023 16:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7785310E9DB;
	Wed, 19 Apr 2023 14:42:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3385910E133
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 14:42:00 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l31-20020a05600c1d1f00b003f1718d89b2so1617398wms.0
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915318; x=1684507318;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IVSa3v9KsJg/92VqlTELAV8syGj4pvx3zjA8ESRGdaw=;
 b=uXSH5qJybjPTZGPMwftuPl8wsOD+ae7+MkZoy48K6gde/MsLM7C3IxMRkoquOgGwEj
 said5iJMtae7d0h7mjDwvaLZRyja7XLrcZli50caoBfCpROYKO9ZC4QM+sMACjxjFFuJ
 JQbmkCrnH1RDgN2umeuiRe3M9QmHcyYOZllCLg2a/vDt86gAcKsjivIo7GLZWGgETPNX
 3U42L+bvrWt0mn7hyoKm/RkPCi9OKVmJ/ZGw3nR16KZI+1XMZcEDLaFf1TpTRNbciPur
 Hx+0rMkNmCBlcLgqNLUjbx2k6MUXPmHzdmYpAIJSDBt9liA3lxhiC2D4GXYSyWAiFM+5
 MF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681915318; x=1684507318;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IVSa3v9KsJg/92VqlTELAV8syGj4pvx3zjA8ESRGdaw=;
 b=lrMrwcDOB08uqm3nX3AI2AaIWeMA5pi0RjoBDz89QXEKd3mPxG8aY0ozuZtj2vrlng
 U8aARHdFZEeG38ZLAjre4xgM0H9s/50a7ETiwmnWCkqSzmvNTNc7EFpwrwNYvA1RaQ1E
 Xl0lS7/ZVgJxmeUN9mi7GmDqV2//0Ti0hKvj/RcesPy3A3VBGhC/YCIiNtFojF83odij
 osnMM4TDiJc6nfpOkHlNBQh2GHufL0z2ZJO01dYZ/sQMtdbwgKURyWzGeRJT+B1JNI0U
 Oqs8PryYfWwVvZEwiy0PILsIjdJNd9nTe2NJHsOgkS9MqgAeVPa26JLm7okHEziNQjGQ
 3sWg==
X-Gm-Message-State: AAQBX9eLoS/k5Af7z4P99JTRplMOMQd0DPgrkXOjzYBN/AcNN8p1ecNi
 HH2pRxjHeEK++pZPrRyd2APz
X-Google-Smtp-Source: AKy350bGlmQmMtXg9CozuDIW9XuYDCQgxYNBmMpzExRWiBSBCFebEa48q9C8fW7LnLJHgnHzr4pg/w==
X-Received: by 2002:a1c:ed07:0:b0:3ef:6eeb:c25a with SMTP id
 l7-20020a1ced07000000b003ef6eebc25amr16057062wmh.6.1681915318699; 
 Wed, 19 Apr 2023 07:41:58 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:41:58 -0700 (PDT)
From: Arnaud Vrac <avrac@freebox.fr>
Date: Wed, 19 Apr 2023 16:41:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-5-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=CDBIvOWtwi9aZ7RRIDQqd7SRtuQgF7hezIg0kgVuXhA=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2dJRmjvyQIHMA35EzFtdfeQCWdKsmoqxMyC
 KhTYcFPJ+OJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9nQAKCRBxA//ZuzQ0
 q0X5D/0aSHCjp0ig81KYbJRs3J6FjRqaFku3XF7PaHPJLMriUUmk19hVcxaYBNWKsKxBq3f3k1+
 SJL2G79OCXfM30ongZgZ57t4BMp/lmOrnOguLlj+6n5RLVJ8KvkGHMVL7pA5o/1YEMP6k1SVH5B
 sFhAc/t99qssE0rjEtIZDSR96Bg2ZRUaWBjBK8ddEnghwXtojkv0Udb7cJywJ25X7T3IH8RpXln
 +fA6sGohtUZ+T/a6ieO6p4Kk3bFUVG2p8MVzCFlMjkjdoWqdNTj5rc6IwNL8UR9R7PZED4bID7G
 ZzsZUtTbj/h13CL7UmnG28jvU2jUsHX5VLJOmrh0RgfKG4Gq2CX0FgEF9ejE1ISmJTxwf4npwK5
 nMYyAVPdje7ca2sAx56wDAfKglSSahk9L7r8NAOb0ArKKe2qN4ZJ/DzmE1tfmFRon+xPuxwYLpj
 c61NMrfMeOM8ykBLgOSOwzUvUhzcrAhBlMDq4C73aZA8QTKD2BRwaqyBVa4IJY2A1MfClyuWInq
 QoVbFCxb71ZE3VHuv3GIyLfNuAWr2JOMj0KLYsragK1vDks+eOOWgdrzPA9FXFEeF7i+g2kZjYl
 L5ZkcSgBt10Jacwq8m6jQSUuwI0Wh6mX+UNFVRQoLxnf/Nf4aJRkFCo6bPMSCbs+GirNvCuC2ou
 7vnXujDg35QAmKQ==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
Subject: [Freedreno] [PATCH 05/11] drm/msm/dpu: allow using all lm mixer
 stages
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

The max_mixer_blendstages hw catalog property represents the number of
planes that can be blended by the lm mixer, excluding the base stage, so
adjust the check for the number of currently assigned planes accordingly.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 148921ed62f85..128ecdc145260 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -882,9 +882,9 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	r_pipe->sspp = NULL;
 
 	pstate->stage = DPU_STAGE_BASE + pstate->base.normalized_zpos;
-	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
-		DPU_ERROR("> %d plane stages assigned\n",
-			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
+	if (pstate->stage > DPU_STAGE_BASE + pdpu->catalog->caps->max_mixer_blendstages) {
+		DPU_ERROR("> %d plane mixer stages assigned\n",
+			  pdpu->catalog->caps->max_mixer_blendstages);
 		return -EINVAL;
 	}
 

-- 
2.40.0

