Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FE949431F
	for <lists+freedreno@lfdr.de>; Wed, 19 Jan 2022 23:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D7110E259;
	Wed, 19 Jan 2022 22:40:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FD310E23A
 for <freedreno@lists.freedesktop.org>; Wed, 19 Jan 2022 22:40:08 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id m3so14406554lfu.0
 for <freedreno@lists.freedesktop.org>; Wed, 19 Jan 2022 14:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R+HAFw0VYnraWHK6kWdn52lF1lJ0lsEmct+PcqtFp8I=;
 b=mzEw5yqdioxW/kZsH9Lve74Xgd6jTyL3kjQFmilDMzdFLnsLokdl8uMdB32htk4aYW
 Je8UrZFnNeNihW5sjDLPMD4whfMKqJ+K1R++djLmhzOe7d6rORF6pmcVPkMLf9Cqp4t/
 Efgq5/Qed51a/080nkrEm9nJKWo2b349aN9MQGJ1o9ISiis3nBjIhu2Sg5Loi0Y0L0VZ
 5Hr0CwcW8le+wd9GnAY4soQZlvxxvLSaGmFXnf7eHwm8S/X9T86K5WpqtWRjyyqe5/Pz
 1ctKHA1a8ad95ShbFajDKVfcTki2qY7zbWmI2fQS3q6FPcP1InWY/wVyBHCb0R4NW7z+
 vYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R+HAFw0VYnraWHK6kWdn52lF1lJ0lsEmct+PcqtFp8I=;
 b=7OpDotEFuTtFCFhwJ2qPQsst8EX17Yd9xPWuPnapn+FWLA4Lqrtv/CAktDsPFhIyJV
 mY1I4YcoeSCUGHpBerh/V00PUqx9VN0Sa8PBPabVC79vKOj49eh5arudMewrSrR0AIs2
 XZXS2Ua3fxddc0TUNHJ3pusjFGo88pBzmN1xB0FJFKPVwxnf9P/S9C3duZ9d6KCq4Via
 LYXkimfYhW2O0vjN0b7RvhTGLOOncWhHyQ6Eh0dqF+GScOIgab8pjlm530ntY180YX9h
 e2Ba02g6ZR8E4zxjLpxKrdu5EqLfQGmDLjI9cCxBuor8Ng55rnNq0KwRbvxbBhFYVrHY
 sWBw==
X-Gm-Message-State: AOAM532b0+dW6g8lHwov4wnenS34O0B2gmscxcexN34POq6P/OEVIu1B
 DU1LNykhXuyakz9VmxfbrDGm9g==
X-Google-Smtp-Source: ABdhPJyQ8po1nOn5ckOwOAKenHq7O4yL3TfzXXKk8V/20B+mEUWrMvgCvj9wwvsQSwpAIi+GghCXhg==
X-Received: by 2002:a05:6512:118b:: with SMTP id
 g11mr29301062lfr.543.1642632006718; 
 Wed, 19 Jan 2022 14:40:06 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c25sm102719lfh.35.2022.01.19.14.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 14:40:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 20 Jan 2022 01:40:01 +0300
Message-Id: <20220119224005.3104578-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/4] drm/msm: rework MDSS drivers
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These patches coninue work started by AngeloGioacchino Del Regno in the
previous cycle by further decoupling and dissecting MDSS and MDP drivers
probe/binding paths.

This removes code duplication between MDP5 and DPU1 MDSS drivers, by
merging them and moving to the top level.

This patchset depends on the patches 1 and 2 from [1]

Changes since v1:
 - Rebased on top of [2] and [1]

[1] https://patchwork.freedesktop.org/series/99066/
[2] https://patchwork.freedesktop.org/series/98521/

Dmitry Baryshkov (4):
  drm/msm: unify MDSS drivers
  drm/msm: remove extra indirection for msm_mdss
  drm/msm: split the main platform driver
  drm/msm: stop using device's match data pointer

 drivers/gpu/drm/msm/Makefile              |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c  | 260 -------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  68 +++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  11 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c | 252 -------------
 drivers/gpu/drm/msm/msm_drv.c             | 260 +++----------
 drivers/gpu/drm/msm/msm_drv.h             |  16 +
 drivers/gpu/drm/msm/msm_kms.h             |  18 -
 drivers/gpu/drm/msm/msm_mdss.c            | 438 ++++++++++++++++++++++
 10 files changed, 578 insertions(+), 758 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c


base-commit: 6ed95285382d6f90a3c3a11d5806a5eb7db715c3
prerequisite-patch-id: b5572c353efa8ebefb32fc70e54bc537f78ff2bd
prerequisite-patch-id: 40a854aee69b6ddf5b1c33cac3647efae3e3ebf1
prerequisite-patch-id: 8b687a19047983e26262a1bb2feda8a9fd5bc97f
prerequisite-patch-id: e2d7f768b4b287c80797635f3ed5b6353b12adb5
prerequisite-patch-id: cac9fb235e3510b5bcb713f602658e6233cd308b
-- 
2.34.1

