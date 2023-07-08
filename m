Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B65B74BACB
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 03:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA7B10E63A;
	Sat,  8 Jul 2023 01:04:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9331D10E05C
 for <freedreno@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:14 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b698937f85so40754281fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778252; x=1691370252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c67ZCjzlNdx/XIvJplLRs/ovo3gUYzy9Nna9L/Wnj3A=;
 b=jw7J2xd9PvXrph2i+P2M9+qXmQ/Ynow26KULw3kswytzVbu7kb+vXN/FiNeZ7OMUX5
 utnNEkUz9Ud/74abFHIEz4HjYqW1X+rxv7jvUCtrAYTzLi3zQXDQYfoo0hQtul0RBomh
 eAFpkH5VlVatCf8XtdHWcCi4VFAe+bhDHicDSV7uo3kYr6uil6nvqAuQTOya4SHzMHRk
 wteyEA10l8YwX8Jce56YK6rTPfWlAJ/L9b9zxgZg5BmvwxDzXY53pCmLXYa+0oZjueGc
 JxNhLyaXV+UF73vXdiB/d2mxgj8nHMZv4ZHVT73zRgk7ocYTfZeHR/wWc361V373oA+w
 ZPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778252; x=1691370252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c67ZCjzlNdx/XIvJplLRs/ovo3gUYzy9Nna9L/Wnj3A=;
 b=mELjezcbZzVlvw1W78vwpChClHLw/bxaHXz36Hgd+1GsWTZfzsHbelsSL/uRYzIumm
 OxJbEBWrEC+5+nbuKNcSNuwHbH3jGih7iKcsgyPWQi18CloB4D6fOlhG3r2AXdzwgE6C
 z6V20XZTzid2R65Xa1GJoAovRrfp48Le2IO1j4NMZZnuSC0lPRZj8jrrZUWYJMCSkIjk
 nz0U8XjcUsC7CvT3ohuJbUuKvRCLb4CQ+xw3noAaIktQXawMSVmHIMtwB/OXiq9qgDBy
 V6i/MfhK6OSl0Lm10w0joP7H7ro0bFfAB3veCc4VVkjIQXfa9rT5NSt0YDlpUJkai237
 6I2A==
X-Gm-Message-State: ABy/qLafebNKPiLjYMzL3rIX+9tSKIq5S0HHsnG5jPgy36NYRJ28q6B2
 IPo15I1JKCX4Rh6VpzdB2rAmKQ==
X-Google-Smtp-Source: APBJJlF1Ryz032/WTELXYwFoL+c0PZSZueJpHIwzNpRH1emr8OH5jk/1/aQS3dKc0vLLz0PzQ2vVwA==
X-Received: by 2002:a2e:7802:0:b0:2b6:d576:a25b with SMTP id
 t2-20020a2e7802000000b002b6d576a25bmr5043109ljc.28.1688778252284; 
 Fri, 07 Jul 2023 18:04:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  8 Jul 2023 04:03:55 +0300
Message-Id: <20230708010407.3871346-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 05/17] drm/msm/mdp5: use devres-managed
 allocation for pipe data
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

Use devm_kzalloc to create pipe data structure. This allows us
to remove corresponding kfree and drop mdp5_pipe_destroy() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  6 +-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c | 10 +++-------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h |  4 ++--
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b4a49d369f0d..be4338a48e52 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -209,10 +209,6 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	struct msm_gem_address_space *aspace = kms->aspace;
-	int i;
-
-	for (i = 0; i < mdp5_kms->num_hwpipes; i++)
-		mdp5_pipe_destroy(mdp5_kms->hwpipes[i]);
 
 	if (aspace) {
 		aspace->mmu->funcs->detach(aspace->mmu);
@@ -645,7 +641,7 @@ static int construct_pipes(struct mdp5_kms *mdp5_kms, int cnt,
 	for (i = 0; i < cnt; i++) {
 		struct mdp5_hw_pipe *hwpipe;
 
-		hwpipe = mdp5_pipe_init(pipes[i], offsets[i], caps);
+		hwpipe = mdp5_pipe_init(dev, pipes[i], offsets[i], caps);
 		if (IS_ERR(hwpipe)) {
 			ret = PTR_ERR(hwpipe);
 			DRM_DEV_ERROR(dev->dev, "failed to construct pipe for %s (%d)\n",
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
index e4b8a789835a..99b2c30b1d48 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
@@ -151,17 +151,13 @@ int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
 	return 0;
 }
 
-void mdp5_pipe_destroy(struct mdp5_hw_pipe *hwpipe)
-{
-	kfree(hwpipe);
-}
-
-struct mdp5_hw_pipe *mdp5_pipe_init(enum mdp5_pipe pipe,
+struct mdp5_hw_pipe *mdp5_pipe_init(struct drm_device *dev,
+		enum mdp5_pipe pipe,
 		uint32_t reg_offset, uint32_t caps)
 {
 	struct mdp5_hw_pipe *hwpipe;
 
-	hwpipe = kzalloc(sizeof(*hwpipe), GFP_KERNEL);
+	hwpipe = devm_kzalloc(dev->dev, sizeof(*hwpipe), GFP_KERNEL);
 	if (!hwpipe)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
index cca67938cab2..452138821f60 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
@@ -39,8 +39,8 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 		     struct mdp5_hw_pipe **r_hwpipe);
 int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
 
-struct mdp5_hw_pipe *mdp5_pipe_init(enum mdp5_pipe pipe,
+struct mdp5_hw_pipe *mdp5_pipe_init(struct drm_device *dev,
+		enum mdp5_pipe pipe,
 		uint32_t reg_offset, uint32_t caps);
-void mdp5_pipe_destroy(struct mdp5_hw_pipe *hwpipe);
 
 #endif /* __MDP5_PIPE_H__ */
-- 
2.39.2

