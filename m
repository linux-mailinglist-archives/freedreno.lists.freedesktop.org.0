Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429B68B3F73
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 20:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB8011A711;
	Fri, 26 Apr 2024 18:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gON9gs93";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317D011A711
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 18:36:39 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-de596c078c2so2115434276.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 11:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714156598; x=1714761398; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PfhKiSI78+JIcccpgJr34viq+IohAArFutcQbMmPLDk=;
 b=gON9gs93hKokSKMDik92vOp6Am9Isy0feyBVnraoiSq/HEKAg9EidknL/xSwD9rDpc
 uUiLWYY+41yczyjljNR/j2yByeB+ZKuuR55Pkfk3oLDlfoK0ix89NLTw+8mL+x8miRHZ
 cVVnF+AWubzEuVCqWstCvMpfeKaYfdOOJILeQsUkZ86U5ztZVfA/TWXQX2llVbt4jvZJ
 ZfJOU2BLHiSDRf3i+pI3lIgDWIHGJiZhMhSMuBGodLcFn0i/tWZTydoHlaMuvSxr7AEN
 SqbwbFpn9kAPvh58ZvYVgDmSrbknb9GJ+m0hndcbIeM8R8oJ8+tSAxzceg8KffLvexYn
 o2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714156598; x=1714761398;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PfhKiSI78+JIcccpgJr34viq+IohAArFutcQbMmPLDk=;
 b=eaU9JFGouRuU0GLSNY0c0uboiatrQiUk7IbWVnvRDprcdehsFihTRzFwrg2+Mxfb+c
 ND8c6o+47KrkE+mbs54YIkis9YRfkLzrXis1giAaXxtXOWsyXQO3LJUePC6LVpSgvUkJ
 JCA14NAghDpBscRh38BOksR4ONzaS9JkMW1j3fgqif2eVWHwI+j6TpquwkhCUteVhgix
 h4fJhaMqoTQYM1iVWFSOQ6VVi3XD1XpF5mcV/JFOkuy7Y6oCLk3JkViZLo+bVZLLueC9
 LoPm2fHvp6DjakdkS4FGvjg9ZtNngRO2NJkDT2bkwKHPP2oBxjXOGdGpgmMLUkNeciFl
 GGmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf9LnPQLCTRxNwz1WAb7gw8V7YGfAkrIE68mtutfGO5SPSm19A1WBiuv1A7FO78wyb571REaPDEOcYdjpiGkCS+n52HkKef9+3fJXZiLxc
X-Gm-Message-State: AOJu0YxwQeGw+E0eNbcGpyuWB6T1WFjg/6rtBJVFwPQRiOfQQGldcNeJ
 O4y9rNLSurZH43grKjPNJI5KI8jvhnqLJbMKoextzAxWj2lTSE4QzrGU7mOQ66z2ZDRh76qVndF
 ckeNnwG5j2Q9/5KkOgoOktPwwdgJLVyoH1suYrA==
X-Google-Smtp-Source: AGHT+IGRxa3W0lgYO1YxHtc9PrSoHPfAHJlkehTh6IfPv4AnhXZXP6F5xHNGt4rxS/gqBaEeHMiE6Osf3r+FXyv1SYw=
X-Received: by 2002:a25:2fd4:0:b0:dca:c369:fac2 with SMTP id
 v203-20020a252fd4000000b00dcac369fac2mr3878075ybv.3.1714156597887; Fri, 26
 Apr 2024 11:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
 <20240426-a750-raytracing-v2-1-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-1-562ac9866d63@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 21:36:26 +0300
Message-ID: <CAA8EJpoOJ4z9+SgWoCnKWY4Tq9aoX5z9f9S_KhHzo8o=GEuG+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: sm8650: Fix GPU cx_mem size
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org
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

On Fri, 26 Apr 2024 at 21:34, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> This is doubled compared to previous GPUs. We can't access the new
> SW_FUSE_VALUE register without this.
>
> Fixes: db33633b05c0 ("arm64: dts: qcom: sm8650: add GPU nodes")
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
