Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCB14D2287
	for <lists+freedreno@lfdr.de>; Tue,  8 Mar 2022 21:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A9410E556;
	Tue,  8 Mar 2022 20:26:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB9710E556
 for <freedreno@lists.freedesktop.org>; Tue,  8 Mar 2022 20:26:29 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id j83so486123oih.6
 for <freedreno@lists.freedesktop.org>; Tue, 08 Mar 2022 12:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=8SYSMYpMF1JLUrGJB3nmVLCJBpd8wl7WznHJ+HFs9K4=;
 b=koKeM8A9VVDPFv1jvcqwyWztjsWRaPM9RHLQWPbtyPj2BvTe7AJnmIlwxvcZ0OY/Hj
 yY7V7M4fq6YS/XvNRBGaJeKEohKUlddhSPQYaJ5+CEvtxiGZ9LNaDSO1/eApKyGMOKmk
 Xg2bU2rviiONnXHI+phTVUVWUXL7J6EZGY+WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=8SYSMYpMF1JLUrGJB3nmVLCJBpd8wl7WznHJ+HFs9K4=;
 b=AU3TjzDmIaKJCkTc0m+P0+7DhPU/h86XfDDtp7Yp0BT+n/SiOZ4zibm1lxSUI/Ttym
 gbkjdH58cLYdyli9e3TUPjZdzo75w/sFpRuv5Q/Pi1dvKM63kcGSEkodFqe0HvvMSO0c
 8I0/tJ8mE1CJWGPoGGInDR83GO6v2TT1l9wh8m0DRYprtpxFWwuqx0xnKwNXL//mcoIL
 0y845NFBRJhgbPEZQS1jg4lsSsPOvnMG5ZuugQPiLrKmpoopnP22Nw6+WBlu9guMPUEk
 wU5WOpFsisGSUslLTfgM1f6aVXo6at+pGx/Uk5m4sJhVJC8haTl/kg6KE31J/Tu2JaRj
 bYAg==
X-Gm-Message-State: AOAM530MdeLGAFN9mX+H4vYJHX8Z1NBrGYCGyTDmSumUm8hRbha0kAJF
 f5e2w7QfDhigGjj+BWiNfP3hF6VS4Lco5K4pwYcaoA==
X-Google-Smtp-Source: ABdhPJxLhnbKfyfH6BsLllQaul5SJ9MYV0lbMZKb+ak0yvA5zeaYuVULnVx7opW3jo+sQRk8z4+n9XteWweQvTP69oo=
X-Received: by 2002:a05:6808:1391:b0:2d9:a01a:4b9a with SMTP id
 c17-20020a056808139100b002d9a01a4b9amr3785266oiw.193.1646771188650; Tue, 08
 Mar 2022 12:26:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:26:28 -0800
MIME-Version: 1.0
In-Reply-To: <20220304032106.2866043-3-dmitry.baryshkov@linaro.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 12:26:28 -0800
Message-ID: <CAE-0n53X2QzWw5mDqsw-Z79WuK75874B9pZtw2vQoC5hJMXj_Q@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 2/5] drm/msm: remove extra indirection
 for msm_mdss
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-03 19:21:03)
> Since now there is just one mdss subdriver, drop all the indirection,
> make msm_mdss struct completely opaque (and defined inside msm_mdss.c)
> and call mdss functions directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
