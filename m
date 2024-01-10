Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D60C82A06C
	for <lists+freedreno@lfdr.de>; Wed, 10 Jan 2024 19:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4920A10E649;
	Wed, 10 Jan 2024 18:51:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF16C10E649
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jan 2024 18:51:42 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso3939050f8f.0
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jan 2024 10:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704912701; x=1705517501; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KImknwHCfjo7defOTxMC7icEA/WDtqN8J+Tjv7MpnmA=;
 b=KOMUcwvi9yYp2WN2c5GxvMb71mhXs0LCcwulIazzf7FhsfA2aqqD8R51jo8lzVH/Vq
 rPiwUbWEkdOGpFnw9xAJCAmwDg5WIatB+law3DfTICkk4jlTyAiTiPByOSdnkQz9Ta9V
 lTgv8mMlDlQPpjrlMQ8PPsbSmCIh6f6SRGqYVqOMhXhJ7/JQMCKOMr+gM/69fU9r/HSi
 uYxy7WfeBs7vkNWFPaFlamBoZSAtiFwqS+xjK5mzEex4pIM3A4erlN/yFBOoH46Hn8QP
 xzLKMdq683N+ERdtVk4KVRTiFB1ndC+HbxK6Z79AVemcY7mocsbYsvPlpW3DPB9GZe4c
 5CIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704912701; x=1705517501;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KImknwHCfjo7defOTxMC7icEA/WDtqN8J+Tjv7MpnmA=;
 b=Ytjr/s9SpRboZAV/H2n/lGCr1W8hykx+Ll39dX/EVy0FkrKP9i4Xd113X1ITT/D5kj
 tRp87rwCPUKQ2SkTWI8+Y1A6MC9M+tQjaZ3bwVE9ajfuPpEXWE9k8Aqy/e1bk9iBZF+A
 9vC6eSSAb9/Q4CpgKgt/VexB2GZmpQ/wuIsMzx1elYH8yHvR3uajFrIn4/dM8cjtRrif
 oeIfygbHX0ocn1mo3bEM5nj1cyoc7fbs3ZFiJSrXoL6b/PaZQ9Tg5DOaDfQ4n1S45VQN
 qehbIe1AMjmXTEFGxD+NlRQGOw21nZyH2zglugqsZ41pIaSYAVByIsxeXdMfApw3I/hG
 wdzw==
X-Gm-Message-State: AOJu0YyWXQk9eW7AiVDXZb+I8sYiMdk8KFn2w/7U5qnZHWqbwVsFbHGQ
 Us5lkaFfW60JLCmFJdmzkatUhpQb5Zv77g==
X-Google-Smtp-Source: AGHT+IHfyiVRoGTSvtJFLxkAy/q/yVE6UqVCSeHD5wD2LmUM0UAGw2/l+aMuKRFd99oOf6oiLsACaQ==
X-Received: by 2002:adf:f04c:0:b0:337:400c:eb75 with SMTP id
 t12-20020adff04c000000b00337400ceb75mr932847wro.94.1704912701125; 
 Wed, 10 Jan 2024 10:51:41 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 l4-20020a5d4804000000b0033718210dd3sm5483675wrq.103.2024.01.10.10.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 10:51:40 -0800 (PST)
Date: Wed, 10 Jan 2024 21:51:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: quic_abhinavk@quicinc.com
Subject: [bug report] drm/msm/dpu: reserve cdm blocks for writeback in case
 of YUV output
Message-ID: <988e47ba-dce5-4014-b5b0-ff3f89a9b0db@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hello Abhinav Kumar,

This is a semi-automatic email about new static checker warnings.

The patch 8b45a26f2ba9: "drm/msm/dpu: reserve cdm blocks for
writeback in case of YUV output" from Dec 12, 2023, leads to the
following Smatch complaint:

    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2084 dpu_encoder_helper_phys_cleanup()
    warn: variable dereferenced before check 'phys_enc->hw_pp' (see line 2075)

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
  2074		/* reset the merge 3D HW block */
  2075		if (phys_enc->hw_pp->merge_3d) {
                    ^^^^^^^^^^^^^^^
The existing code assumed that phys_enc->hw_pp is vald.

  2076			phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
  2077					BLEND_3D_NONE);
  2078			if (phys_enc->hw_ctl->ops.update_pending_flush_merge_3d)
  2079				phys_enc->hw_ctl->ops.update_pending_flush_merge_3d(ctl,
  2080						phys_enc->hw_pp->merge_3d->idx);
  2081		}
  2082	
  2083		if (phys_enc->hw_cdm) {
  2084			if (phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp)
                                                                       ^^^^^^^^^^^^^^^
But the patch assumes it can be NULL.

  2085				phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
  2086									PINGPONG_NONE);

regards,
dan carpenter
