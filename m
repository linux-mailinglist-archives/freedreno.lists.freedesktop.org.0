Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4932C4305D7
	for <lists+freedreno@lfdr.de>; Sun, 17 Oct 2021 03:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6145E6E56D;
	Sun, 17 Oct 2021 01:30:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EAB6E56D
 for <freedreno@lists.freedesktop.org>; Sun, 17 Oct 2021 01:30:10 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 l16-20020a9d6a90000000b0054e7ab56f27so1218893otq.12
 for <freedreno@lists.freedesktop.org>; Sat, 16 Oct 2021 18:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ubDJVQq78uVYhJbYvgkSAR8BkeRUeNLoFmCL9We36F0=;
 b=flYkLHhlsDBt7e3MlODNLUfbSjUku5qphnfo9uSFkDOvVTyMIbxeq1/Hq9T6WyHtvg
 XJO/07qz87PhIw/OmVM1eQ+/AkpkXbeyxhk/sQGsNfActPTAz4bUJuD5rXjt9MGYxaGJ
 80bs7G6KMq3j5xCfoFO+v1KZos7l6gKi2rAWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ubDJVQq78uVYhJbYvgkSAR8BkeRUeNLoFmCL9We36F0=;
 b=noq+ge7DTQgPYcA6+VL3DIkA7nnSniYy1JOCPpY2j+g2dbgpkikxvuzRIRjJsbhM1X
 T/p94dl68/qo5t4arQWGz2Dnpb8WxCirdO5jtzjpfscJZ5kY6i0FYjyEO4RsNDkNvph2
 DqTajEuXYlb88xd2+Rzo+ksP3XvwgCprQ1Ih656n8mxRQleX4mCyPenqCNJHGPpprOH7
 YiLGLIJN5/U3BGH2Inm0IyRimFegENzU/QLD494yVcflbiDd8HRvPRaD44swnC00vGAF
 XIOFdmgZswefV0z+o7V8uXoJLo2ons3UJbnC1fmbBnacfPhJ+fijYRpdwOs7BfPciIQz
 OoSQ==
X-Gm-Message-State: AOAM532U7uVEbfYgklhsnxUkbiNLP1TGHgphEgmFvw3sytsXHOWL3wg1
 ro0UkgAIPxDf8F4/YQRddx3wDK3S8Ad/nT5UD9O/xt+e
X-Google-Smtp-Source: ABdhPJwr06h9bD3MmzMdWkXAGp+iEIqQozkRjbdPwjgtYY8VoqiNVHLEO5C2EDLfQSqnSUcnH8rKmBifxGT81/0YlVc=
X-Received: by 2002:a05:6830:4187:: with SMTP id
 r7mr9420950otu.126.1634434209334; 
 Sat, 16 Oct 2021 18:30:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Oct 2021 20:30:08 -0500
MIME-Version: 1.0
In-Reply-To: <20211016221843.2167329-4-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
 <20211016221843.2167329-4-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sat, 16 Oct 2021 20:30:08 -0500
Message-ID: <CAE-0n52t0UF8usgvb5=8c9wdb_r+WKt7oNDncaVY=x8WZkVUWA@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 3/7] drm/msm/dp: Allow specifying
 connector_type per controller
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

Quoting Bjorn Andersson (2021-10-16 15:18:39)
> As the following patches introduced support for multiple DP blocks in a
> platform and some of those block might be eDP it becomes useful to be
> able to specify the connector type per block.
>
> Although there's only a single block at this point, the array of descs
> and the search in dp_display_get_desc() are introduced here to simplify
> the next patch, that does introduce support for multiple DP blocks.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
