Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB8801FE6
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 01:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C8C10E241;
	Sun,  3 Dec 2023 00:06:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951DF10E23F
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 00:05:35 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50abbb23122so4667622e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 16:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701561934; x=1702166734; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IG1n+K/7cjxSwfAxRHwL6Z+l9CuvM2MX4A8d88EFQkI=;
 b=fyTe49L8g040Hjr/SeQlyegpJn+hR63jPB5OABS2Dvu93sdHfgHp8yq2vMvixiz0os
 gDLYEFi/rMQ+oHbAQjwMe0Hu2li55dhVLufIHv6+3POV3fiBu+HKf0byrAd6X06HHxgv
 mdVdLudIktHAeWg1vT1+QSe3vpaLSpgzmoYP639yq+vcC6K88AnrB55LkaYaIwW2gRJe
 cQq3hq1LR4NBVT+OjPNqhfJhJXIzT8MxDFSNsligRAjJMCUDAP6A8C09heNHNJGNNRB8
 wvaCzoqXPu6AW7nNFFHb/TZ2ZEa8njJVNbpgUNVAdpsDWqFPizcYvbI5tqjVKNHEG8nm
 Lt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701561934; x=1702166734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IG1n+K/7cjxSwfAxRHwL6Z+l9CuvM2MX4A8d88EFQkI=;
 b=JbjHHyaNdRs6KtsP55j/6NJU/JROY4uPWl+KjOZUYncOfekPqIUX5V8deeJ7s1ns8L
 nZjfcwuHlTOEvCvmxWuKj4hQhgtap3Oa0+erDWOuJM8tZi24Dh+ubFFgDnSg1Uxu/hg5
 iRdIsZKOLLTkn/eyRz5fC6/OYo8u0/MarDWrv9wUYxn1EZSpeDGPTAS1kT2nNw4+D6Sc
 7Md/jcYJUARmKL0NcNx7v1KeXl9CB7g0Mj7YDDpxhjowLq37vRrYHnf1OO3pYmMum+kQ
 Pz8/yBhOcGqr0n8pByC69mEV7jvRi68Sqy8PQDgaN5vaT2CtRTTd79h2VoctKPe/Pv20
 CbKQ==
X-Gm-Message-State: AOJu0Yxtc6kuLLCn4MyMzifKvE0z5VCB+G35fb57QOmn7KVf0SKraduC
 VhMbDWCrayrdH4F3YNPiGRZWyfDTg4nuLUxKI4s=
X-Google-Smtp-Source: AGHT+IG9klWiRHQW6/osKvaIZUNQJ7+MBSXyi/c7D6NFb9byWa/oTa+iWsYrM8UzLVCZVUHkHieAaQ==
X-Received: by 2002:a05:6512:210f:b0:50b:dfdf:7b8a with SMTP id
 q15-20020a056512210f00b0050bdfdf7b8amr988775lfr.32.1701561933773; 
 Sat, 02 Dec 2023 16:05:33 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a19ad02000000b0050bc5edfa45sm826273lfc.85.2023.12.02.16.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:05:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Sun,  3 Dec 2023 03:05:27 +0300
Message-Id: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH RESEND 0/5] drm/msm: cleanup private obj handling
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

Note: I'm resending this patch series as I haven't got any feedback from
the drm core maintainers to the first patch.

While debugging one of the features in DRM/MSM I noticed that MSM
subdrivers still wrap private object access with manual modeset locking.
Since commit b962a12050a3 ("drm/atomic: integrate modeset lock with
private objects") this is no longer required, as the DRM framework
handles private objects internally. Drop these custom locks, while also
cleaning up the surrounding code.

Dmitry Baryshkov (5):
  drm/atomic: add private obj state to state dump
  drm/msm/dpu: finalise global state object
  drm/msm/dpu: drop global_state_lock
  drm/msm/mdp5: migrate SMP dumping to using atomic_print_state
  drm/msm/mdp5: drop global_state_lock

 drivers/gpu/drm/drm_atomic.c             |  9 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 14 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c |  2 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 54 +++++-------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 12 +-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h |  4 +-
 8 files changed, 31 insertions(+), 66 deletions(-)

-- 
2.39.2

