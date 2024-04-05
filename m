Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9267489937A
	for <lists+freedreno@lfdr.de>; Fri,  5 Apr 2024 04:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589CE1137CF;
	Fri,  5 Apr 2024 02:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yCaKM2h0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0821137DC
 for <freedreno@lists.freedesktop.org>; Fri,  5 Apr 2024 02:56:31 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dcc71031680so1741689276.2
 for <freedreno@lists.freedesktop.org>; Thu, 04 Apr 2024 19:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712285790; x=1712890590; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dEsqNh0qk6wjxNfe1EBS/5T4PtCYN6iMohqr+1wRzko=;
 b=yCaKM2h0QQgivsavZjFRjoBBFDO2Jnt+8QrWTSigTFayF/JeHdVW8AZIM33vL5/B1v
 d7CCMbGmf+C6LWrfG4Sp91bYy8/j074lzLp8VAxI2EBnU2snyIqtpPyndrlPRjzznTi3
 5AUGVnoFcxuxzxnmIS64mZjYG2Ej5Dyq03ulJi6WBZZOx9bpOToPuZ9+CkNshnGb9iN6
 lr2HQpsaBsJpCzF6BF6QcRHo+w6XhuETKv7HUqMYPtlfIQa7GJ1Hwx1YKhIzEtrAsy6z
 drcMc7Wy8CHNqTTdPC7MLwNs4wfTUsSfN18xwidQm5klVJ31iTA24XE4FDZqN8ckc5+P
 CUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712285790; x=1712890590;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dEsqNh0qk6wjxNfe1EBS/5T4PtCYN6iMohqr+1wRzko=;
 b=arOwPG+wiP4VyVliFWrRJrfYm33yZ3dVh1GTyjsMa8lE5uGsIYFPnlC66W4kWBMm+W
 NPpg7n+I+ENXfELdt++rkWXiCaz/0M/KlcJUrW0/X1WED7Wf2et77iBBdLY+ihCnkEoN
 iqbyXtaPPa2z5mMYnHNOcEbm9aM5NIurTzuaGy84WdkFnd5lnPLXyLjEq8rmaxaH+FPM
 eVkxconY8PILC4nx7n76HnfX8phie1e7biNdBHcTSZXtVq7TR1ZmPfpnp9HosZeuY593
 LtKnQQ/sFY8RuU/T6Ua1J6CfCu7T5eEbdlE/XZdA4GlXQIPA20IzbY6X+ADu0YJfNDKe
 pKJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Dy+IdSNcu+Nt5g5tZHcywuYxTNdVdarHV6FJrTlll4hhFKnWZWa0PUvhHPJTWWKwCByeJIpnVVFJiWa4B3pMCn/fguqVKoy31Ijyc7MJ
X-Gm-Message-State: AOJu0Yx6qZBFyZJsSxPzv3zgKMT0Dm5ggEcl9aBX0PDL57Cp7Pfy75qp
 vZ8bzBhyns4v8Len7QoBbbYLYQK4kWAMrrl22SoumKRZJs7D4QVS0bC4YZgpez7Enxv5yUADBfQ
 izBRo+kx0wvpPus5Xz0j9e5auFPJaQhEjBFZnig==
X-Google-Smtp-Source: AGHT+IG4u2Lg5AEQseN8XhnyCdvNikS9yjicoQQjhDBxxVZhO/lMnvhSuSj5pAzYdpOCxOv9gcRM1CyMxY7VDXAbmhM=
X-Received: by 2002:a25:aace:0:b0:dcc:c279:d2fa with SMTP id
 t72-20020a25aace000000b00dccc279d2famr88256ybi.30.1712285790527; Thu, 04 Apr
 2024 19:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240405000111.1450598-1-swboyd@chromium.org>
In-Reply-To: <20240405000111.1450598-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 05:56:19 +0300
Message-ID: <CAA8EJppHXkTNSNaCoYWZaRmKw=AfWL4N0WCqR6uFgNdbkw4VUw@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom: qmp-combo: Fix register base for
 QSERDES_DP_PHY_MODE
To: Stephen Boyd <swboyd@chromium.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-phy@lists.infradead.org, 
 freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Steev Klimaszewski <steev@kali.org>, 
 Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
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

On Fri, 5 Apr 2024 at 03:01, Stephen Boyd <swboyd@chromium.org> wrote:
>
> The register base that was used to write to the QSERDES_DP_PHY_MODE
> register was 'dp_dp_phy' before commit 815891eee668 ("phy:
> qcom-qmp-combo: Introduce orientation variable"). There isn't any
> explanation in the commit why this is changed, so I suspect it was an
> oversight or happened while being extracted from some other series.
> Oddly the value being 0x4c or 0x5c doesn't seem to matter for me, so I
> suspect this is dead code, but that can be fixed in another patch. It's
> not good to write to the wrong register space, and maybe some other
> version of this phy relies on this.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Cc: Steev Klimaszewski <steev@kali.org>
> Cc: Johan Hovold <johan+linaro@kernel.org>
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> Fixes: 815891eee668 ("phy: qcom-qmp-combo: Introduce orientation variable")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
