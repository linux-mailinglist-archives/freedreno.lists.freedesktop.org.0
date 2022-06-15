Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F217854C947
	for <lists+freedreno@lfdr.de>; Wed, 15 Jun 2022 14:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93DF10E67B;
	Wed, 15 Jun 2022 12:57:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C1110E67E
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 12:57:06 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id d18so13180201ljc.4
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 05:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y3lVlj1KKNHBEo54nqDtt6bYRWwOKPlUpIBRqxeMjlg=;
 b=JgGvBPV9MF2UOBPmhw7nC7nM+kL2Zf582u1CGh9aYJpx0gFohrzbrHh1OwD9JT48Zs
 CPV04XhiIYfUplyDtw911XnlkoNINjsgB1g2Q2CfcjhNt+cczDr9sKp6vJP2oZMTLtHc
 ODneIIB7tWAPqjzD8+ZPCefYS7G7jGAYust0DtmKEb7pnX4ecJpvCP4iatAtvA7GF7ZS
 ssh/3aKeURbysmeaOJRX/5An03NPmAbfjEcXbhPKSOogzcICQClnRySJRkTCCFErq8Xd
 vR+dlfssXm3PdaIQuBaNaOTnrOb6fTtm8zMGjPoQAAjekQ6Zv/AAYWBE9UPx+DrkVvDt
 /KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y3lVlj1KKNHBEo54nqDtt6bYRWwOKPlUpIBRqxeMjlg=;
 b=c+AjxP86D7Sz+XrHGsXoCsRBNzpP8fCqMaMkr6cR+78JsFPdnyUG2Q/dffXX0EqEKj
 uScdLIHsztWpNF0xC0s8zJRu3RrX8iJNK2yPqwBn1URXuzIRCzMTPphV4Pf4MldSOfB1
 5lXP6QoTqVzBxVru2kFLATD62AVMMwyR4QeIsaRi6dKH3ooFHaJzmwgplxiUAV1SKB9e
 QrehY0yJ1wpgZMmLA8qX4mB/zkdNaH0uxdJkRWl43itWK5txWgFjOVA/sK2wA2moSCnV
 D4yhOENu2AmdhXkjWGbi5BZuc6h0oR/h4T464UPmVjbm4sx7tcNUppzb1+Blepw9Ubq6
 2z0w==
X-Gm-Message-State: AJIora/FAgZ+uOrCWvr+BjTS31U4sf8L/iVyZbBhegUjBiNe5DFSpVAc
 Q2z2Ry5Vm8rBJ1hOucm2f210jw==
X-Google-Smtp-Source: AGRyM1swLq5IAWEw0pYZnwfi64+I3HJ1EkOBvA8ctl5T7zkei9G/V1FNwfKeiJX28Emsg2SFVbFKAA==
X-Received: by 2002:a2e:2a44:0:b0:256:abe5:275e with SMTP id
 q65-20020a2e2a44000000b00256abe5275emr5008546ljq.190.1655297824791; 
 Wed, 15 Jun 2022 05:57:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u13-20020a05651220cd00b0047255d21100sm1798013lfr.47.2022.06.15.05.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 05:57:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 15 Jun 2022 15:57:02 +0300
Message-Id: <20220615125703.24647-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615125703.24647-1-dmitry.baryshkov@linaro.org>
References: <20220615125703.24647-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 2/3] drm/msm/dpu: fix error handling around
 dpu_hw_vbif_init
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Moreover dpu_hw_vbif_init() function can not return NULL.
So, replace corresponding IS_ERR_OR_NULL() call with IS_ERR().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1255d00c92cf..922725c92898 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1135,10 +1135,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
 				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
-		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
+		if (IS_ERR(dpu_kms->hw_vbif[vbif_idx])) {
 			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
-			if (!dpu_kms->hw_vbif[vbif_idx])
-				rc = -EINVAL;
 			DPU_ERROR("failed to init vbif %d: %d\n", vbif_idx, rc);
 			dpu_kms->hw_vbif[vbif_idx] = NULL;
 			goto power_error;
-- 
2.35.1

