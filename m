Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F407FFD74
	for <lists+freedreno@lfdr.de>; Thu, 30 Nov 2023 22:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1AD10E047;
	Thu, 30 Nov 2023 21:25:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE7110E042
 for <freedreno@lists.freedesktop.org>; Thu, 30 Nov 2023 21:25:04 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54c11430624so1657322a12.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Nov 2023 13:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kali.org; s=google; t=1701379502; x=1701984302; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8c4Eu/Dubr5HSF4fDhNSD3Be+bs9dIetpJRDNp7v/M=;
 b=lnwHswlSlbRDKGTsretmxuKQ5eWjHoxKdZ+wJNh6eLbPPFII6XiAd7XQIohlbBdnmj
 NQBJ2fLJM7uzZlw1Zz8kTgKRXZJOZUaI50ZsBscGpAAMjc1kcXDG1PnOhIuT2wuYgATx
 j8Dixi8YJQI2Nm7+6wDLfjCtYCWivozkD8CTTYoPZx6Uw6DI3No3Mcp55KWj6bP/HkOC
 CsQ+0RSb3BrpREC3ujOGanXGQ+qUqeaqvmPDvuparHKr27W1VDkuLJ4y9K3yx7d263uh
 tUFiFM62h2y53OGxJmimj1MIEOoehYrWImFjoKIWAICt99rXVpWAUAuBqJjtEZk0Lakd
 n4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701379502; x=1701984302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8c4Eu/Dubr5HSF4fDhNSD3Be+bs9dIetpJRDNp7v/M=;
 b=E1lNCugtqCSX2R7zguH9AUm0vC5nYQ/6ercycT5qk7yZcgR+hBc/EmZXxaI2tpcYkF
 Q57W0flPbk20WV3KPxkFShGPcPenIUFQVYWB9mOQwetVnLhHz/vMSDirCbzwfT5Qc361
 KfBH3u7sxM7AcJsAzPV5cCrimL4ON1noZlal9NQnc7o/hQ93w0XHaVlMcqszF2757F1H
 d2+UsFc2rDmubR/O563fBW3Ul+0Rg4EyCRtTplVorrWg1f7lIZIyzWMO2UDjSMfIrirM
 v+5G/N5mgHB1P7WeolI9PpKNw0EQmipvYrSThBhSEeh03OOkKD4jXVQ8no4Nn9+cI0cp
 6sYg==
X-Gm-Message-State: AOJu0YzyV2s8ocBmd7Oy0vceKD/SN11nDWxL2EnoZ30YhJCE1jFQ08oE
 K/CZYuDOSrYLCeXs6fD3M3syn9mzCddFX+quaiPEbQ==
X-Google-Smtp-Source: AGHT+IG0ta2XtylneHDppsL8gcmXtn/Q/+7/EPbWdZikXUYS2NOvcQ4OqXc4VNcjnztwP5GcK+tdQYNKGciNXohB/fY=
X-Received: by 2002:a50:aa9b:0:b0:545:3b25:d142 with SMTP id
 q27-20020a50aa9b000000b005453b25d142mr198098edc.15.1701379502435; Thu, 30 Nov
 2023 13:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20231130192119.32538-1-robdclark@gmail.com>
In-Reply-To: <20231130192119.32538-1-robdclark@gmail.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Thu, 30 Nov 2023 15:24:51 -0600
Message-ID: <CAKXuJqgrKLw7rFdJcgueR4=tUdpP52i0P8pJoins6-9z6=sxfQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Correct UBWC settings for
 sc8280xp
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Danylo Piliaiev <dpiliaiev@igalia.com>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 1:21=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The UBWC settings need to match between the display and GPU.  When we
> updated the GPU settings, we forgot to make the corresponding update on
> the display side.
>
> Reported-by: Steev Klimaszewski <steev@kali.org>
> Fixes: 07e6de738aa6 ("drm/msm/a690: Fix reg values for a690")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mds=
s.c
> index 6865db1e3ce8..29bb38f0bb2c 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -545,7 +545,7 @@ static const struct msm_mdss_data sc8280xp_data =3D {
>         .ubwc_dec_version =3D UBWC_4_0,
>         .ubwc_swizzle =3D 6,
>         .ubwc_static =3D 1,
> -       .highest_bank_bit =3D 2,
> +       .highest_bank_bit =3D 3,
>         .macrotile_mode =3D 1,
>  };
>
> --
> 2.42.0
>
Tested on Lenovo Thinkpad X13s
Tested-by: Steev Klimaszewski <steev@kali.org>
