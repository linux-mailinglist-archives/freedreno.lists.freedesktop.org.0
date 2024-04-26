Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635C98B3F76
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 20:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B0510E489;
	Fri, 26 Apr 2024 18:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vYMqJX2h";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0291910E489
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 18:38:26 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-de45dba157cso2448488276.3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 11:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714156706; x=1714761506; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LCD0O0mksG8o2F+MvGZO/EX3h5H/t77oNaw9Qg2ltc8=;
 b=vYMqJX2hSr0cyajHiI877yjx+KPzmP3riRw/c9Ebe/LTG+cGWNio3BUTEhKCqAar+M
 lmg0fcEOIzSj2InFNH2qKjTthVKLrW1Kj8TJ9kItYzKxSMB9TuH1L+iNV+yRDWBsqIcd
 jGb7oV17yjmB97bIXxgxdQ/z8hk+JU9gBjgeX6Nf9JOfz4frGB7rNELT4F0DjBnuO/d1
 vRTQCJC6x2QKa77qLtXJZbaG+upyQte1gvZl37UioeTuJ0DF66DrX6E2Puzf1LtOIVEh
 KZO/8fzf14gqh58SLivxkHTgvkZr7DqwHCUE9BzxG3grvvSWx72rPIUT6KLJwCf0iWLJ
 7wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714156706; x=1714761506;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LCD0O0mksG8o2F+MvGZO/EX3h5H/t77oNaw9Qg2ltc8=;
 b=o0XMDwg0NkM69f3hhSTB9cyER5IjUOYYMig5M45wf+f03OvpC2f8CEkSm0q+gTeTjs
 s1FIdIbDYYTnI7EtkWdixyEMPYK/vnqYjC0x3QSWFssvcQF4dclESrmiWMDGE2ulDney
 7s5uq19n+Ty3do8ft3+SQyNWRcLFVHPblJfntGvvyuaZTWDgxxVEBAN0PCMLd3aZTU67
 XjhVL2el48JYrqMuID/8OYKeLxnVDm0XVH4bRCWMZUL5U4TwXv+U6GqEl6RW2Zq0RTDv
 Vu6sS7WXcr6GRwgxJkqhZBdFLcw5t15paDiKxEYRrIxEkSt3JCLIOYq1gx/ORKVxGFyW
 ztBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlj0uGqoO2RNt+S+etGKoO8ah7WijZK2PvZ5xY1Gs+pvq1Cxbo2mx8rKaTNPPdKiaLIffPdwmuckupIW0hFUYxKt6CeWSUXChTxIu8qTxZ
X-Gm-Message-State: AOJu0YzdIIfak8Go4Vd5YU7FDf7SNoqgATKyC9PVaW7u0eSoth/zASD3
 t6K8J7bDIx2SDLUKjaerTf5xpBMS6fa6PD21gGrjqG899YL7m1nN6eDuhRNG3f3G+r6LKXnOPZE
 ZStHrVPYshpRSsoMZzynki5ca555e5+Zuo8ZGCg==
X-Google-Smtp-Source: AGHT+IFAGdtoxtMF2BQTf0jLN/bVVJboZUORk+tAcFQhd1qw6HVqAVGEQ/MHq4a2scbHXirClF7DoJbhhB5lfiXMorc=
X-Received: by 2002:a25:ce8f:0:b0:de4:8b7:7bbd with SMTP id
 x137-20020a25ce8f000000b00de408b77bbdmr4064532ybe.15.1714156705913; Fri, 26
 Apr 2024 11:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
 <20240426-a750-raytracing-v2-2-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-2-562ac9866d63@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 21:38:15 +0300
Message-ID: <CAA8EJppF_Xhv_itPOAwbeey0Fh-V=Wd5SoOxNmGZpOUjYkLgNw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] firmware: qcom_scm: Add gpu_init_regs call
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org
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

On Fri, 26 Apr 2024 at 21:34, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> This will used by drm/msm.

Can we have some description please?

>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 14 ++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |  3 +++
>  include/linux/firmware/qcom/qcom_scm.h | 23 +++++++++++++++++++++++
>  3 files changed, 40 insertions(+)
>

With the commit message improved:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
