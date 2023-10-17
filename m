Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BD07CBC4F
	for <lists+freedreno@lfdr.de>; Tue, 17 Oct 2023 09:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB9C10E27D;
	Tue, 17 Oct 2023 07:34:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787A810E27C
 for <freedreno@lists.freedesktop.org>; Tue, 17 Oct 2023 07:33:57 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-79f95cd15dfso206708839f.0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Oct 2023 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697528036; x=1698132836;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ApyDiANstYTWyWFRnukDgHnJl3tUXr1U5Y0xyV6mrc=;
 b=Mb73H4O0CXiNRwbLq+EZyqZiBnzganQcGqDeKhFmCBbQGVwtAz5C2KnmP28deh+re2
 pcsSvi+5ZQC2j56XAzbuaL6KXa7Ot98IVbmQfEhvOhXVtlM351pJPfGMTad9bV6vmczG
 tZh7HRvXieLZ+Ztf4dHs9TsYpUHy0fSgwXgCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697528036; x=1698132836;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ApyDiANstYTWyWFRnukDgHnJl3tUXr1U5Y0xyV6mrc=;
 b=loH3zFFiCWVWe+U4+224q/0Rerkp5A1DQ58vJbRcCCcl8DmUmm0y6HIobHBRmy4OM5
 nUbDnFKhO9ym23ARQ6ToXtp88+Vj24gU19WD9q9ZzCbZrC1N7QoJLGN1KSfC7vLOUiq9
 xNxJUOxcjc56athrWwsZZqxXNGJEwhAQ47vezhmA7wRMRlKrx0n0gN+B5LLMWDNadpYk
 RoP+TousrhWT41lKOWLlG9d9RChl6fLkpJAjj8aMgxnDTNniyMvGNoLSWL9FJSPfe1CO
 wdJ++jD3XmeIJ2429OrDbdtgWkOmEOnYxSN4DdTiDdP/5+VKKi08pK+UT69dVQdbVJIC
 ytYg==
X-Gm-Message-State: AOJu0YwDQWOZxNmOHWJ1v1G41mZ+V75iT4qbrn09U5hpGOlzv8tTygGw
 ZXRxwDU+du1NEBA2l6V549Fffwu/K6QfAiKq99NLeQ==
X-Google-Smtp-Source: AGHT+IEAYKQ8Ud2dDCTFrFxk0sv/MWGDyTH5PUc94osy1+AGiIS89dM943n8PAfXr7KHqvHMo1X6R6r3/dT57OJulPY=
X-Received: by 2002:a05:6602:1689:b0:790:f733:2f9e with SMTP id
 s9-20020a056602168900b00790f7332f9emr1564343iow.13.1697528036747; Tue, 17 Oct
 2023 00:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
 <20230926-topic-a643-v1-2-7af6937ac0a3@linaro.org>
 <43q6mui3lofa4rqh667o54b2qcbqn5fg34ss5o7y7k7uxbxsro@dxgovofsrvqx>
In-Reply-To: <43q6mui3lofa4rqh667o54b2qcbqn5fg34ss5o7y7k7uxbxsro@dxgovofsrvqx>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 17 Oct 2023 00:33:45 -0700
Message-ID: <CAJs_Fx7WkdhY31aP_buZP+b7ihOOmE8zBZFOLZ8z9uqcNmEhVw@mail.gmail.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH 2/7] drm/msm/adreno: Add ZAP firmware name
 to A635
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 cros-qcom-dts-watchers@chromium.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 1:12=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Tue, Sep 26, 2023 at 08:24:37PM +0200, Konrad Dybcio wrote:
> >
> > Some (many?) devices with A635 expect a ZAP shader to be loaded.
> >
> > Set the file name to allow for that.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index fa527935ffd4..16527fe8584d 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -454,6 +454,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> >                       ADRENO_QUIRK_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> > +             .zapfw =3D "a660_zap.mbn",
>
> sc7280 doesn't have a TZ and so no zap shader support. Can we handle
> this using "firmware-name" property in your top level platform dt? Zap
> firmwares are signed with different keys for each OEMs. So there is
> cross-compatibility anyway.

I think this ends up working out because the version of sc7280 that
doesn't have TZ also doesn't have the associated mem-region/etc..  but
maybe we should deprecate the zapfw field as in practice it isn't
useful (ie. always overriden by firmware-name).

Fwiw there are windows laptops with sc7180/sc7280 which do use zap fw.

BR,
-R

>
> -Ahil.
>
> >               .hwcg =3D a660_hwcg,
> >               .address_space_size =3D SZ_16G,
> >               .speedbins =3D ADRENO_SPEEDBINS(
> >
> > --
> > 2.42.0
> >
