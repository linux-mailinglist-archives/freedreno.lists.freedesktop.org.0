Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92C389E292
	for <lists+freedreno@lfdr.de>; Tue,  9 Apr 2024 20:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC295112EBE;
	Tue,  9 Apr 2024 18:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fso3USi3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AFF112EBC
 for <freedreno@lists.freedesktop.org>; Tue,  9 Apr 2024 18:31:23 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-615826815c2so68920227b3.1
 for <freedreno@lists.freedesktop.org>; Tue, 09 Apr 2024 11:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712687482; x=1713292282; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bGu7XtJhzUW0frfAhJWk/dFj2iy5sTHLiNWC4LsP98o=;
 b=fso3USi35QG1+MBcLRDN/GccoJhqupPMnXXRoLI/bZZh238wzwEUqmy5JIhNrqOXmy
 MGl886vL9StSK21XOI2CZjyjxzQ09Vebxdse7NbcHadluFdHLISFhqWbJC0a7dD0ZtTz
 hEGoqwYPkV+0QbQFjqp25MshRbGQrgDLToHs2AIiO/+U1WcLyg43TeV14TzfhvDI5M+4
 aPDGJT7AX/pFNWX8klJ6/7okDP/koWC/bUqqqurxHq3Y/IADipjixuFLBBu7VKVah6/w
 gVWFYCyrwFoN7euaYv5dYrq413VJ3IuBAGovwp4D6pCJ0bX/F2G7ezG0iHl4fYB9+UMA
 Z23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712687482; x=1713292282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bGu7XtJhzUW0frfAhJWk/dFj2iy5sTHLiNWC4LsP98o=;
 b=DOeAfXPqWgOECYffojteJ0HPwuqbOvFG56GGGGyPU+oIV9ds+NP93XOSoIppDx9uLu
 3DeXXFQNshxh7FnxkEQl3GoGSnKoyb9XGHazuoOGxxd40Mb3wsbQSJReeW31h/Lsbwpe
 9mjeh1HNHSaMc6TFkcjKLAeXLgxYBmTvNlw51v9r4hxksBQtErutpaMbgETsKNieZ2vB
 KqAcIw0zNZND/65rW8zncC/+SY9He0lTXKW+DDhLjDy/HnFvXhaWi0KiG0SRnLimbyRI
 p+git62HTzzX9kWqvSXvSi7A/mcXlbeqFEeDmMayLo0zI9mLsCBNRzY9OUAtz58xFHsF
 Q6rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFGAos+uEEoKBh7eqYCpZD8wUU7DnFdByX8/Kv9nEQtPO1UlFXE+JOSPc8XzHZV88mrQnERisBLMCyrMLRoYIgg8Ve51YbXI1fzl+z/Grm
X-Gm-Message-State: AOJu0Yx/j2ZenORBi5KU2KzQuFJK+IL6gA6JU3ffK6IjpcAu/va0kM0+
 X3iyRoagDJBsAztYTkmCk3ODaabVngACTKMBcwkuxAGNN/QjWNR7Dupq+XV8EUSizqiMEcn/Kkx
 rBt68Vu0L2PI57MdVRFQIbGXi0m8MNaZa0FVWZg==
X-Google-Smtp-Source: AGHT+IHQ5KjmBJchef7/auhgtlXjWlZR2v0LxhUQqslvpL6mHG6C3quz50vKHwZLs2B3MGSIY40CMKEa96p0+lotDMw=
X-Received: by 2002:a25:8403:0:b0:dcc:fea7:7f7b with SMTP id
 u3-20020a258403000000b00dccfea77f7bmr631031ybk.11.1712687482548; Tue, 09 Apr
 2024 11:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-3-ce2b864251b1@linaro.org>
 <pncr7ecf4eir36skul3iwt2nf5bpuwd5zjfzzfwwnxjwe4hoes@6z2xe54crijp>
 <d8a2ef87-f29e-4bdb-a9b8-591b8bd5d2b2@linaro.org>
 <tkcbl2iwcy3feoggbk737gx32qsxe5p4ad6lfrujy2pazccrhm@kif3guuzay6h>
 <CAF6AEGsg2xCCC27t_Gqu=MMQ6tckVw=Zj90p4x7EuOm+VKA=ig@mail.gmail.com>
 <quil2y6tbilihgont2xekay4joxgnsanu3khgo77omtwkolslp@ozuaajpv5uon>
 <b77a3161-9a18-4523-8528-31c2f2f4f476@linaro.org>
 <x4sgmdodoacsu6culbjjsw52ucaylpqj2ll6tkeppllzhfqiqn@lysclxogvcfq>
 <74ebd488-15c1-47a5-86f4-14263e3a914e@linaro.org>
In-Reply-To: <74ebd488-15c1-47a5-86f4-14263e3a914e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Apr 2024 21:31:11 +0300
Message-ID: <CAA8EJprAcBDEwYeGJZ=JX2qkS4wQEraXsgCiCyZU3z1ksuxivw@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/adreno: Allow specifying default speedbin
 value
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, 9 Apr 2024 at 21:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote=
:
>
>
>
> On 4/9/24 20:15, Dmitry Baryshkov wrote:
> > On Tue, Apr 09, 2024 at 08:07:56PM +0200, Konrad Dybcio wrote:
> >>
> >>
> >> On 4/9/24 20:04, Dmitry Baryshkov wrote:
> >>> On Tue, Apr 09, 2024 at 10:12:00AM -0700, Rob Clark wrote:
> >>>> On Tue, Apr 9, 2024 at 8:23=E2=80=AFAM Dmitry Baryshkov
> >>>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>>
> >>>>> On Tue, Apr 09, 2024 at 05:12:46PM +0200, Konrad Dybcio wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 4/6/24 04:56, Dmitry Baryshkov wrote:
> >>>>>>> On Fri, Apr 05, 2024 at 10:41:31AM +0200, Konrad Dybcio wrote:
> >>>>>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>>>>>
> >>>>>>>> Usually, speedbin 0 is the "super SKU", a.k.a the one which can =
clock
> >>>>>>>> the highest. Falling back to it when things go wrong is largely
> >>>>>>>> suboptimal, as more often than not, the top frequencies are not
> >>>>>>>> supposed to work on other bins.
> >>>>>>>
> >>>>>>> Isn't it better to just return an error here instead of trying to=
 guess
> >>>>>>> which speedbin to use?
> >>>>>>
> >>>>>> Not sure. I'd rather better compatibility for e.g. booting up a ne=
w
> >>>>>> laptop with just dt.
> >>>>>
> >>>>> New speedbin can have lower max speed, so by attempting to run it a=
t
> >>>>> higher freq you might be breaking it.
> >>>>
> >>>> Usually there are some OPPs in common to all speedbins, so picking a
> >>>> freq from that set would seem like the safe thing to do
> >>>
> >>> Well, the issue is about an uknown speed bin. So in theory we know
> >>> nothing about the set of speeds itsupports. My point is that we shoul=
d
> >>> simplfy fail in such case.
> >>
> >> Or we could allow e.g. the lowest frequency (or 2) which if often shar=
ed
> >> across the board to work, giving a compromise between OOBE and sanity
> >
> > That's also an option. But we should not be using existing speed table =
for
> > the unknown bin.
>
> I derived this logic from msm-5.15 where it's "intended behavior".. I
> suppose we can do better as you said though
>
> There have been cases in the past where the default speed bin ended up
> having a higher max freq than subsequent ones, and I don't think I can
> trust this product/feature code approach to guarantee this never
> happening again.
>
> So. I think sticking to a single lowest freq and printing a big red line
> in dmesg makes sense here

Make 0x80 the default supported-hw, make sure that the lowest freq has
0xff. Plus big-red-line.
And hope that we'll never see 16 speed bins for the hardware.


--=20
With best wishes
Dmitry
