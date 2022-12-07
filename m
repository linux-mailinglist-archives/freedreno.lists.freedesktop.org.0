Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4D5645C8E
	for <lists+freedreno@lfdr.de>; Wed,  7 Dec 2022 15:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FB110E3C0;
	Wed,  7 Dec 2022 14:28:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3884910E3BE
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 14:28:37 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id d6so28935118lfs.10
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 06:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+tqHHAIxeFhW3yvZHWiSjK7XfZq54YvDHTiWWGT5vL4=;
 b=oFuG7G2iBGIad6pNguR48DGgTRcMvks3pnZgiixbMzmSQcPtvUFoQRB4TqnDw59cR4
 5nzOIe8tQCuUs99til87rJgQa9roaVLSEOMzemTb0AgKdK6eOR3ddjVuhgZ51kRT0NJO
 GCnskhRkCJqn9qfFn7JpZktD2+L3MhS2ayGow5ttnhHUZzaXjAzEVNsFK+IbTZNghZWx
 NenSn5MJf1L5YNtjwuKz+6OSvjyxu5KUvhebgc/k3syLMfRBDudmkkXd3MyHfAeoBUt6
 WJHH5RsvrxIbJWgGJ69A6bBDEn8AvRVSNrj5Y3SKmElDKKamUXznlhrAYFZw5O/Q1Am7
 adoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+tqHHAIxeFhW3yvZHWiSjK7XfZq54YvDHTiWWGT5vL4=;
 b=aLoOryegwba6j4lnfheEbrx4YF4RQKA6t6IGhEp6y3R8zBYlfrNIioPCtpiy9LER5f
 KfW4bZL97hc2qist/KfhY01xTWVlm7if9ygqeoxQobYsaPd0I6r5n/G2LUXmSEcSVTYC
 qO7ZioVjT8BJhicAqmn1MWWwSP05/151WQP+gyCc/ou4Kfd76MMYa0aXuzfteG3NSvzK
 WJaBwsfPdJVuAQMfu2NuoKGil9jixvLgQeqhWokQA1PmT7cJ7nQ5GhuEPxHFaS0sb2yF
 U12vjT7Y2cu5oSv/81Bys0n3DFEArQ1bSuSBwFzPOYkGblNzhaR2mZUXa/Zk+ZhRJ9nL
 FzXA==
X-Gm-Message-State: ANoB5pnpKhRCJMj7hBpcB6V0g8hwN6sEquV10ZudyYvgi8CO74Qxk1ZE
 2wUrAFQmBU6XmS9IU9R1A2nh2A==
X-Google-Smtp-Source: AA0mqf7GGNT/dLtn+g6Iq6FngOfJZpkZdIi613eu3Q2lGbfEoVEW8h+M04Zc+gpyZjBd2Fvgo4F0nQ==
X-Received: by 2002:a05:6512:c06:b0:4b4:a843:38b3 with SMTP id
 z6-20020a0565120c0600b004b4a84338b3mr26443939lfu.417.1670423315233; 
 Wed, 07 Dec 2022 06:28:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f27-20020a19381b000000b0049fff3f645esm2863430lfa.70.2022.12.07.06.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 06:28:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  7 Dec 2022 16:28:30 +0200
Message-Id: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/3] drm/msm/dpu: several fixes for UBWC setup
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

Several small corrections for the UBWC setup and related data.

Dmitry Baryshkov (3):
  drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
  drm/msm/dpu: correct the UBWC version on sm6115
  drm/msm/dpu: add missing ubwc_swizzle setting to catalog

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 6 +++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.35.1

