Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A36E6D0329
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 13:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0065810EDD0;
	Thu, 30 Mar 2023 11:30:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD0410EDD0
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 11:30:18 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-545e907790fso232384737b3.3
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 04:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680175817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Z6cuQ9hIHTdbnLN1pgaiYFS8g/uB5WtYlD8bXBl8g8=;
 b=UBthkx5ykPrfy0hajs5iWpqWsQfl+OQJsVnlphXPHX8w3694JndAEVdJBTuXCnc0Kq
 nP1uCUpMIZVQ0PYDdXXonkcnS0LWTZDFbNjD1hpeV5OlzzurRUqGkHLQYVUAXAsfpra4
 OkVwXU9xu33KbjC1lM3OX5+XLsohPAIbpLm4+O39CY1x3xHXUoMypSjyuhU2yNCS2U+6
 8i+YvIx3WGbfRuscgl6JPs0FfwBIGZRdg6bOtKlLkNxe0Vk8gCyUwBkmWhSoyh2DJfUM
 cDiRQ0xR6vyKwvN2zJFEKewLJDr8i8KE/xFEwe7Pkc9s1XtMwyHEe9pCd6Pfi7GHw5d/
 4vPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680175817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Z6cuQ9hIHTdbnLN1pgaiYFS8g/uB5WtYlD8bXBl8g8=;
 b=Ro/eRI4AV5+TRVusvkWKbEWamit3Azs6SYvSvp4ypLjiMGleB/42E12O7s/WK23wvT
 vVzP8dyQCT6vP7jjPlmdIsMa3yI+4kr1c5TK3vc24B7mfJd0ERnj7938pzI3nKB6xYAm
 VtCaKnqoCJOD9s9l8TIvx9mS5eG+STYWRnhax52LV8DZmeLAkyqpcRdUFNz2WxT0VwG4
 7Fxti7FRZpAR0f5OgZwmoYYl3K78tMKh13Y+bF1+MJzYN1GZKGro/BnMeomG8qYLoPeo
 oyeaDtCrQJ066fk8/hVQqWlENX/GXK+Cq8yCqdpjvhwrjIyETOxg9dNpJYxebZsGYrdX
 gicA==
X-Gm-Message-State: AAQBX9e5KYNmhzwp/yoW+Jia1a9HGlIVHHlAvkOMzfy6Nz6yReAqnV4X
 T5/f39jf3TvAWvJSXNlIYOlniW2ycOxqr9e+KlC2WQ==
X-Google-Smtp-Source: AKy350YGt/VZZjwJ8RcTGwckSwP2VskFLeTRHe+v6OIVJWT/tuEh4q+I+f8Xbf2gB3tFVnOxTRlce+Uag4DqyXPeuCI=
X-Received: by 2002:a81:b617:0:b0:541:7f69:aa8b with SMTP id
 u23-20020a81b617000000b005417f69aa8bmr10804632ywh.5.1680175817633; Thu, 30
 Mar 2023 04:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
 <34470797-493c-d99b-4d0c-0f9381c5b7c1@linaro.org>
 <b9b1ae11-d9cf-0139-41d0-5af4ff2c8e6b@linaro.org>
 <9ff4fc88-f4bc-3e05-cad9-176449d7258d@linaro.org>
In-Reply-To: <9ff4fc88-f4bc-3e05-cad9-176449d7258d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Mar 2023 14:30:06 +0300
Message-ID: <CAA8EJprwyxOqM6OpgTALgP1phduamETpGFEnwFuVSXX=HgG4AA@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [RFC PATCH 0/3] drm/msm/a5xx: scale MX following
 the frequency changes
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 30 Mar 2023 at 14:16, Konrad Dybcio <konrad.dybcio@linaro.org> wrot=
e:
>
>
>
> On 30.03.2023 13:15, Dmitry Baryshkov wrote:
> > On 30/03/2023 14:06, Konrad Dybcio wrote:
> >>
> >>
> >> On 30.03.2023 00:24, Dmitry Baryshkov wrote:
> >>> Konrad brought up the topic of scaling the MX domain according to the
> >>> OPP changes. Here is my RFC for this functionality. I post it as an R=
FC
> >>> for two reasons:
> >>>
> >>> 1) I'm not sure that we should scale MX if we are not scaling main
> >>> voltage following the CPR3
> >> It should be ok, however..
> >>>
> >> [...]
> >>
> >>> Dmitry Baryshkov (3):
> >>>    dt-bindings: display/msm/gpu: allow specifying MX domain A5xx
> >>>    drm/msm/a5xx: scale MX domain following the frequncy changes
> >> This is a stopgap solution, CPR is a child of MX.
> >
> > Not so sure here. Vendor kernel scales voltages and MX levels separatel=
y. Moreover, please correct me if I'm wrong here, the kernel doesn't scale =
VDD_GFX directly. It programs GPMU's voltage table and then GPMU handles vo=
ltage scaling according to performance levels being set. MX is handled in p=
arallel to switching GPMU's level.
> >
> > I have implemented this voltage scaling locally, just need to run more =
tests before posting (and unfortunately it depends either on CPR3+GFX or on=
 programming the voltages manually).
> Oh no.. I forgot about the ugly goblin that we call GPMU.. I'll have
> to dig into it further. Thanks for reminding me..

Let me send the fixed voltage table programming (probably on Friday).

>
> Konrad
> >
> >>
> >> Konrad
> >>>    arm64: dts: qcom: specify power domains for the GPU
> >>>
> >>>   .../devicetree/bindings/display/msm/gpu.yaml  |  9 +++-
> >>>   arch/arm64/boot/dts/qcom/msm8996.dtsi         | 14 ++++-
> >>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 52 ++++++++++++++++=
+++
> >>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.h         |  3 ++
> >>>   4 files changed, 76 insertions(+), 2 deletions(-)
> >>>
> >



--=20
With best wishes
Dmitry
