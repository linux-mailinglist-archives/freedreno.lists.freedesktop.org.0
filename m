Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8865C6D0825
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 16:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5370910EE84;
	Thu, 30 Mar 2023 14:25:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE5710EE84
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 14:25:15 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id h34so13935748uag.4
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 07:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680186311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rgSAl4+YtdqN02WoMh9cxZGDhw1MNojQ8HH4aKN4HAQ=;
 b=HVwX3GyMBDMI81JH3eMSbxh8eUDP5GC5dqFdJCt7N810faVDMtzxlcbcYLO3JpDj+X
 YudlkEmrBH5EgIEDiLy+7UTjzzOzTE3nTZxQJSj8BIZ5u8GIVdJ3bVvAopcAuf1seqeB
 jcfGcA9MxgfXQA3hfOwh4Svnrj+Yq2SIFDqRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680186311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rgSAl4+YtdqN02WoMh9cxZGDhw1MNojQ8HH4aKN4HAQ=;
 b=0/r5s3U/VEtj4jdMLEGO/F7YpeFNaqLTqS0n/jXeTxvGtZmDpKIaAQ34Oum3MzXywf
 ML1X0TKr3DC+aQaJX90ljg+BwPsQZTNylObzIUda/Y2UnUiHRMd96syPOMOWXu1pP/pf
 Ve1U2G13cCi7B304rvKjtmgenp1urmn4ZipRNvmRcAwsAcngHBrjkJUfcreStzR4QwGL
 CHxplZjobj9OoVyFpKaeo18JjAhm4/h1KlvJ2euu0AyXbgO1sIeQshZZ3ly1D1IEBr9v
 /fhc2WvcBSBlFqJVK2bjWNSB/RexJ+6Z5xeN1BBVOPs3APrNlftjJYCd5ZJVYVrzk/G0
 q7zg==
X-Gm-Message-State: AAQBX9cecBaP7PQyNwY0eE0xvr39tuRdlBA0dkgTRwZv2xfz/udZjykC
 d3f5oVb4Gtxh7CeQ8O5SrrtE90C8Edzv3v7pJvI=
X-Google-Smtp-Source: AKy350bP2MCHipGTfBI26LuaKzg2ivKy5onTgWiuS4e1xbBft3AXdTA5Yjxt9kxhjARE0DxgE9IgTQ==
X-Received: by 2002:a05:6122:20a8:b0:401:8ed8:28f9 with SMTP id
 i40-20020a05612220a800b004018ed828f9mr11231286vkd.4.1680186311723; 
 Thu, 30 Mar 2023 07:25:11 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51]) by smtp.gmail.com with ESMTPSA id
 x204-20020a1f31d5000000b004360f4ef0eesm4922719vkx.39.2023.03.30.07.25.10
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 07:25:11 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id cz11so16378784vsb.6
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 07:25:10 -0700 (PDT)
X-Received: by 2002:a67:d493:0:b0:426:a319:a226 with SMTP id
 g19-20020a67d493000000b00426a319a226mr8587434vsj.7.1680186310355; Thu, 30 Mar
 2023 07:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230329233416.27152-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20230329233416.27152-1-quic_abhinavk@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Mar 2023 07:24:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U7JRP_2C7Rhc+0pwgPPBMKgZ=wJXkPvac4j5dDEsdAkA@mail.gmail.com>
Message-ID: <CAD=FV=U7JRP_2C7Rhc+0pwgPPBMKgZ=wJXkPvac4j5dDEsdAkA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] arm64: dts: qcom: sc7280: remove hbr3
 support on herobrine boards
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
Cc: quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, konrad.dybcio@linaro.org, robdclark@gmail.com,
 agross@kernel.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 29, 2023 at 4:34=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicin=
c.com> wrote:
>
> There are some interop issues seen across a few DP monitors with
> HBR3 and herobrine boards where the DP display stays blank with hbr3.
> This is still under investigation but in preparation for supporting
> higher resolutions, its better to disable HBR3 till the issues are
> root-caused as there is really no guarantee which monitors will show
> the issue and which would not.
>
> This can be enabled back after successful validation across more DP
> sinks.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/=
boot/dts/qcom/sc7280-herobrine.dtsi
> index b6137816f2f3..313083ec1f39 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -464,7 +464,7 @@ &mdss_dp {
>
>  &mdss_dp_out {
>         data-lanes =3D <0 1>;
> -       link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 =
8100000000>;
> +       link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000>=
;

This seems OK to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
