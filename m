Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A15F93AB571
	for <lists+freedreno@lfdr.de>; Thu, 17 Jun 2021 16:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDFC6E8BC;
	Thu, 17 Jun 2021 14:09:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B82F6E89D
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jun 2021 14:09:12 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id d2so9188518ljj.11
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jun 2021 07:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OcvYXvvlVYeL9756xuKyQfsfVibJtIpmm8tnGhiSsFo=;
 b=KhZep3BslUxz+3xsZvo6Z/Yyk3DmRKr+i0q6JZgu+dnIuQT/ITq7o4Z/9QgnEDTrc5
 hSYuosp6Get0mB/weYIj9TWmKOWqLFVo1/ytl4p+WKZsD8w8reI1pvfCZ9KuScZd9aZd
 xyS6o43Z/BkVF5h+1hdrjP9a7Ktp7Ga8kjfLsU5dRGsPQPN4DQ5SsIVGFU6BAD4qIhJ+
 UE8Bz97L8zmVmiaKAX4MmqEAMfWt5I4x1eIpXmVjgzaNxAEq0Y2OEcBQl+v3ZdoKRZz7
 ber3gW3L6fPLXUUK8NWEgWcKLCiyF6QOtiK42PkGwRjI/r6RZG189iZzdlxYZQZQdy28
 +GyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OcvYXvvlVYeL9756xuKyQfsfVibJtIpmm8tnGhiSsFo=;
 b=jDjX8l7llsqrmQjVN+Uw1pUKRYN6QiWq4iQseqMJwHMUa20gjhtiYpLah+5Ve1FyYj
 RJTCXqCubYL5pTwAJ7gaeF37qZifnKcwuoD/m9ZGAuew/b0Qt33hNISBKfQGc0TcRomZ
 yndOweR80lqTqFkwAkkBCrqf7fxmiDAX9oCNpPR6QPYNIJoxNj0xtsRi4/1goo2RRdJN
 BW9ZzaDtjAH0AHmUk1WVY4xQPc+Zkk5gCAJY+mnLy7z5S/Fgaqj6nOZ+KL0g+WsBDLur
 ss89Zh/G6Xj4RKxkH74UG08YOlMPWYDUwDOiTzxYUCQb8mQ60Tp9tHEXyiY3iC9AMhZA
 RHvA==
X-Gm-Message-State: AOAM5326wqbgdmYQIBwiFysWnfOSEP6oeDwFSRt9s3mp6bBYkyDuMvS0
 rnOp6eMB64C14y2gWw2+sqaZZw==
X-Google-Smtp-Source: ABdhPJwcQUwrzzHgbibZIWWeJayKD33olGUt8NtQnYHgCsSgRXDc0XEtM2RhUEw060syZVDBe926tQ==
X-Received: by 2002:a2e:9cc3:: with SMTP id g3mr4819609ljj.366.1623938950459; 
 Thu, 17 Jun 2021 07:09:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f23sm592471lfm.128.2021.06.17.07.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 07:09:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu, 17 Jun 2021 17:09:01 +0300
Message-Id: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/7] drm/msm/dpu: merge dpu_core_irq into
 dpu_hw_interrupts
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

This patch series reworks DPU's irq handling code by merging
dpu_core_irq into dpu_hw_intr, reworking/dropping irq-related helpers
and wrappers, etc.

Dependencies: https://lore.kernel.org/linux-arm-msm/20210611170003.3539059-1-bjorn.andersson@linaro.org/

----------------------------------------------------------------
Dmitry Baryshkov (7):
      drm/msm/dpu: squash dpu_core_irq into dpu_hw_interrupts
      drm/msm/dpu: don't clear IRQ register twice
      drm/msm/dpu: merge struct dpu_irq into struct dpu_hw_intr
      drm/msm/dpu: hide struct dpu_irq_callback
      drm/msm/dpu: remove extra wrappers around dpu_core_irq
      drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
      drm/msm/dpu: remove struct dpu_encoder_irq and enum dpu_intr_idx

 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c       | 256 -----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 111 ++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  66 +----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  99 +++----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  56 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 306 ++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  92 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  27 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  25 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  49 ++--
 12 files changed, 383 insertions(+), 735 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
