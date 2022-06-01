Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 824EE53AAC7
	for <lists+freedreno@lfdr.de>; Wed,  1 Jun 2022 18:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AEB10EEC9;
	Wed,  1 Jun 2022 16:13:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE7D10EEBA
 for <freedreno@lists.freedesktop.org>; Wed,  1 Jun 2022 16:13:52 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id g25so2513309ljm.2
 for <freedreno@lists.freedesktop.org>; Wed, 01 Jun 2022 09:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+I+UyB3gaDAOBGduxnIltchs6IwUUwLGZ1KorhAXgf8=;
 b=YC59mP93jx3kqFL6TDmwE41jd6r7Wr9Duz81GvIgZ5xjLK1EmcKx3ajfJCQnHpnlmM
 0SiEZvngmNOOZKaf7ujE/L49RQrw8JgpQZbspnUvl+wvL0/Ie0SEbP0k7eJV2q4RZsiR
 6UuVRKeh53CNgLO4OjGWqegvYGe3XaELbwRznVIGHK8SPu47x2kh0IFrPqtDTRIspnNs
 MRL28KwGagb3zgFpjaTrT2shbK6uZiEdcp+2SeBxBPl8BFOe7hW77bx+KtCIKmv02juW
 K62BAQ2IQAVOTKwqA/xy00st1A/Iik1KNomcU9eT8AE4Ax0UIZUy7L0GKqrR3Tl4tqdu
 QYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+I+UyB3gaDAOBGduxnIltchs6IwUUwLGZ1KorhAXgf8=;
 b=ti3poUoUAM/8ZCQMdPu52Uo3skYlTdikpATSgd+fSmxylilp1nmQPMFYgm1bYz++3f
 f2omIKm1F0MJFvCZ6KeDvAwNs+TCvdku0Co3ez4zvzG0snQygS9Mm3uyE3jHCu8zzcHK
 AXWJVN02gj/5FWcZqHGXSWSLKJB/zF7YxV+Drs62pSlg9/ujCdDR6Z9+QOflvfG73/kY
 jOb0vtaiibtmcPQoudQ1uZbzJ3l18wRtxNe+84+1ufAJMpgofLNQA7FiuQPwzoR4j9Po
 QsuuAagYVEczwYC8rs8er8xI7mKPy/XhiB51AfJsppygATxNxWps1oubii6TNj0UysMo
 8BxA==
X-Gm-Message-State: AOAM533Y+7u1nEMGmY73Kc2MCxyuMNSHRYxA2C+/Co2/GgxPEYzZb5jo
 Lao1KQwMohJM7RbPathfVXIWXg==
X-Google-Smtp-Source: ABdhPJzR1vk7pIRkoF1uACdua+p+j7XZ6aU5L+tQ75c8TMnbvNO2GpfgyqyC1WznfffN1nTrncxZ/Q==
X-Received: by 2002:a2e:9b97:0:b0:253:eb92:3440 with SMTP id
 z23-20020a2e9b97000000b00253eb923440mr28964723lji.316.1654100031072; 
 Wed, 01 Jun 2022 09:13:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05651239c200b00479066d45bcsm339545lfu.214.2022.06.01.09.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 09:13:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  1 Jun 2022 19:13:46 +0300
Message-Id: <20220601161349.1517667-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
References: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 1/4] drm/msm/dpu: drop xin_id from struct
 dpu_hw_blk_reg_map
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

Drop the unused field xin_id.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 550b2e2b3e34..e8adb118fa85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -20,13 +20,11 @@
  * @base_off:     mdp register mapped offset
  * @blk_off:      pipe offset relative to mdss offset
  * @length        length of register block offset
- * @xin_id        xin id
  */
 struct dpu_hw_blk_reg_map {
 	void __iomem *base_off;
 	u32 blk_off;
 	u32 length;
-	u32 xin_id;
 	u32 log_mask;
 };
 
-- 
2.35.1

