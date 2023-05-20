Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F8C70ABB0
	for <lists+freedreno@lfdr.de>; Sun, 21 May 2023 01:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD8D10E083;
	Sat, 20 May 2023 23:56:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A5110E00F
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 23:56:26 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f3b337e842so1566407e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 16:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684626985; x=1687218985;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wb9lShLun3nEYAnIYIuQSine2uABBggnzlUt4NwznXc=;
 b=f97YpCLJHsIayIRsaHW5XHNZftV/hgsO9/vP8REWiVDeBINO7yE+yOlelfzCMiTFLO
 IIxU8PiBJnK5wKCVpYTiBgtBIzw74dK94xEMCOuuvs7YeVsPEQXyaonT4PLYnWnJ8OK/
 neHZqVcpMT1bLA4/9YY38oiEayQ92sc5Y//UEFBMI3Ixv5czz4eicvq268xQdfD7yyb8
 9dWeA0MS7TCrGAawEY5EUsIbzoxkdfUgEK9/ABoZ2R74T2rwyWfPPJtcpLpgnmTjElqk
 QP1w8HnelMT2HnS4Dqs2pMhl3A0ATYYiSGUxtBmQ112QqYREQ828s9I9YvqdEvi0CW1/
 gIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684626985; x=1687218985;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wb9lShLun3nEYAnIYIuQSine2uABBggnzlUt4NwznXc=;
 b=aQe++wqrInt07xHVN9IMnjU31Jwo4fmzo8CdnJgVcAvONQnq3sD6v8tUnM7KZfteEv
 ETZ1BaNjUC45g59VcujG3MABYne8lqSUcW7NaIPwZoAhRySKVPcmvumEQ+5iVXSYePDG
 /n6zNE3P9wRM1PpUaOpla6K/DWfQhYgZ9+DtpSn4Z9QcT8tnc8HG4GkWOMDWJ5ohRN5O
 JwU839mcsRMh6ckVxsnIil+IpyBjGLbOucKHEDnStolEb0LSk7nrfMgJ4PqmHsRckfY2
 9tsLLpA3MYFMspiEq6D5SmtbN9+3PIQAvlR2XAZvTFM/RJCKa833QngongsT90bW+ezu
 3reQ==
X-Gm-Message-State: AC+VfDxQ6nHgE5VEJNK9YmOEJNrjnSVEpjKNh1XA7WmDXaPv2e7rOYn3
 qzZk0lFpnz2mjTAPHKA2lpmZnQ==
X-Google-Smtp-Source: ACHHUZ40fx2kgmpNmOHZxxIAKGj4pcPOVS5P5WN9Hm44MI9cAhLdztufK9WoNS7Db2sKdYt2np7qoA==
X-Received: by 2002:ac2:5a02:0:b0:4ea:fabb:4db1 with SMTP id
 q2-20020ac25a02000000b004eafabb4db1mr1992492lfn.1.1684626984590; 
 Sat, 20 May 2023 16:56:24 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f23-20020ac251b7000000b004f3b264ad16sm419874lfk.95.2023.05.20.16.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 May 2023 16:56:23 -0700 (PDT)
Message-ID: <dcd02712-fdf0-9019-bb54-1032fa8ee3dd@linaro.org>
Date: Sun, 21 May 2023 02:56:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Johan Hovold <johan+linaro@kernel.org>, Joel@pengutronix.de,
 Fernandes@pengutronix.de, Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Liu Shixin <liushixin2@huawei.com>, Douglas Anderson
 <dianders@chromium.org>, Miaoqian Lin <linmq006@gmail.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-32-u.kleine-koenig@pengutronix.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230507162616.1368908-32-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 31/53] drm/msm: Convert to platform remove
 callback returning void
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/05/2023 19:25, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert the msm drm drivers from always returning zero in the
> remove callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 5 ++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 6 ++----
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c   | 6 ++----
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 5 ++---
>   drivers/gpu/drm/msm/dp/dp_display.c        | 6 ++----
>   drivers/gpu/drm/msm/dsi/dsi.c              | 6 ++----
>   drivers/gpu/drm/msm/hdmi/hdmi.c            | 6 ++----
>   drivers/gpu/drm/msm/hdmi/hdmi_phy.c        | 6 ++----
>   drivers/gpu/drm/msm/msm_drv.c              | 6 ++----
>   drivers/gpu/drm/msm/msm_mdss.c             | 6 ++----
>   10 files changed, 20 insertions(+), 38 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

