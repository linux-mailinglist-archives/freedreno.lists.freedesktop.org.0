Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BEB8C93D8
	for <lists+freedreno@lfdr.de>; Sun, 19 May 2024 10:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D84810E191;
	Sun, 19 May 2024 08:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Js90Y4tn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A75E10E15A
 for <freedreno@lists.freedesktop.org>; Sun, 19 May 2024 08:17:26 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e3b1b6e9d1so38795931fa.2
 for <freedreno@lists.freedesktop.org>; Sun, 19 May 2024 01:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716106644; x=1716711444; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OY1tAoE2mlymWOoDXQfB1tlP2MiTKhal+g+/UsJCsXA=;
 b=Js90Y4tn1aUupI47dx6Z/Aw71fskhoS8uhguPpdmNdEXMxRS8O8USCntEPoA58DcHL
 XFWncFJVaZuliMh2TUbpmBgCDGLlrI8A+3I9bhDrqa3wwFMiY8fzOGVZ4a+QghSLQYSm
 zPWTLUkGwIo/IV7c+/WLEEpNBRheDUrueqpIvfAYVeCCZNV7eVrvoQ+8sHjKhLIaQ1Kk
 az26zA+JxTT2d47P+b5US25VmayM1TsS684zEZVpi6sVEhCtSSNgZB4VikTgAVBneUd0
 5Ous/PO1hY4MkbbFksNK60AM32HoITweGrxFSwd2BnaQn32w81tXzXWv7lOYqEqx9dH3
 pniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716106644; x=1716711444;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OY1tAoE2mlymWOoDXQfB1tlP2MiTKhal+g+/UsJCsXA=;
 b=k12U0p+gxnYkeR8YUhbH6sYC/vcxUN2FEP+LbErwrrvdhe67jsAYFtTAYXn4DRX5ZX
 ubsdx76tvZT9mikO9ffu4tWY0nrbXNwfBx5jpbcTIcsyL8V23rh/UZs/cpnnCU7QuQVQ
 CqyzcSDpzLCugRvvnEv5I0OEqbYTxhP99w22TlEhJRolH8jMiJP8ibRocO7PvRXKNVmZ
 GysLD9So9uNl7JcKwTu6fbsG+djtF4sExuwVP1PVTsnBAddsqQq5qTcRSg5S3BJEcAfs
 yct5QWCAE8003x2TdHdxnpUwReHS99G5YEIym87aE1gL2N0bSw8WNEJ72t52u0tMlZ5c
 +FKA==
X-Gm-Message-State: AOJu0YyA6FW77b7FKk/GSOH8JSqNZNmnqI6DsqRbIIZ8lRvKnNG1q2fw
 or2pIDiMjpjGThl/KaSlosSPX/C0awweFuosR6uhsSz+jyAlA1R3p/Jhh44XVz8=
X-Google-Smtp-Source: AGHT+IGFrwP3piXrz221qdStLhcgrcVpAfoyUc89uo4hXSFnktBp9ITgTV/76rbjwdFws9SXEeQkoA==
X-Received: by 2002:a2e:82c4:0:b0:2d4:7292:92c0 with SMTP id
 38308e7fff4ca-2e51ff4eb20mr161610901fa.20.1716106644630; 
 Sun, 19 May 2024 01:17:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e713781c33sm4339041fa.58.2024.05.19.01.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 01:17:24 -0700 (PDT)
Date: Sun, 19 May 2024 11:17:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
 dianders@chromium.org, daniel@ffwll.ch, quic_jesszhan@quicinc.com
Subject: Re: [RFC PATCH 0/4] drm/msm: add a display mmu fault handler
Message-ID: <rx2r75crz2zeqabdxw6wkxera4pj5cf7wpkwrofbmxbyqikm7k@ys4sucbtkhlx>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, May 17, 2024 at 04:37:55PM -0700, Abhinav Kumar wrote:
> To debug display mmu faults, this series introduces a display fault
> handler similar to the gpu one.
> 
> This is only compile tested at the moment, till a suitable method
> to trigger the fault is found and see if this handler does the needful
> on the device.

You should always be able to trigger the issue by programming wrong
values to the SSPP.

> 
> Abhinav Kumar (4):
>   drm/msm: register a fault handler for display mmu faults
>   drm/msm/iommu: rename msm_fault_handler to msm_gpu_fault_handler
>   drm/msm/iommu: introduce msm_iommu_disp_new() for msm_kms
>   drm/msm: switch msm_kms to use msm_iommu_disp_new()
> 
>  drivers/gpu/drm/msm/msm_iommu.c | 34 ++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/msm_kms.c   | 27 +++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_mmu.h   |  1 +
>  3 files changed, 58 insertions(+), 4 deletions(-)
> 
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry
