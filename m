Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0C89A4E19
	for <lists+freedreno@lfdr.de>; Sat, 19 Oct 2024 15:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC5E10E258;
	Sat, 19 Oct 2024 13:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tQ6dVtWF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4585310E258
 for <freedreno@lists.freedesktop.org>; Sat, 19 Oct 2024 13:14:19 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb5a9c7420so30341431fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 19 Oct 2024 06:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729343657; x=1729948457; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DsxiJAaLUxZ8WyINPgvN9VPitcA+1/D6dK458s/cN50=;
 b=tQ6dVtWFlDiifLXaVhRmqy75wdVX6y6oQxY0aQOdI321r+807ScS1/s01vqNCQA6Bw
 PAs5L6m0ltwYRbcJxitXltUEGDFtCyH3OPyUExyVSYbt0QjmG4ED89Y6yHiROevQBU8K
 qXkEnwugfyquvcmoqLQCbJmEdRkSZjKD3MsY/L7aefvN5TTqUi/nFs/c+M8YbAn6Rcz9
 1gOMJNTwKWN6n9kUMK8wYY4rxDsE+cS02Me1i8th5wjt1F72ekutf40BTWzZPHsyofCB
 RuziivmSAr5vMb6VrQNsWRdJN1MSXAtDqLKtct87KT/Cz6WYhu28Av5zkhSNFD3swLxM
 84Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729343657; x=1729948457;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DsxiJAaLUxZ8WyINPgvN9VPitcA+1/D6dK458s/cN50=;
 b=QHQJfm5qRXuE36XPIS0Ui/zMtyu8+65bE+pfXPF6Kz9YMDn0DWrDq6E0kl7jlBcqV+
 EN14pfSQK1YAoVEvYd5j4Z1QqfBMm4xFQH5lTDod6ruYLAuJCvD9oVcB/YrPD3b/w+up
 iDR4/T+1HLmvlYUNr7QN80wBv0sWTumRGGA0Cy81br1NwNFwzoxiqiXtA5ae/43QaeDO
 ARbW8gY0rpQ+ZfrH6O2fvUwPWhIE+3X72HK+IsiC6pZdjhKbofnhx0aGXPyNDZw5vvCk
 o1ideoRloT+8GNyvRR1lN2dNNXaQcnybLX7im38hSKZRlPmkRVYM25p4RktAq60pyfX0
 L01A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnHTMyBzReGMHqr2x71AhATuxbW5f+SD0bTdTlLhLfCOtVH7gITsxKCGwoDET9t1Av6Zcf+oP+Sug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy71EefPje4ss/WB//mloE2BkgvWA+ZDEKmWf0WAKeMRk+HRFwz
 A/UtNYY/pcFf9n0X6Z/QcIRWzpiCQs0Uu2dXo/Yt+iKLwz1Ulst+vnur9nVhUOw=
X-Google-Smtp-Source: AGHT+IEjv+MXakpefCsgi5HLZxPHwYDurtx/yD0nuWtCXMQYx9C38W3JKkkERUExxV4d2KBsbM6yEQ==
X-Received: by 2002:a2e:e01:0:b0:2fa:cdd1:4f16 with SMTP id
 38308e7fff4ca-2fb82ea761bmr22402471fa.14.1729343657256; 
 Sat, 19 Oct 2024 06:14:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb80712069sm5028321fa.0.2024.10.19.06.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 06:14:15 -0700 (PDT)
Date: Sat, 19 Oct 2024 16:14:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] drm: a6xx: avoid excessive stack usage
Message-ID: <k42wmgziqia6balqsrfualbg73giesjxxtyaldkxsrdxkro2li@6neybqsu27me>
References: <20241018151143.3543939-1-arnd@kernel.org>
 <20241019093146.kdp25pir5onjmg4g@hu-akhilpo-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019093146.kdp25pir5onjmg4g@hu-akhilpo-hyd.qualcomm.com>
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

On Sat, Oct 19, 2024 at 03:01:46PM +0530, Akhil P Oommen wrote:
> On Fri, Oct 18, 2024 at 03:11:38PM +0000, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > Clang-19 and above sometimes end up with multiple copies of the large
> > a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> > a6xx_hfi_send_bw_table() calls a number of device specific functions to
> > fill the structure, but these create another copy of the structure on
> > the stack which gets copied to the first.
> > 
> > If the functions get inlined, that busts the warning limit:
> > 
> > drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
> 
> Why does this warning says that the limit is 1024? 1024 bytes is too small, isn't it?

Kernel stacks are expected to be space limited, so 1024 is a logical
limit for a single function.


-- 
With best wishes
Dmitry
