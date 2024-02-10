Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EACC8503AA
	for <lists+freedreno@lfdr.de>; Sat, 10 Feb 2024 10:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E00A10F130;
	Sat, 10 Feb 2024 09:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bNf6kIw4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56C710F077
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 09:35:04 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-604a05a36d2so18622797b3.0
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 01:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707557703; x=1708162503; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dEpHd/d4KaHqvCzlSHGoz778Kld92fS7hyAQuFB4M60=;
 b=bNf6kIw46Y+rnpZ3bw/juaCVIxOADDS5KrHFBGYJYnMxzx+r0MCp4oTJb18dpGDXvj
 megjU+ZEAXKhosgYZS7qSuJY+4sVmawIDJ1ITUqwLE/rPJgjQXkAOUJbqDZJtRS7A+sR
 ZKFLCN2Qto+zXgEjnQCDyU8yNN8qAyZ7u1mjEDoOA9RkqScCCH1ZWWiOjyvgDekxsmZs
 DGV7/Z3X3NjH+PCEP+DhrQaLHsHGWTMEodropIty+yz6hglCpWRsm/eMgO9fqhc72Z0A
 JZU/OkUm06wkmpisi2PyfxXP9xsaJkJa/fI3lpPGoKdBUmMFCEEhezE1717gjUcwDrvh
 uv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707557703; x=1708162503;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dEpHd/d4KaHqvCzlSHGoz778Kld92fS7hyAQuFB4M60=;
 b=XBTm7eUEs4dm4FcS+j4keb5sIixS7/17NssZd7i5/AtKdr1IJmLnGDQt1Qa0zth/3B
 7JOmcHqXwFP4ET6kUOMu1TQtDjK6AlYGIqiiqebg8bChnJHl51Jr595pb0z0zKM37nQc
 mQoOM3qdgnWtE2TSFt1V9SmY531M1rq+Z3/ZI0tRM2z+ybhTf3oZZQ3mF3cTwe45ndYU
 pItrcjhX1ZjAetu5PTC8fO0v87cYVFeTbdunPtuiwaHT69Za9tTU40OTTPCO8VtyUlZ/
 6mivngUzjQDFM6w03ftE/DK7Qna8I2CN2nynvXIF0LdzyXhpSZ++P10fXtb9neNui8LL
 RJIw==
X-Gm-Message-State: AOJu0YxjGocD7JpGkldo3ogkISd3NHmmBzJkVWBuDxreZL+kdYj0TDRQ
 +SjMG87uIVfqRuhPyjil4GoO4xmEoY8M23xJ/StiNZkChMCsnGOioyLdN2FYPm3jED7/JdwSrZA
 d2262fxonJEui6aEgkU/M5mZ2gX+Dzx86YUL/Ng==
X-Google-Smtp-Source: AGHT+IHZINcqoh7VJSls55En0G8Ld122qNvqzCK+iubyY4zv7d+eyNOxvYn9XnVZowiNLIt/ZRqq4EI0fwYNf0FbWfI=
X-Received: by 2002:a0d:d102:0:b0:5ff:bb43:2a69 with SMTP id
 t2-20020a0dd102000000b005ffbb432a69mr1472175ywd.40.1707557703603; Sat, 10 Feb
 2024 01:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-2-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-2-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:34:52 +0200
Message-ID: <CAA8EJpq9cnS5_ghL=8V8TU7do2i_-+TQEHUxcSzWdOUO7wHa3w@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] drm/msm/dpu: allow certain formats for CDM for DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> CDM block supports formats other than H1V2 for DP. Since we are now
> adding support for CDM over DP, relax the checks to allow all other
> formats for DP other than H1V2.
>
> Changes in v2:
>         - Add fixes tag
>         - Move patch to top of series
>
> Fixes: 0afac0ba6024 ("drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block")
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
