Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C1F3BFA34
	for <lists+freedreno@lfdr.de>; Thu,  8 Jul 2021 14:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74536E8CA;
	Thu,  8 Jul 2021 12:28:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4756E8BF
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jul 2021 12:28:52 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id f13so14850372lfh.6
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jul 2021 05:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7I80h9aVhqiz7KKnY4LfQ8riY+ihQMK3yCgtkJKzH/0=;
 b=dZAt1g6wH7fjpFQDlowAYZN8LtG7zjesMmpA6jmrhqhJAE1HfXHW7YzFzwRvWx1byI
 Dt012MPl6hYgduqdcjBogdsG+Fvg/tvP5s3Hj1WX86YPrM2GkPc7RjLF3Iii8SroKNkM
 3ug7axUM0HJ8atvA5l08Qn/Zsf62TUILw9Thg7Ti0tAefyhiVF0TZfl8RgaJ8n8Yym14
 gYCdCim+evV7ZlnE+Ia1nU/qUgExdopbWe4jkbAtNM2XJOhoCnZjbyPRvQuBOaOBYUsD
 ZcmYp7kCvy5GjvBBAhN/qElPHe0llzlsIdCEbNDzsRK8FMo98+xUtB+q1HCz2q7LRfpt
 O58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7I80h9aVhqiz7KKnY4LfQ8riY+ihQMK3yCgtkJKzH/0=;
 b=cCsNFQlhZrpVXMGPbr6t2Mg0XQjpO+O2K7otO8lLhBqi8lcDPBaZE9O1GTTC+qJiUo
 M5RYC7rggMXvUlLBjWL48Bs+g9nqD/Un56J+ETjjrNxSbVPCuhFVW3Uz+NlVGCTfEEiT
 R6q1Qw3tgYNykjnpKzkgAhA8068Ow6NLoepe70hJj3nOjt3hdJrsLP4HGn718c5MTZSa
 nytFX21CK0Zb76HZ19nBa1dxfd+yFRNKqyyMsN/H4P5nPypHj+aEA1DakeJONfZ+IgJs
 +WUD2rtRImqunGDxVbya0sdyYqlrO7HQmFduiH4DjWXmRS3s+1RRk/xdUi/qz4eMoXC3
 zT7A==
X-Gm-Message-State: AOAM530vMF32SHZ5ys20Q3LzKBPIlA+++HQL9iDJEfHyWWbnpFYZEI2E
 2y3Ww+l23I8KFgeISpVFJDuccw==
X-Google-Smtp-Source: ABdhPJxcesU2QBAkJa39kbKnQyTZPVM6HeuqpeKl/QOq4QlQUQTGSkaTJaHkvInbFM8r2vb4I0+J8w==
X-Received: by 2002:a05:6512:1385:: with SMTP id
 p5mr24551389lfa.447.1625747330880; 
 Thu, 08 Jul 2021 05:28:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f1sm184368lfs.211.2021.07.08.05.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 05:28:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu,  8 Jul 2021 15:28:33 +0300
Message-Id: <20210708122833.363451-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v1 7/7] drm/msm/kms: drop set_encoder_mode
 callback
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

set_encoder_mode callback is completely unused now. Drop it from
msm_kms_func().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_kms.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 086a2d59b8c8..9484e8b62630 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -117,9 +117,6 @@ struct msm_kms_funcs {
 			struct drm_encoder *encoder,
 			struct drm_encoder *slave_encoder,
 			bool is_cmd_mode);
-	void (*set_encoder_mode)(struct msm_kms *kms,
-				 struct drm_encoder *encoder,
-				 bool cmd_mode);
 	/* cleanup: */
 	void (*destroy)(struct msm_kms *kms);
 
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
