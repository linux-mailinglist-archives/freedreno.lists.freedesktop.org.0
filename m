Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5C57BCE8D
	for <lists+freedreno@lfdr.de>; Sun,  8 Oct 2023 15:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC53C10E0ED;
	Sun,  8 Oct 2023 13:23:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C2710E0CF
 for <freedreno@lists.freedesktop.org>; Sun,  8 Oct 2023 13:23:25 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50585357903so4859147e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 08 Oct 2023 06:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696771403; x=1697376203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2idug8K8OwT9Hkyo7LhZdc3aUSwi5P2oZ6NFnNiB8oo=;
 b=SF4tgZweul3kR81RadgCybR6vWqifM4X6cEdZPRWHG588kH7G7GoWpgW6++k54WYJp
 mH8bGlxW5sFhtrZQIeViGfxHIGzKYazQCjyDjcll5h6foxvgp2dZxOlNg2uCovek3tck
 1c3YDD82NwQb030qE5rJaUhcTci/7As5VB7UvRE1VFHqatPsUsQ3x0SzP0qE5pPcmh4r
 xq0uFcxAxEhsSDrl8OyQ3sZUhSE/lGV6JsFTXZNylBpcB820nVIUjrLVDPfLa+Pe5BjX
 9Cotn6PO+2Hb+wOr60xVCki7W6a7PMFeijWj8xaDLCyNVrFXd3P+bQK/Z+Mef4uRt/LL
 qngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696771403; x=1697376203;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2idug8K8OwT9Hkyo7LhZdc3aUSwi5P2oZ6NFnNiB8oo=;
 b=pGA/r7lcZatlLQQ3NCe3EqsLd3VZJjn+WTSWp3jkCPAXrG7ZAoLOgtlTqfEvDkH4Hc
 LIpN4s77pQhW/OGwy8Jlsbsav6bi7+8v1dCUOuj6jElGNOs8XKugPmbinBfYWwvflkng
 Vt97rxffhe9m8gUsQi/nGch02lnpP86VXjNWZBgmDTot8TLXAe8AClL2dhmOC52Nfhvf
 2+ujNNQ6GWUdJSyrvJ4tG5J3R+FcwujzZM/ce6gVsEwoj6he0PKWOVqVBubKXckKFOmC
 nzJx+nE8Z/0MG9r212Y/ODScXEphD6qjFMGu7XlDGt0UPKk9oC0tW0MQLmxFPAu62T8d
 bifA==
X-Gm-Message-State: AOJu0YzRLvvbFaV3TkALpWRYuVH1itg69TIZjdSlKwneb1yjQ/w4ICcL
 WkbiwywPs7f967KkraqP4MGr/A==
X-Google-Smtp-Source: AGHT+IHx14cJCtO/hU+EHIKoCHvXz2+uwXHhfV805Hh9E7uMBZQVVQWt2RfyIdHXS1b0gOOtFmV5Fg==
X-Received: by 2002:a05:6512:531:b0:4fd:fabf:b6ee with SMTP id
 o17-20020a056512053100b004fdfabfb6eemr10670377lfc.9.1696771403150; 
 Sun, 08 Oct 2023 06:23:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.170.82.148])
 by smtp.gmail.com with ESMTPSA id
 c28-20020ac244bc000000b005046bf37bebsm1083219lfm.57.2023.10.08.06.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 06:23:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Sun,  8 Oct 2023 16:23:19 +0300
Message-Id: <20231008132320.762542-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/2] drm/ci: pick up -external-fixes from the
 merge target repo
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In case of the merge requests it might be useful to push repo-specific
fixes which have not yet propagated to the -external-fixes branch in the
main UPSTREAM_REPO. For example, in case of drm/msm development, we are
staging fixes locally for testing, before pushing them to the drm/drm
repo. Thus, if the CI run was triggered by merge request, also pick up
the -external fixes basing on the the CI_MERGE target repo / and branch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/build.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 7b014287a041..20a6ba8a7b04 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -64,10 +64,15 @@ if [ "$(git ls-remote --exit-code --heads ${UPSTREAM_REPO} ${TARGET_BRANCH}-exte
 fi
 
 # Try to merge fixes from local repo if this isn't a merge request
+# otherwise try merging the fixes from the merge target
 if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
     if [ "$(git ls-remote --exit-code --heads origin ${TARGET_BRANCH}-external-fixes)" ]; then
         git pull origin ${TARGET_BRANCH}-external-fixes
     fi
+else
+    if [ "$(git ls-remote --exit-code --heads ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes)" ]; then
+        git pull ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes
+    fi
 fi
 
 for opt in $ENABLE_KCONFIGS; do
-- 
2.40.1

