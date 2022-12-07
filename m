Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C14645E48
	for <lists+freedreno@lfdr.de>; Wed,  7 Dec 2022 17:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CB410E3DE;
	Wed,  7 Dec 2022 16:01:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219BC10E3DE
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 16:01:28 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id q1so16738415pgl.11
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 08:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d1kIptz7lKS34gKJ86GNyP5WqgoufGO1GV/3C71h5+Y=;
 b=Zv+M3sdOTc2OaYw1U1lD9VTedffjOCXGlzUX5YnRjqpDj/9mhaAVkhtuzC+ogifVNu
 p1S/8EKd2QORb28ZpoA3LQnVibjwCkCNAAb9dr9XCl2C4l+Lt3Z6K4ir7sm+3mW4x/85
 6pBJiFAc5UE0fruWDoMsAuJxxN5FRe4wKarL0lpXgBiZNMb0+WQ3q6mYx9fH+BVE9sXN
 gbcBsoVcq0qongaEmXQHvGOHZ7fI+IIGnay3mc2RIntIRbvuzxhNHt+9sR/XJZeaoNbC
 fkZqCAqy2kkWqJJLUpz0hIpe2AeBemrvPLy50G6cklmneX0nbRZt8TDVpi+8T7V/GUDd
 oNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d1kIptz7lKS34gKJ86GNyP5WqgoufGO1GV/3C71h5+Y=;
 b=h2XU/zJqLkabGQPiQlqoBBUnIzOG75sj9YNdIv4hGctWh5X6Rx/K+CL9ROCEM8mlIt
 s3Xzga/EWecuZpeeJXs9t/5yU+p980QSnLINxuJysIN1bl2TFLAoTzk1oUBgC9+2g/l+
 hi+i8FzxOD65QsrtEHuq5lhNpQt1jPZZB88Nz6mfYznXi9dsIAzrV7ysL4t8pY/RFX36
 HNwAaeQzlp02k7RBQwLNbKn6yMM867EaVv9DDrkdGvSQtjWURLayORA/mrS386a+jTA+
 Ul22pv0YRh1EgPwDlLlnuDQnS39F4H1YG3zorslOVlhkflAEhRoQcg9BURAxx6yxkRH0
 Cp8A==
X-Gm-Message-State: ANoB5plq/0+aYqOMB0RhsqMX+32UNShuH+c9C5tsQ4yWQnDg5+A1Dplm
 py9ZqKMbDVtLrIe12zPNG37xNiwsZo7rn3cir10e/A==
X-Google-Smtp-Source: AA0mqf6sjup+AAww0D1CxABtpTEw5G9veD+P+n64BdJc1XGnX7DToNoJVds9RCkhIAyxzhqjXASkgW/44ET/nN1v+Fo=
X-Received: by 2002:aa7:951d:0:b0:577:3e5e:7a4 with SMTP id
 b29-20020aa7951d000000b005773e5e07a4mr8456102pfp.57.1670428887514; Wed, 07
 Dec 2022 08:01:27 -0800 (PST)
MIME-Version: 1.0
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221201225705.46r2m35ketvzipox@builder.lan>
In-Reply-To: <20221201225705.46r2m35ketvzipox@builder.lan>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 7 Dec 2022 17:00:51 +0100
Message-ID: <CAPDyKFofsqcoFbYt-9BcisbPdreLGqAAMWorqHi0_D1kwCdYhg@mail.gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 0/6] clk/qcom: Support gdsc collapse
 polling using 'reset' interface
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 krzysztof.kozlowski@linaro.org, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 1 Dec 2022 at 23:57, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Wed, Oct 05, 2022 at 02:36:58PM +0530, Akhil P Oommen wrote:
> >
>
> @Ulf, Akhil has a power-domain for a piece of hardware which may be
> voted active by multiple different subsystems (co-processors/execution
> contexts) in the system.
>
> As such, during the powering down sequence we don't wait for the
> power-domain to turn off. But in the event of an error, the recovery
> mechanism relies on waiting for the hardware to settle in a powered off
> state.
>
> The proposal here is to use the reset framework to wait for this state
> to be reached, before continuing with the recovery mechanism in the
> client driver.

I tried to review the series (see my other replies), but I am not sure
I fully understand the consumer part.

More exactly, when and who is going to pull the reset and at what point?

>
> Given our other discussions on quirky behavior, do you have any
> input/suggestions on this?
>
> > Some clients like adreno gpu driver would like to ensure that its gdsc
> > is collapsed at hardware during a gpu reset sequence. This is because it
> > has a votable gdsc which could be ON due to a vote from another subsystem
> > like tz, hyp etc or due to an internal hardware signal. To allow
> > this, gpucc driver can expose an interface to the client driver using
> > reset framework. Using this the client driver can trigger a polling within
> > the gdsc driver.
>
> @Akhil, this description is fairly generic. As we've reached the state
> where the hardware has settled and we return to the client, what
> prevents it from being powered up again?
>
> Or is it simply a question of it hitting the powered-off state, not
> necessarily staying there?

Okay, so it's indeed the GPU driver that is going to assert/de-assert
the reset at some point. Right?

That seems like a reasonable approach to me, even if it's a bit
unclear under what conditions that could happen.

[...]

Kind regards
Uffe
