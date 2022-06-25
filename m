Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F99D55A59F
	for <lists+freedreno@lfdr.de>; Sat, 25 Jun 2022 02:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3437B10F16F;
	Sat, 25 Jun 2022 00:47:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0298D10F16F
 for <freedreno@lists.freedesktop.org>; Sat, 25 Jun 2022 00:47:10 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id c137so3086543qkg.5
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 17:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oKczyqyJVXbwPP+eN8sAth8R0lhAg6AZnihqaYYUBRA=;
 b=RugWSFqunQ09plkfj1ThuMovNx8NR85FBmWxOQnjmCKgfHgQEmmnP60305jkJsdndI
 HkQI9u8W895QQbso6DdkTclFUERlmrT83EaiqnV94vasxjcMmdiac4GwL2yZwViAwk/v
 HHz26Gq5Fqu8G+Tp5CIMzXBJmJPAWeiIPA1YpFSp77gMOprozrILol5W4VVxRViw/4Ii
 rGTOquoPSkEyt4kt7G6LtMGCAPuu+TqpBwT7F/P57CcEiAgx18H6Lpr6WCAxL4mDoBUd
 qO7qFUx8434SYKqXEUZpRkUGH1RSozh8tFSqUoGIt1EMveGd1LBmyKsFaviNWvosUsid
 VqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oKczyqyJVXbwPP+eN8sAth8R0lhAg6AZnihqaYYUBRA=;
 b=K4QUHA3F80eB6+x2J5T4n8CRv6cKJ2mX5NpBR3TWPiViO3eHL0B/uDSOsiVGS3Li4s
 H1232EXTvGo+87DSZsFQWwUmDMtJp44eJBWg+59LatsMYgLSWDnr3ylOLvcF6gbvD27X
 vvJSbgMdZu06+LsIO4SnFIEZvTlZe6zygeyqWRp42quVFeKtfo1Q9XgAKeJA6I5QdvBC
 nrL1rwaPQxBY/LDoitXP36xx9l78hRV3ZXzOPpYJ3K0pLXuOQAhLW1YcHY+pxh2tX0Im
 0P0yI4SgalqeIJTbi1yonnJWGuRW/QpbT7vqLomR5VWqi9UIVyTFeq7c1fgqIj50D5Mx
 Zp3A==
X-Gm-Message-State: AJIora/X8KFoJ86ewbjSiTf/X5FNvDL8jD6cnXkv54fF0XO9TqkZhjlr
 ir/GguasekKx1P9i1GGGxrmc4webjRFnRVrGon6L9Q==
X-Google-Smtp-Source: AGRyM1vQ1vDDBzdPJoGeWwsffL+nmSpD3bXYcuiqaJJ3hxzqY/MRBObekDuzlqII+ZoMkbx+3P9PZsnLsBcCxWn/v34=
X-Received: by 2002:ae9:ed56:0:b0:6ae:f7cf:7f5c with SMTP id
 c83-20020ae9ed56000000b006aef7cf7f5cmr1475378qkg.59.1656118030003; Fri, 24
 Jun 2022 17:47:10 -0700 (PDT)
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
 <CAA8EJpqB2KPyvFehK9WRGgiVnqvD24cz5BcHsw8a5PQ2Vs1oKA@mail.gmail.com>
In-Reply-To: <CAA8EJpqB2KPyvFehK9WRGgiVnqvD24cz5BcHsw8a5PQ2Vs1oKA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 03:46:58 +0300
Message-ID: <CAA8EJppZdyutyNBG+OFinickQoDxg0i4GwbaNQubo_LSRWNh4w@mail.gmail.com>
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

On Sat, 25 Jun 2022 at 03:28, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 25 Jun 2022 at 03:23, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> > On 6/24/2022 5:21 PM, Dmitry Baryshkov wrote:
> > > On Sat, 25 Jun 2022 at 03:19, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> > >> How can I have eDP call dpu_encoder_init() before DP calls with
> > >> _dpu_kms_initialize_displayport()?
> > > Why do you want to do it? They are two different encoders.
> >
> > eDP is primary display which in normal case should be bring up first if
> > DP is also presented.
>
> I do not like the concept of primary display. It is the user, who must
> decide which display is primary to him. I have seen people using just
> external monitors and ignoring built-in eDP completely.
>
> Also, why does the bring up order matters here? What do you gain by
> bringing up eDP before the DP?

I should probably rephrase my question to be more clear. How does
changing the order of DP vs eDP bringup help you 'to fix screen
corruption'.

-- 
With best wishes
Dmitry
