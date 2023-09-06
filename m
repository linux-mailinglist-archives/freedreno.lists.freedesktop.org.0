Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F297945EF
	for <lists+freedreno@lfdr.de>; Thu,  7 Sep 2023 00:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B622B10E02C;
	Wed,  6 Sep 2023 22:04:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DD210E72A
 for <freedreno@lists.freedesktop.org>; Wed,  6 Sep 2023 22:04:58 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-501be2d45e0so418203e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 06 Sep 2023 15:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694037897; x=1694642697;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=K/a1TmtmamqPXEdUE0Z+t8otjGm5SU4KAy0PSuw4Hus=;
 b=asZHB0r6rDZ36W5k4Kq+Ld8UdjTobnN4acvxuD7alixIG0zyfaDqX1c1tC7/nhlEhU
 MJm8TAc/UG6gvylDNMeQ+1GlvqBXmpEfanttesWF2FAj9BXtFF30ALxR/YkHAiSAsaw6
 uYPEs6YvOEhWEz0ow8WmwxsuxH60aJGArwnrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694037897; x=1694642697;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/a1TmtmamqPXEdUE0Z+t8otjGm5SU4KAy0PSuw4Hus=;
 b=c/E9nqvBajn5NcnjnmrNnWROCq+yb9sRAbs6JFXab5EOrB+TDNF3IWQ8HmNEM0jcFV
 u1apg35y9XUavdWGH6C5JzIrae40PMJyhzcQsX9JueF0uD3WiI+WzbNJGjxzHMLiZwum
 eZGkE3WXzEDhHlSp3Z3rO4GzlH1PMfK0E8A+mLXrqHV03h1ed7eRJGkw6hHokAAs2fgr
 AEj0yBq3W0kfzGr1Iiyy5wQR9RxzD5jS8iLEstR6HOehVluYj9M2ORBPpwNWOxm7w6X2
 5EBbatxoQn3vgL4MnShn+QrpdGOpMc93SpAd7IETyUI2hGYyJvoAdNT5Vi3MfcQj+Xx0
 pl5g==
X-Gm-Message-State: AOJu0Yy9iSIoU4wTi9+9UNj6iIJz1Y7aVXS0ZBWJ4jw9UjUAIBo0rwYS
 Jqd/tt/3gaaF8ufVIRH0cFg82ivuKuk7FrGYbXaF6Q==
X-Google-Smtp-Source: AGHT+IHaZD0sJC8YRqHnLX/pEEe+4RFI3T0inoGPucjNFb+Bar11rJv2jpxoWR4VYrsfsmzf1TRv2xDZPFbvAJKg4+0=
X-Received: by 2002:a19:4342:0:b0:500:79a9:d714 with SMTP id
 m2-20020a194342000000b0050079a9d714mr2776490lfj.65.1694037896915; Wed, 06 Sep
 2023 15:04:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:04:56 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-7-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 17:04:56 -0500
Message-ID: <CAE-0n53JeHYLNneAzdDfUU7c05F8ZZw69F-Gq5wVeWZ96_UExg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 6/8] drm/msm/dpu: drop DPU_INTF_TE
 feature flag
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 19:04:52)
> Replace the only user of the DPU_INTF_TE feature flag with the direct
> DPU version comparison.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
