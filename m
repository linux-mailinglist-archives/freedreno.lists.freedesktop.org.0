Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D6555A5B6
	for <lists+freedreno@lfdr.de>; Sat, 25 Jun 2022 03:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2DB10E6FC;
	Sat, 25 Jun 2022 01:15:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CEC10E6FC
 for <freedreno@lists.freedesktop.org>; Sat, 25 Jun 2022 01:15:20 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1048b8a38bbso5950710fac.12
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 18:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=EHOMV/tMxEFeh2Jng8BcJ4ThhtxwYK4Dk9aplz67guk=;
 b=dGn3J5hQVt31ATY+uLJZzcCFaJ2JarOQfjsSRAoyAOLFZ/LZ6aRroA1lMOzHRyV1ki
 5QBWVFvxporoAtTgNCi1cvCtAv8z6W0TjsGa4P3ZhTS3w9IbIPsHxqOrTcoJyQvTCtmT
 KMlEKexTypASbOy9WZvAz+s2jPY5gfTr5oDQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=EHOMV/tMxEFeh2Jng8BcJ4ThhtxwYK4Dk9aplz67guk=;
 b=ZtjCoiFNS29W0ocKz2FCn/wusWRNxASoZvQjdMGOc2mmLWnf/qbMx62Hjl2yt9zQdT
 m5GLRK929l8PaNyKLKo0arj6tvqJ/qryo6ehj/9Yo8+uIIDB2UtF/SvBaORbgeaf8giO
 RuD/nvj8lN880tfHzOtLA1ag+ID0vCqkD2WoyR3OMIKatCJZsh433QrRDG1Jyaj0MJtQ
 1yK/VfKWdC5RcKY6coelrVG5Gplcibpd0tumCHwOVKuZzSwTCJMqjxe6NjNPdc/Wgu5t
 rEqfbywhlSkC6fi42U0YJCxvz+4ENEeexbRPFNTbt8i8IvM6b62KnYymdckh6ZiJEc74
 xMIA==
X-Gm-Message-State: AJIora8HrF5DIToxz/3vhcS1Ttpt1HqlBG3jG7IYqOEucliJmBZYSaNF
 8EhvUZ7YhK+bzUB+rPuF/3jNrA5pTVea7tw76tcSlA==
X-Google-Smtp-Source: AGRyM1sqn6raMG8ZnZmf/2BHjOiUNC2au51zyE6rJgQNmVhLHQ9NGqlBsSYe0+jwNvxHxItIz1kyFnssvhq/pbyt8OU=
X-Received: by 2002:a05:6870:b627:b0:102:f25:a460 with SMTP id
 cm39-20020a056870b62700b001020f25a460mr1138464oab.193.1656119719962; Fri, 24
 Jun 2022 18:15:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 18:15:19 -0700
MIME-Version: 1.0
In-Reply-To: <1a2e7574-8f78-d48e-a189-020ffcd39f60@quicinc.com>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com>
 <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
 <CAA8EJprqq=vxXT2DmEWii_Ajx2UbkHRexPTT58xFcWkBa_D5hA@mail.gmail.com>
 <26263c16-8cbc-ccca-6081-7eba14635d73@quicinc.com>
 <CAA8EJpqEoXXA=eKGHRGuQ3VOHnmEShY8u_SMZ6WFWORCFhFcrw@mail.gmail.com>
 <8445f93a-00f0-64af-5650-07f2bc487742@quicinc.com>
 <CAA8EJpqB2KPyvFehK9WRGgiVnqvD24cz5BcHsw8a5PQ2Vs1oKA@mail.gmail.com>
 <CAA8EJppZdyutyNBG+OFinickQoDxg0i4GwbaNQubo_LSRWNh4w@mail.gmail.com>
 <1a2e7574-8f78-d48e-a189-020ffcd39f60@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 24 Jun 2022 18:15:19 -0700
Message-ID: <CAE-0n52L1fvvpEH56+HD_UXuV61tMvhh8Qjp781bW9tTKRQymw@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 robdclark@gmail.com, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-24 18:02:50)
>
> On 6/24/2022 5:46 PM, Dmitry Baryshkov wrote:
> > On Sat, 25 Jun 2022 at 03:28, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >> On Sat, 25 Jun 2022 at 03:23, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>> On 6/24/2022 5:21 PM, Dmitry Baryshkov wrote:
> >>>> On Sat, 25 Jun 2022 at 03:19, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>>>> How can I have eDP call dpu_encoder_init() before DP calls with
> >>>>> _dpu_kms_initialize_displayport()?
> >>>> Why do you want to do it? They are two different encoders.
> >>> eDP is primary display which in normal case should be bring up first if
> >>> DP is also presented.
> >> I do not like the concept of primary display. It is the user, who must
> >> decide which display is primary to him. I have seen people using just
> >> external monitors and ignoring built-in eDP completely.from
>
> >> Also, why does the bring up order matters here? What do you gain by
> >> bringing up eDP before the DP?
> > I should probably rephrase my question to be more clear. How does
> > changing the order of DP vs eDP bringup help you 'to fix screen
> > corruption'.
>
> it did fix the primary display correction issue if edp go first and i do
> not know the root cause yet.
>
> We are still investigating it.
>
> However I do think currently msm_dp_config sc7280_dp_cfg has issues need
> be addressed.
>

What issues exist with sc7280_dp_cfg? It looks correct to me.
