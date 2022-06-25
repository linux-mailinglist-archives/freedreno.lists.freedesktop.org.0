Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA54455A57F
	for <lists+freedreno@lfdr.de>; Sat, 25 Jun 2022 02:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D67010F4BA;
	Sat, 25 Jun 2022 00:28:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617CF10F4B3
 for <freedreno@lists.freedesktop.org>; Sat, 25 Jun 2022 00:28:38 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id k10so3030205qke.9
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 17:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vO2qD2XXjUZOfZrbQAZ+jo3zJKcu1SEluqgJYAyM3W4=;
 b=bT0TGKZ31rhy+fJIUdvuACHnYjOFWuM9ZHq58WZdqWmx85U5H5yAyAl0YFpE/3gdcD
 MDxF8e5qO+8KKHWgOXyD63B6R3g03zCgEVoF8pyuY64xeZTG6PLa7M+O4NZC9W9J3ee5
 h1k8uC/qtfHY9zZsLhEQbLCLrIm4izlMlt7SKrcLLLTh4PnuoOcwyuOrgmwVFvEpwfL8
 qRAKQdyMPJzcB7j+U1Ql55JD1OuADzVobdko3h2gC4j1TZLeZRQJiZmOxwWsfnnGYeEw
 KgFRlrRgWY+DQdP6W1jrZzsEfejwljvWyfXstn1/SnaGN7/BmcCNXG6ZDhUxOzgEgiVp
 L+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vO2qD2XXjUZOfZrbQAZ+jo3zJKcu1SEluqgJYAyM3W4=;
 b=hJwV0mOESV32agdxACWWgayNBxqXgJoNbPx17oMTky9I1xDVzoi/N0ylD4u2SYQNGa
 Ssz9keAq3bwMHEt9c6m5DFDFEvm3wFTsWMSNisAJJBcHrQuU1ENvcOTuFv41NzUU4Pih
 g60FG4lUinIgO04Jm0s4jRC6E6o0mUyLAsw8tV7+99QiY3sBuMGIHip/xI4JIgwGDv+N
 d01H7WYGUk4NvYHL55rQvAaVDAN17WFXkm1aJ/d40gUh+6OMWiVeJN+xW3WlScNCurjU
 QVjaOgdjJhSsXuM5FNw9EmbQY0K0Od3rqnPRV9U5lxPiK4U2lJH0NdsfK1vbAGs5S+tr
 Qv6g==
X-Gm-Message-State: AJIora+om9JroiByaEtUE9vVIXxDAUTG2hiMPmsFh2JhzOcdrmYQ2lI1
 fkKSHvdjzQIxnN0R4aTA6/tunLlIKrQs2mUQoFtO1w==
X-Google-Smtp-Source: AGRyM1vxoZI3m9hElle4o62W9mKIrDr0LOAaKuoUqqlt2TO3csI8K7FZPgCmvM8deSM7HEPtdV6x2TJv7RpMJkrO860=
X-Received: by 2002:a05:620a:2a0e:b0:6a7:8346:1601 with SMTP id
 o14-20020a05620a2a0e00b006a783461601mr1415421qkp.593.1656116917557; Fri, 24
 Jun 2022 17:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
 <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
 <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
 <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
 <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com>
 <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
 <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com>
 <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
 <CAA8EJprqq=vxXT2DmEWii_Ajx2UbkHRexPTT58xFcWkBa_D5hA@mail.gmail.com>
 <26263c16-8cbc-ccca-6081-7eba14635d73@quicinc.com>
 <CAA8EJpqEoXXA=eKGHRGuQ3VOHnmEShY8u_SMZ6WFWORCFhFcrw@mail.gmail.com>
 <8445f93a-00f0-64af-5650-07f2bc487742@quicinc.com>
In-Reply-To: <8445f93a-00f0-64af-5650-07f2bc487742@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 03:28:26 +0300
Message-ID: <CAA8EJpqB2KPyvFehK9WRGgiVnqvD24cz5BcHsw8a5PQ2Vs1oKA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of
 dp controller_id at scxxxx_dp_cfg table
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, dianders@chromium.org,
 airlied@linux.ie, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robdclark@gmail.com, agross@kernel.org,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 25 Jun 2022 at 03:23, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> On 6/24/2022 5:21 PM, Dmitry Baryshkov wrote:
> > On Sat, 25 Jun 2022 at 03:19, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> How can I have eDP call dpu_encoder_init() before DP calls with
> >> _dpu_kms_initialize_displayport()?
> > Why do you want to do it? They are two different encoders.
>
> eDP is primary display which in normal case should be bring up first if
> DP is also presented.

I do not like the concept of primary display. It is the user, who must
decide which display is primary to him. I have seen people using just
external monitors and ignoring built-in eDP completely.

Also, why does the bring up order matters here? What do you gain by
bringing up eDP before the DP?

>
> We want eDP encoder  help functions be executed before DP.

Why?

-- 
With best wishes
Dmitry
