Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7694F6D1
	for <lists+freedreno@lfdr.de>; Mon, 12 Aug 2024 20:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B9D10E27C;
	Mon, 12 Aug 2024 18:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="K1Xd8Uff";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BEA10E27C
 for <freedreno@lists.freedesktop.org>; Mon, 12 Aug 2024 18:40:26 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7a1d3e93cceso519026585a.1
 for <freedreno@lists.freedesktop.org>; Mon, 12 Aug 2024 11:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723488025; x=1724092825;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=Ncx0KjsnMUSOlidEu3+KOW8xjiQtkAoEgGIPpLUP9Bg=;
 b=K1Xd8UffzzQM7vxBimUu/kOq4ZyV5TrMs5lub9IDT1YflakuFIy0XDYJH6P+zMbneH
 ESFYPFsfzhnSHGObdfIOTbf7PuyHZXC/bAzn3AqJxH0RXSqQjwNt9gj3GgBpvx6Bpb8n
 FrS13HmYA900AY/71RhVx219mlpqJi0sOTxWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723488025; x=1724092825;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ncx0KjsnMUSOlidEu3+KOW8xjiQtkAoEgGIPpLUP9Bg=;
 b=ZFv8XNaHDMhZpojfdbhGayeEKBsd5Xfxqrt87IzzUVammMMZzHoOQF8J/oqBgmjcom
 CT7GA+txu2ikwcdV63nuyXOmohboYtEJ3IV/ADqnzYPSSoZ5dht8Vrx7Vaxvz5AOgTLh
 LVYZ8pkiMuG6akh4xZummbgLeJfYVDCCMsIZ/NC+CYMgP4PDnGcE3CoeAWVyCYhLf2zP
 BN3KwoTlmcwcu2Oyka/R8nu4bqaw0aSKE8xOvYfLF2Gqut4tSeyfH+qLHDg2u9MeqClE
 dj27a3r3Qb28rOagca5qS/PLj7+52nHA/vRIVuAE5h2v/hcJ3ppcEpEJH5fZhYBV9dbv
 P6RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDBgj32G7KphZnOgOfLduDL0W0lyjS77n/F/X36b0jnSdHyhjmVKE8I+iMLaEklhd1vIkDUn47dvKurGuE6bVPZB/3nLigrlLTML3ONJ6b
X-Gm-Message-State: AOJu0Ywsub3VBRzoqOaCgXekTUwZmTq1dEdkYSrbFZI3jkr7pC6wSKyh
 XUi+iiWXBau8E9ZUe7bPMOlqd+q/nOSbrmKFPVW2Hq7Qouik/mQtKTttHjqt8+aIc5GNzq/lBa9
 lJfr5KC8I9ZI72HVlwfJCmxFYdCnpvlEb8SM8
X-Google-Smtp-Source: AGHT+IHU7T7mETTa8o0eIAERX5Q/cpE4El91Q1zKhqhAZWti96HazCD976i3q3JmtZLa+HkARhuwHJyq8saSXRwQcCA=
X-Received: by 2002:a05:620a:40d2:b0:79c:1178:dc9d with SMTP id
 af79cd13be357-7a4e38410c4mr94180385a.24.1723488025574; Mon, 12 Aug 2024
 11:40:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Aug 2024 11:40:25 -0700
MIME-Version: 1.0
In-Reply-To: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
References: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 12 Aug 2024 11:40:25 -0700
Message-ID: <CAE-0n53qMJVbfb9oXbDexqhOj6qTBq9k5kMj1e6CXadObhBmLg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix the highest_bank_bit for sc7180
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
 dianders@chromium.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Quoting Abhinav Kumar (2024-08-08 16:52:27)
> sc7180 programs the ubwc settings as 0x1e as that would mean a
> highest bank bit of 14 which matches what the GPU sets as well.
>
> However, the highest_bank_bit field of the msm_mdss_data which is
> being used to program the SSPP's fetch configuration is programmed
> to a highest bank bit of 16 as 0x3 translates to 16 and not 14.
>
> Fix the highest bank bit field used for the SSPP to match the mdss
> and gpu settings.
>
> Fixes: 6f410b246209 ("drm/msm/mdss: populate missing data")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index d90b9471ba6f..faa88fd6eb4d 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -577,7 +577,7 @@ static const struct msm_mdss_data sc7180_data = {
>         .ubwc_enc_version = UBWC_2_0,
>         .ubwc_dec_version = UBWC_2_0,
>         .ubwc_static = 0x1e,
> -       .highest_bank_bit = 0x3,
> +       .highest_bank_bit = 0x1,

Usually when I see hex it's because there's a mask. This isn't a mask
though? Can it just be '1'?
