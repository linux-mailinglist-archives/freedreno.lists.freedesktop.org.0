Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 972DC730CFD
	for <lists+freedreno@lfdr.de>; Thu, 15 Jun 2023 04:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D731910E481;
	Thu, 15 Jun 2023 02:02:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B543210E0FE
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 02:02:24 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f764e9295dso2404190e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 19:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686794540; x=1689386540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yWURV6WhlNOJavnCVMftL3VNvBn19BVJFQP7jTmgUlQ=;
 b=ArrfkEDaBmcPXNaVY2jSil6n5a1beS0dAzgKkhBM9DC8N/08MJzw7c4Vdjex1oLRgW
 ZHZuQf9OyQfy+YmkO37VuHCF9erYw0MMt4L29trmfFWzKvCjSqyrFydWbyZvIbk4Jk/O
 9xO8n7rlmzfHs/7qtUkvGNfBqct8kuaZNFWHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686794540; x=1689386540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yWURV6WhlNOJavnCVMftL3VNvBn19BVJFQP7jTmgUlQ=;
 b=ZbqnGc6X4ILa0cNcBTeZWk2AFv6Of/c22wd2nQIRaVatIqO/UsGAhlUOJht66a3wgB
 eKGPrZ013UMQVEScQLfveCQp5QkrEY/101jgL0yrTrC3m5bsEkEcPuEzJNLxIPpFxkun
 mV3SAJB/bToHIXc4Iyqny6iQszwgiWcZLLGPFI35dZGGvvOgQFxPhaiT+13HigMwu7AT
 VC2fWSQQ2j7QjM/VD2OrB0NL4VXuitXzQ2xXPprNSmkVzE5efTF2jOqJ6ebkc1aerYvc
 PR2pxDBEOs2LaMpTXjW2NSYUuUuw8Z8mfYWK8HsrCcr5BABAWUAr5uucrx2fOemIOlC/
 GUdQ==
X-Gm-Message-State: AC+VfDwNGrR8WhtHe2mvPQh7DJrQ/dymfKi8D0VS9COTCLdrL3Eo0+sJ
 2gOUNRzPNu/+ywmKNodJ5lC6Z9uqxTASBcu6D7AzzY0E
X-Google-Smtp-Source: ACHHUZ5ZSmx2teuuyvj7N3gMlRLbLIEa3qLZcU5DrkF2PPTIMz+5tKb2hjMP6nqqMKclJoYmqmlZLw==
X-Received: by 2002:a2e:984e:0:b0:2b1:c5c5:192c with SMTP id
 e14-20020a2e984e000000b002b1c5c5192cmr7577406ljj.44.1686794539842; 
 Wed, 14 Jun 2023 19:02:19 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 c16-20020a2ea1d0000000b002b32600ab9fsm1734118ljm.60.2023.06.14.19.02.18
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 19:02:19 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4f14865fcc0so1775e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 19:02:18 -0700 (PDT)
X-Received: by 2002:a05:6512:79:b0:4f7:5f7d:2f9b with SMTP id
 i25-20020a056512007900b004f75f7d2f9bmr35250lfo.1.1686794538084; Wed, 14 Jun
 2023 19:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Jun 2023 19:02:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VoF0TKnC5Yuwmt90UZORCZonO3mS74T3X50Oz22TwT2A@mail.gmail.com>
Message-ID: <CAD=FV=VoF0TKnC5Yuwmt90UZORCZonO3mS74T3X50Oz22TwT2A@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] drm/msm/adreno: make adreno_is_a690()'s
 argument const
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jun 12, 2023 at 11:25=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Change adreno_is_a690() prototype to accept the const struct adreno_gpu
> pointer instead of a non-const one. This fixes the following warning:
>
> In file included from drivers/gpu/drm/msm/msm_drv.c:33:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h: In function =E2=80=98adreno_is_a=
660_family=E2=80=99:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h:303:54: warning: passing argument=
 1 of =E2=80=98adreno_is_a690=E2=80=99 discards =E2=80=98const=E2=80=99 qua=
lifier from pointer target type [-Wdiscarded-qualifiers]
>   303 |         return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adre=
no_is_7c3(gpu);
>
> Fixes: 1b90e8f8879c ("drm/msm/adreno: change adreno_is_* functions to acc=
ept const argument")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
