Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A147C69EB
	for <lists+freedreno@lfdr.de>; Thu, 12 Oct 2023 11:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EC710E47F;
	Thu, 12 Oct 2023 09:44:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F8D10E47F
 for <freedreno@lists.freedesktop.org>; Thu, 12 Oct 2023 09:44:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40572aeb73cso8132405e9.3
 for <freedreno@lists.freedesktop.org>; Thu, 12 Oct 2023 02:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697103865; x=1697708665; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fqhCmP2SlmfFIHRs8qmFYFrJ9atQX6zLvZhkxsOKxY0=;
 b=BfaReNh1WWfXWCv3jQGVeG+avWyVKqTyqbmrLGQIGZq3z3PYSrSvx+mxt4LJ+ufGBV
 OYTWvakHmC2htMjmfp2gcPfJuP6zRT60uzcefYDG5SwXB1fT0PYrQoYgH/64P40SYp4b
 Uficdosq1M9grPClNY1JXTKKLk4p/33ghzQnt5kE4aHCA1ZTzVU8IVys2WbMxXsrtaAM
 gUYQmYQEv598OY6Y9zKE4hvke2EdBDWL34Eg+3EUtyCtkl6f9aERIZidFgwzYXuFVVh2
 CPK8JcVV9GYpvy2U9ELRMaIJm6XMuxnyO6NRRWgLuG41Fsto4wHpe5Ahn14sUG32+Iz1
 emfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697103865; x=1697708665;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fqhCmP2SlmfFIHRs8qmFYFrJ9atQX6zLvZhkxsOKxY0=;
 b=pmPCYGP8UsBxps8aKPvHEsrJNrd1MIq1HtXqn56uSFQAld5k24atxzEBsdE/yDcpia
 bzuh3/ZuJU/+WRvA/dcfQsEoh4SFXc9FgjJZTss74tlIHsEUOm+/8ygy/kUbRmujVLQK
 JIOfYabdNXo6HGD5Q3jkXeXf4hxdDErqIV2PYZk8hbfpDo/fyBJlck53w8H4SM/2fbMF
 q8wsl7wRvUNJIIIj40DL8kaWGjQxJrCGRiWeB/inthXTLYWS7Duzvi86jp6Zlu+frc8j
 YMC7OOzzRZ4+EcSis4NWpCzWlJMZ39XeNQnmneJhkrNuSKgwiY6JastIHiVBc8ELOkxp
 MxmQ==
X-Gm-Message-State: AOJu0YwrYfnsDt247PYpHJR43f6ad54gXo0BrJzeMeDFkb5ODDnpmA2t
 r1+MDpcloHs4ZkrGl4KmfEUqdn7D9BzCc2AOHOg=
X-Google-Smtp-Source: AGHT+IH/+h8quguDVJLncrUGgEQJ/Wjn7CCeOsdkUo99F3aL9gIAOK/4SrZIe311jDPUJjXHpQe/9A==
X-Received: by 2002:adf:e582:0:b0:322:5251:d787 with SMTP id
 l2-20020adfe582000000b003225251d787mr19131824wrm.64.1697103864781; 
 Thu, 12 Oct 2023 02:44:24 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 e3-20020a056000194300b0031f82743e25sm17835951wry.67.2023.10.12.02.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 02:44:24 -0700 (PDT)
Date: Thu, 12 Oct 2023 12:44:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: dmitry.baryshkov@linaro.org
Message-ID: <e4a9ea85-0cd7-421d-8540-1d9a82132aac@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Freedreno] [bug report] drm/msm/dpu: shift IRQ indices by 1
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

Hello Dmitry Baryshkov,

The patch f35fe63fcf14: "drm/msm/dpu: shift IRQ indices by 1" from
Aug 2, 2023 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:371 dpu_encoder_helper_wait_for_irq()
	warn: unsigned 'irq_idx' is never less than zero.

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
    349 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
    350                 unsigned int irq_idx,
                        ^^^^^^^^^^^^^^^^^^^^
The patch makes this unsigned

    351                 void (*func)(void *arg),
    352                 struct dpu_encoder_wait_info *wait_info)
    353 {
    354         u32 irq_status;
    355         int ret;
    356 
    357         if (!wait_info) {
    358                 DPU_ERROR("invalid params\n");
    359                 return -EINVAL;
    360         }
    361         /* note: do master / slave checking outside */
    362 
    363         /* return EWOULDBLOCK since we know the wait isn't necessary */
    364         if (phys_enc->enable_state == DPU_ENC_DISABLED) {
    365                 DRM_ERROR("encoder is disabled id=%u, callback=%ps, IRQ=[%d, %d]\n",
    366                           DRMID(phys_enc->parent), func,
    367                           DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
    368                 return -EWOULDBLOCK;
    369         }
    370 
--> 371         if (irq_idx < 0) {
                    ^^^^^^^^^^^
It looks like this can be safely removed

    372                 DRM_DEBUG_KMS("skip irq wait id=%u, callback=%ps\n",
    373                               DRMID(phys_enc->parent), func);
    374                 return 0;
    375         }
    376 

regards,
dan carpenter
