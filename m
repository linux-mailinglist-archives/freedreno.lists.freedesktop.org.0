Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6A08044EB
	for <lists+freedreno@lfdr.de>; Tue,  5 Dec 2023 03:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB38510E466;
	Tue,  5 Dec 2023 02:31:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFB110E466
 for <freedreno@lists.freedesktop.org>; Tue,  5 Dec 2023 02:31:53 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50bf1e32571so2434232e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 04 Dec 2023 18:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701743512; x=1702348312; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DbHE9BPTRIRsV88TvG0gZTWaeA9wHAPMM62YddZwnZA=;
 b=m97LchrLpq39+WPJzTrp5U8+dliIwaisROipTwGcaJTMopu5q6a4EkVFWDo6y5ND8+
 VyGhPj6Xa5sb+uxGR+kv6uwDzLTBsqvSWkKNrmbE3NyNpQz4/JHVASMQm+spkCzk1wZ0
 szbKYITiFizBmNJ9E+1+IIj5j48W98zOQqt8WznGEwPZPAnEoNKpIg5x7ok0H4JSyBzY
 JSOiV/zAiHNwDx8vz0LZWozIIQOoIvz0LnwuqzFan1JyhUCqPb/4dWuOKnGp2ySuisNo
 V/g/7kjIJtpdruGFWDKLZmAxKSRe8uy5cX53QjDG2/e8rCXa9cjSrYF/cNY3KqxnbC7G
 Uo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701743512; x=1702348312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DbHE9BPTRIRsV88TvG0gZTWaeA9wHAPMM62YddZwnZA=;
 b=lw0HRpI/bFWIO1Iv7Lofm7n6vNXGGJEMFpIKIi3memoZ7iJUGBXoO9CTf6y3GnPaNU
 E+3vrrcQn0y8Tz8LGrWZBJepemOIN8MXj+SRGVooC5tC9pFYDPDk0zZhrMC2pnE/k/p6
 lQAy/x0XFjsranuP08zM68wQdoU/beLL25g+L1v0Yq3bI9Dx2UeXGaDRCmE8j7SJRGDX
 7rVdo5eGrE78marXb6azkpgQUuAHREWK06xH93Nr9KEIl2Ru1rHaQn1xjwvSFJgtCs6Y
 Zw8IaXwHHf4/lqKR5dam6vFXKXGSaoL6CutFcTFRYgBrCyb6TLRWvX5NSyzURZwN0AQT
 wrYg==
X-Gm-Message-State: AOJu0YyRwWKSfr8xFM32EeeygsSOxtPJKttqFNj2SFhcok4oWXSFcqYd
 H4cYA2wkfITln5p6ykhT/YtqXA==
X-Google-Smtp-Source: AGHT+IHj4RrgA3yIRfjkHr/FC4YWFuT0bc/fAnNvvSdZ66FbSu+DwF4JqrgODiqGTpqRbe66VifBVg==
X-Received: by 2002:a05:6512:3ba0:b0:50b:fe77:196c with SMTP id
 g32-20020a0565123ba000b0050bfe77196cmr1069018lfv.27.1701743511658; 
 Mon, 04 Dec 2023 18:31:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t10-20020ac24c0a000000b0050bc57ec288sm1414726lfq.44.2023.12.04.18.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 18:31:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Date: Tue,  5 Dec 2023 05:31:48 +0300
Message-Id: <20231205023150.1581875-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/2] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
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

The function drm_atomic_helper_check_wb_encoder_state() doesn't use
drm_encoder for anything sensible. Internally it checks
drm_writeback_connector's state. Thus it makes sense to let this
function accept drm_writeback_connector object and the drm_atomic_state
and rename it to drm_atomic_helper_check_wb_connector_state().

Maxime suggested that the function should take drm_connector, but I
think that drm_writeback_connector is more appropriate, following the
purpose of the function.

Changes since v1:
- Make the function accept drm_writeback_connector and drm_atomic_state
  (Maxime)
- Added a patch for VKMS to move atomic_check of WB path from encoder to
  connector helpers.

Dmitry Baryshkov (2):
  drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
  drm/vkms: move wb's atomic_check from encoder to connector

 drivers/gpu/drm/drm_atomic_helper.c   | 16 +++++++++-------
 drivers/gpu/drm/vkms/vkms_writeback.c | 27 +++++++++++++++++----------
 include/drm/drm_atomic_helper.h       |  5 ++---
 3 files changed, 28 insertions(+), 20 deletions(-)

-- 
2.39.2

