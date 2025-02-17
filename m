Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79138A38CBD
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 20:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB6110E5C4;
	Mon, 17 Feb 2025 19:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wIyf3fGW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17CE10E5CC
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 19:51:16 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30613802a59so48925611fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739821875; x=1740426675; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YPHMiuUpbPXEyFU02G5OaxZJl5M9o+dz3xvjVDfgoLI=;
 b=wIyf3fGWi8kmDKKtAiR5XQNSE2lh8fmzov1VOoqR4XCCAWiX3FOJzRF8WyIc0h0Row
 0wmCa3kkG4lcdpil+SM5y4P0BcWZpI3qcjdegoRXopBwhTmK6LQiztSWHxo4V1dbTk1I
 Ybv0Xchvhx6q/2ItC16MiIxwhSk9NuVFZMkRKt8aHXqXV4R1yM1TekdR1kbLmBcC5sNI
 qyiZmAy4u37apbueJUPGfmDKKtI/Ab1DTybUoK3SnA1zVaL4z2J4hojXkh2ZTm9hmDcH
 +C2JcPaGVFvSEeG3UD37gpZsHkcGDa9JT0sxeDCol3OOhBkdUmR4UWIDjp0ot+drCn4D
 WAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739821875; x=1740426675;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPHMiuUpbPXEyFU02G5OaxZJl5M9o+dz3xvjVDfgoLI=;
 b=GpiRdfFED5XZxjPFIvtcXxmiNhkNze9KGCuOBN8jNp8B8vu6bN+nRAegyZTtT751Y9
 BnuGiRBtwm8xqyB0ljXHB0dIXE5r/nDC+E8v08QyjY/ZKZF9qzkdsP9HMeddpJx0fgn6
 ybbaWSSFHemSHiosuj2jjlHFWzHgM/P80i4XMaWf7tkQrnWXhAJ1J9xuyEN5UD8gj2MZ
 6Z8eQFW78rzW5BnYxh/mX2NF6o3t4RqlGk1apiZLq1nnhcmrvkzvGmVLVJ4qzCgTgDDO
 HkKRSmnVJ9ReEqARgXEJg4m1QMQpft5kpSFZExKkDzUSSM4scv+UxSDEFLZgoUYGbXdI
 sSHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcmi/ThUPUQ4Z2DaWbsLtf3yaLq6+/4VlP5g4HUIZOuvBmSFzLsgWEw4s/0FaXlWEaf2wbY8bHoY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzhmoz15NdzrRIyz5+llhrxJwMK6sqWP7wLdmyu5kEfWLllZ8FB
 Zw5HC7V0nbqunIaj2vIPE5q7/G/kLF15F1A7ZcY4oVBmmxbA8UNWa/TCgNsBK00=
X-Gm-Gg: ASbGnctZru9RgoDoJP7+Qyanb0Do/3IEscbhgWzEM9fNBwqCvSpJKOTLApxOnpjAleB
 V/ru//LkFpJvEB/7DYS7Rs/Q8572wBSr542VCSvYArWojqR4zI0T7e5mEu+GMjsE4VzhNGyskSM
 NH1sjCE0vAx/0LrlLyyaL1US4mCJng0U1OsaPHXbXfxyj/Rc2NDK66aHgVk2E7gNEWpLKbh6ZLB
 tq5y032g+qh9+iSfY9bgajDzWUdcjhctCPqeO/5JF+k41ajkz3SUTa3rXEsHQ+sMi5ciuCriRaJ
 gIfwhNXacpLiRNK8nGaDiKTxssX0IhUaiv/uJVOcFmLhmylriI6vz31hm2Y9A+bq6H+kRGY=
X-Google-Smtp-Source: AGHT+IEQoBP7xS27h3W8daUCOs5a+K/MVyTg+zctUJ3ISgMlaM5H7WG6g1V94qDglsRK691P9WX9Tw==
X-Received: by 2002:a2e:8ed5:0:b0:308:ec6f:7022 with SMTP id
 38308e7fff4ca-30927a630aemr30983201fa.17.1739821875240; 
 Mon, 17 Feb 2025 11:51:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309cec7e45asm8598171fa.105.2025.02.17.11.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:51:14 -0800 (PST)
Date: Mon, 17 Feb 2025 21:51:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/15] drm/msm/dpu: polish log for resource allocation
Message-ID: <elx2yudvkpnrxu4q7uqm7wrhfryhd7mcmnuh3ktmtkor6sjmke@4ptbzra2k3a7>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-4-c11402574367@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-4-c11402574367@linaro.org>
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

On Mon, Feb 17, 2025 at 10:15:53PM +0800, Jun Nie wrote:
> It is more likely that resource allocation may fail in complex usage
> case, such as quad-pipe case, than existing usage cases.
> A resource type ID is printed on failure in the current implementation,
> but the raw ID number is not explicit enough to help easily understand
> which resource caused the failure, so add a table to match the type ID
> to an human readable resource name and use it in the error print.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
