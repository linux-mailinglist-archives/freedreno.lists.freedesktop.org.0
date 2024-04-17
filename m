Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AA78A82A0
	for <lists+freedreno@lfdr.de>; Wed, 17 Apr 2024 13:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B8310EF0E;
	Wed, 17 Apr 2024 11:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cs0kGE4J";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1FD10F179
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 11:58:50 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc236729a2bso5256922276.0
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 04:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713355129; x=1713959929; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XOPPymOpNWV4lEvf0/qp/BaWhSNyYN4sXc1brxkavt8=;
 b=cs0kGE4JUMw5JAyRugVNIzcBxnm4H7YTtdwmJBV+VfIH0Lt1gCn7f137WrjJyO4iRZ
 mjznvuiHKnE5J/5NF1VTAk1AClJchAKyq00wzasMHYaQLc8pZNrowGua7RDn61Ff/y5p
 uxqX5g8fhTrwvx7/k3/Twdbw7B6hWuD6RDsVEp9Sq7JL0JdjcAHnuZY1QblZAkYtDrLm
 tQ3TahG0VSFW4KtTkBZV9V7fqxQGoyHV5X4GuFFevEfyMllRrzZVxswmeF2DajV64ibi
 s4RPhRhCFD2hII6EaJ8QjTNAF+gSIotU463cRbGrHl/LCQxxtJRirB4k1P6Ww0KeehDB
 Livg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713355129; x=1713959929;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XOPPymOpNWV4lEvf0/qp/BaWhSNyYN4sXc1brxkavt8=;
 b=rKN9DMg98EzLRtBMbg8zdH3x3DyBjxUILgxSUw0PhCYLSMPARCID3JLbrCah1OEJAl
 RTNThkjIsqM8SeuSsfHd0AwDfJDeJ38/7LW7JTnFebqM7M9PwhCfEC5uFSxFsHy7kZPJ
 SpBIHrWudVkiKWYubriO7h5Myt6kNGE6Rwykjg5hxXPEECZX1Z4nNQaqpRvK8fujVHjQ
 DgZO25oDd1XSZDrhgdHxh63LwzYsl3govidl/Bk3wUEIHJY7Qhaioq3Kg0ZRByfNFZIR
 RFCaMh0igFbuxLJGhzqmCtiWy+ykNeVJ97LExwOcr2ATfqEN3S/AXWg0vEiKm3Dh5lUf
 eiVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZR/SgEaJeYOe68P/a7jKAJ7IOmdO/npJxZrNSH1tkr8CixVUmdsDMtPwDUY7v3qfeb55rC5MNzfF1Cf27vu49/a6WHMnUB+hDItmaRegQ
X-Gm-Message-State: AOJu0YyHmclhdICcU43swKUNHsxSuL7pDVc8nPSEMQkptsuuCVH/ZSmW
 sBWQR+fZCzZJnIxAFYO4x8cMN4CikviomWQh+kB5uNbrqZpCn1lugHd6X3eAY8bHCpYG9/0jaqm
 Qxll5LWmdJx+deroTO8t4G29XhQ6f0TDncYfCuQ==
X-Google-Smtp-Source: AGHT+IGWuoBVMJIXjsmFPRcV8rj/qKuosgGA9fD35ftEBu5XLin6FbbgQbGoS5rFLXogGwGfuH4+cF7K3SUTk2qEnlk=
X-Received: by 2002:a05:6902:1345:b0:dcd:aee6:fa9 with SMTP id
 g5-20020a056902134500b00dcdaee60fa9mr15751750ybu.53.1713355129449; Wed, 17
 Apr 2024 04:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-3-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-3-78ae3ee9a697@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:58:38 +0300
Message-ID: <CAA8EJpoOMUbhqX2hcfCmU9+qr313naYi1d-rsUOqRuwaRC=3kQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/msm/dpu: Always flush the slave INTF on the CTL
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Vinod Koul <vkoul@kernel.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> As we can clearly see in a downstream kernel [1], flushing the slave INTF
> is skipped /only if/ the PPSPLIT topology is active.
>
> However, when DPU was originally submitted to mainline PPSPLIT was no
> longer part of it (seems to have been ripped out before submission), but
> this clause was incorrectly ported from the original SDE driver.  Given
> that there is no support for PPSPLIT (currently), flushing the slave
> INTF should /never/ be skipped (as the `if (ppsplit && !master) goto
> skip;` clause downstream never becomes true).
>
> [1]: https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.4.r1-rel/msm/sde/sde_encoder_phys_cmd.c?ref_type=heads#L1131-1139
>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 ---
>  1 file changed, 3 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
